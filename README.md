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

In this way, we can use DOSBox as an automatable DOS executable container, ideally:

`DOSBox-slave -conf common.txt -conf autoexec.txt > results.txt`

