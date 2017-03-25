solution ("DOSBox_" .. _ACTION)
  configurations { "Debug", "Release" }
  platforms { "x32" }

  system "windows"

  filter "configurations:x32"
    architecture "x32"


  -- -------------------------------------------------------------
  function DefaultOutputDirs()

    objdir      ("$build/")
    targetdir   "$output/%{cfg.shortname}"
    debugdir    ("$(OutDir)")

  end

  -- -------------------------------------------------------------
  function DefaultBuildConfiguration()

    buildoptions 
    { 
      "/wd4146", 
      "/wd4244",
    }

    flags
    {
      "NoMinimalRebuild",
      "NoEditAndContinue",
      "MultiProcessorCompile"
    }
    rtti "On"
    characterset "MBCS"

    defines 
    { 
      "WIN32", 
      "WINVER=0x0600",
      "_CRT_SECURE_NO_WARNINGS" 
    }

    filter "platforms:x32"
      vectorextensions     "SSE4.1"

    filter "configurations:Debug"
      defines   { "DEBUG" }
      symbols "On"

    filter "configurations:Release"
      defines   { "NDEBUG" }
      flags     { "LinkTimeOptimization" }
      optimize  "Full"

  end


  -- -------------------------------------------------------------
  project ("sdl_" .. _ACTION)
    language "C"
    kind     "StaticLib"

    -- just yanked the list out of the SDL vcproj
    files 
    {
      "SDL-1.2.15/src/SDL.c",
      "SDL-1.2.15/src/events/SDL_active.c",
      "SDL-1.2.15/src/audio/SDL_audio.c",
      "SDL-1.2.15/src/audio/SDL_audio_c.h",
      "SDL-1.2.15/src/audio/SDL_audiocvt.c",
      "SDL-1.2.15/src/audio/SDL_audiomem.h",
      "SDL-1.2.15/src/video/SDL_blit.c",
      "SDL-1.2.15/src/video/SDL_blit.h",
      "SDL-1.2.15/src/video/SDL_blit_0.c",
      "SDL-1.2.15/src/video/SDL_blit_1.c",
      "SDL-1.2.15/src/video/SDL_blit_A.c",
      "SDL-1.2.15/src/video/SDL_blit_A.h",
      "SDL-1.2.15/src/video/SDL_blit_N.c",
      "SDL-1.2.15/src/video/SDL_bmp.c",
      "SDL-1.2.15/src/cdrom/SDL_cdrom.c",
      "SDL-1.2.15/src/cpuinfo/SDL_cpuinfo.c",
      "SDL-1.2.15/src/video/SDL_cursor.c",
      "SDL-1.2.15/src/video/SDL_cursor_c.h",
      "SDL-1.2.15/src/audio/windib/SDL_dibaudio.c",
      "SDL-1.2.15/src/audio/windib/SDL_dibaudio.h",
      "SDL-1.2.15/src/video/windib/SDL_dibevents.c",
      "SDL-1.2.15/src/video/windib/SDL_dibevents_c.h",
      "SDL-1.2.15/src/video/windib/SDL_dibvideo.c",
      "SDL-1.2.15/src/video/windib/SDL_dibvideo.h",
      "SDL-1.2.15/src/audio/disk/SDL_diskaudio.c",
      "SDL-1.2.15/src/audio/disk/SDL_diskaudio.h",
      "SDL-1.2.15/src/audio/dummy/SDL_dummyaudio.c",
      "SDL-1.2.15/src/audio/dummy/SDL_dummyaudio.h",
      "SDL-1.2.15/src/audio/windx5/SDL_dx5audio.c",
      "SDL-1.2.15/src/audio/windx5/SDL_dx5audio.h",
      "SDL-1.2.15/src/video/Windx5/SDL_dx5events.c",
      "SDL-1.2.15/src/video/Windx5/SDL_dx5events_c.h",
      "SDL-1.2.15/src/video/Windx5/SDL_dx5video.c",
      "SDL-1.2.15/src/video/Windx5/SDL_dx5video.h",
      "SDL-1.2.15/src/video/windx5/SDL_dx5yuv.c",
      "SDL-1.2.15/src/video/windx5/SDL_dx5yuv_c.h",
      "SDL-1.2.15/src/SDL_error.c",
      "SDL-1.2.15/src/SDL_error_c.h",
      "SDL-1.2.15/src/events/SDL_events.c",
      "SDL-1.2.15/src/events/SDL_events_c.h",
      "SDL-1.2.15/src/events/SDL_expose.c",
      "SDL-1.2.15/src/SDL_fatal.c",
      "SDL-1.2.15/src/SDL_fatal.h",
      "SDL-1.2.15/src/video/SDL_gamma.c",
      "SDL-1.2.15/src/stdlib/SDL_getenv.c",
      "SDL-1.2.15/src/stdlib/SDL_iconv.c",
      "SDL-1.2.15/src/joystick/SDL_joystick.c",
      "SDL-1.2.15/src/joystick/SDL_joystick_c.h",
      "SDL-1.2.15/src/events/SDL_keyboard.c",
      "SDL-1.2.15/src/video/SDL_leaks.h",
      "SDL-1.2.15/src/video/wincommon/SDL_lowvideo.h",
      "SDL-1.2.15/src/stdlib/SDL_malloc.c",
      "SDL-1.2.15/src/audio/SDL_mixer.c",
      "SDL-1.2.15/src/audio/SDL_mixer_MMX_VC.c",
      "SDL-1.2.15/src/joystick/win32/SDL_mmjoystick.c",
      "SDL-1.2.15/src/events/SDL_mouse.c",
      "SDL-1.2.15/src/video/dummy/SDL_nullevents.c",
      "SDL-1.2.15/src/video/dummy/SDL_nullevents_c.h",
      "SDL-1.2.15/src/video/dummy/SDL_nullmouse.c",
      "SDL-1.2.15/src/video/dummy/SDL_nullmouse_c.h",
      "SDL-1.2.15/src/video/dummy/SDL_nullvideo.c",
      "SDL-1.2.15/src/video/dummy/SDL_nullvideo.h",
      "SDL-1.2.15/src/video/SDL_pixels.c",
      "SDL-1.2.15/src/video/SDL_pixels_c.h",
      "SDL-1.2.15/src/stdlib/SDL_qsort.c",
      "SDL-1.2.15/src/events/SDL_quit.c",
      "SDL-1.2.15/src/events/SDL_resize.c",
      "SDL-1.2.15/src/video/SDL_RLEaccel.c",
      "SDL-1.2.15/src/video/SDL_RLEaccel_c.h",
      "SDL-1.2.15/src/file/SDL_rwops.c",
      "SDL-1.2.15/src/stdlib/SDL_stdlib.c",
      "SDL-1.2.15/src/video/SDL_stretch.c",
      "SDL-1.2.15/src/video/SDL_stretch_c.h",
      "SDL-1.2.15/src/stdlib/SDL_string.c",
      "SDL-1.2.15/src/video/SDL_surface.c",
      "SDL-1.2.15/src/audio/SDL_sysaudio.h",
      "SDL-1.2.15/src/cdrom/win32/SDL_syscdrom.c",
      "SDL-1.2.15/src/cdrom/SDL_syscdrom.h",
      "SDL-1.2.15/src/thread/generic/SDL_syscond.c",
      "SDL-1.2.15/src/video/wincommon/SDL_sysevents.c",
      "SDL-1.2.15/src/events/SDL_sysevents.h",
      "SDL-1.2.15/src/joystick/SDL_sysjoystick.h",
      "SDL-1.2.15/src/loadso/win32/SDL_sysloadso.c",
      "SDL-1.2.15/src/video/wincommon/SDL_sysmouse.c",
      "SDL-1.2.15/src/video/wincommon/SDL_sysmouse_c.h",
      "SDL-1.2.15/src/thread/win32/SDL_sysmutex.c",
      "SDL-1.2.15/src/thread/win32/SDL_syssem.c",
      "SDL-1.2.15/src/thread/win32/SDL_systhread.c",
      "SDL-1.2.15/src/thread/SDL_systhread.h",
      "SDL-1.2.15/src/thread/win32/SDL_systhread_c.h",
      "SDL-1.2.15/src/timer/win32/SDL_systimer.c",
      "SDL-1.2.15/src/timer/SDL_systimer.h",
      "SDL-1.2.15/src/video/SDL_sysvideo.h",
      "SDL-1.2.15/src/video/wincommon/SDL_syswm.c",
      "SDL-1.2.15/src/video/wincommon/SDL_syswm_c.h",
      "SDL-1.2.15/src/thread/SDL_thread.c",
      "SDL-1.2.15/src/thread/SDL_thread_c.h",
      "SDL-1.2.15/src/timer/SDL_timer.c",
      "SDL-1.2.15/src/timer/SDL_timer_c.h",
      "SDL-1.2.15/src/video/SDL_video.c",
      "SDL-1.2.15/src/video/windib/SDL_vkeys.h",
      "SDL-1.2.15/src/audio/SDL_wave.c",
      "SDL-1.2.15/src/audio/SDL_wave.h",
      "SDL-1.2.15/src/video/wincommon/SDL_wingl.c",
      "SDL-1.2.15/src/video/wincommon/SDL_wingl_c.h",
      "SDL-1.2.15/src/video/SDL_yuv.c",
      "SDL-1.2.15/src/video/SDL_yuv_sw.c",
      "SDL-1.2.15/src/video/SDL_yuv_sw_c.h",
      "SDL-1.2.15/src/video/SDL_yuvfuncs.h",
      "SDL-1.2.15/src/video/wincommon/Wmmsg.h",
      "SDL-1.2.15/src/Main/Win32/SDL_win32_main.c"
    }
    includedirs
    {
      "SDL-1.2.15/include/"
    }

    DefaultOutputDirs()
    DefaultBuildConfiguration()

  -- -------------------------------------------------------------
  project ("zlib_" .. _ACTION)
    language "C"
    kind     "StaticLib"

    files 
    {
      "zlib-1.2.11/**.c",
      "zlib-1.2.11/**.h"
    }

    DefaultOutputDirs()
    DefaultBuildConfiguration()

  -- -------------------------------------------------------------
  project ("pdcurs_" .. _ACTION)
    language "C"
    kind     "StaticLib"

    files 
    {
      "pdcurs34/*.h",
      "pdcurs34/pdcurses/*.c",
      "pdcurs34/win32/**.c",
      "pdcurs34/win32/**.h",
    }
    includedirs
    {
      "pdcurs34/"
    }

    DefaultOutputDirs()
    DefaultBuildConfiguration()

  -- -------------------------------------------------------------
  project ("DOSBox_" .. _ACTION)
    language "C++"
    kind     "WindowedApp"

    targetname ( "DOSBox" )
    
    files 
    {
      "dosbox-config/*.h",
      "dosbox-config/*.rc",
      "dosbox-0.74/src/**.cpp",
      "dosbox-0.74/src/**.h",
    }
    excludes 
    { 
      "dosbox-0.74/src/platform/visualc/*.*",
    }

    includedirs
    {
      "dosbox-config/",
      "dosbox-0.74/include/",
      "zlib-1.2.11/",
      "SDL-1.2.15/include/",
      "pdcurs34/"
    }

    defines 
    { 
        "DB_VERSION=\"0.74-slave\""
    }

    links
    {
      "ws2_32",
      "opengl32",
      "winmm",
      "dxguid.lib",

      "zlib_" .. _ACTION,
      "sdl_" .. _ACTION,
      "pdcurs_" .. _ACTION,
    }

    filter "configurations:Debug"
      defines   { "C_DEBUG=1" }
      targetname ( "DOSBox_debugger" )

    filter "configurations:Release"
      defines   { "C_DEBUG=0" }

    filter {}

    DefaultOutputDirs()
    DefaultBuildConfiguration()
    