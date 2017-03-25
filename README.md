# DOSBox:Slave

A fork of [DOSBox 0.74](http://www.dosbox.com/) for a personal project.

This switches project generation switched to [Premake](premake.github.io) and by default generates for *Visual Studio 2017*.

It is bundled with `SDL 1.2.15` and `zlib 1.2.11` and builds with no further steps required. Run premake and build.

Note that in *Debug*, we build with the full DOSBox visual debugging component, hence the inclusion of `pdcurs`.

- - -

The focus of the project is "slave" mode, where a calling process can dispatch a **silent, renderless** DOSBox instance with a stream of CMD operations, eg:

- mount local paths to C:\
- run a build process, eg. HIGHC or MASM 6 on files inside that mount point
- capture and extract the results of any operations, passing back to the owner process

In this way, we can use DOSBox as an automatable DOS executable container:

`DOSBox -conf common.txt -conf autoexec.txt -slave > results.txt`

A new shell command, `EMIT [ON|OFF]`, is added to control what gets exported to stdout. By default, everything is silenced.

Example `autoexec.conf`
```
[autoexec]
REM attach local storage as C drive
mount c S:\DOSBOX\MountC

REM add Pharlap and Metaware High C to the PATH
path Z:\;C:\phar386\bin;C:\HIGHC303\BIN

C:
CD NX_SDK\\KXP

mkdir 386

REM start capturing output, run compiler
EMIT ON

hc386 BOUNCE.C -c -o 386\BOUNCE.obj -w2 -f387 -Hloclib -I..\INCLUDE

exit
```

Using the example execution above, DOSBox will run through this command set with no display or pop-up, writing the last fragment and execution results into `results.txt`

```
C:\NX_SDK\KXP>hc386 BOUNCE.C -c -o 386\BOUNCE.obj -w2 -f387 -Hloclib -I..\INCLUDE
MetaWare High C Compiler R3.03  Serial 1-799999.
(c) Copyright 1987-92, MetaWare Incorporated
w "BOUNCE.C",L52/C2(#67):       switch statement has no cases.
No errors   4 warnings   
```

.. which can then be trivially parsed by a calling process