#!#############################################################################
#! File:    vc6bdll.t
#! Purpose: tmake template file from which wxBaseDll.dsp is generated by running
#!          tmake -t vc6bdll wxwin.pro -o wxBaseDll.dsp
#! Author:  Vadim Zeitlin
#! Created: 22.03.00
#! Version: $Id$
#!#############################################################################
#${
    #! include the code which parses filelist.txt file and initializes
    #! %wxCommon, %wxGeneric and %wxMSW hashes.
    IncludeTemplate("filelist.t");

    #! now transform these hashes into $project tags
    foreach $file (sort keys %wxCommon) {
        next if $wxCommon{$file} !~ /\bB\b/;

        my $tag = $file =~ /\.c$/ ? "WXCSRCS" : "WXCOMMONSRCS";
        $project{$tag} .= $file . " "
    }

    foreach $file (sort keys %wxMSW) {
        next if $wxMSW{$file} !~ /\bB\b/;

        my $tag = $file =~ /\.c$/ ? "WXMSWCSRCS" : "WXMSWSRCS";
        $project{$tag} .= $file . " "
    }

    foreach $file (sort keys %wxBase) {
        my $tag = $file =~ /\.c$/ ? "WXCSRCS" : "WXCOMMONSRCS";
        $project{$tag} .= $file . " "
    }
#$}
# Microsoft Developer Studio Project File - Name="wxBaseDll" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=wxBaseDll - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "wxBaseDll.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "wxBaseDll.mak" CFG="wxBaseDll - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wxBaseDll - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wxBaseDll - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "wxBaseDll - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "BaseDllRelease"
# PROP Intermediate_Dir "BaseDllRelease"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "WXBASEDLL_EXPORTS" /YX /FD /c
# ADD CPP /nologo /MT /W4 /O2 /I "$(wx)\include" /I "$(wx)\src\zlib" /D "NDEBUG" /D wxUSE_GUI=0 /D "__WIN95__" /D "WIN32" /D "_WIN32" /D WINVER=0x400 /D "__WINDOWS__" /D "__WIN32__" /D "__WXMSW__" /D "_MT" /D "WXMAKINGDLL" /Yu"wx/wxprec.h" /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /i "$(wx)\include" /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /machine:I386
# ADD LINK32 kernel32.lib user32.lib advapi32.lib wsock32.lib /nologo /version:2.2 /dll /machine:I386

!ELSEIF  "$(CFG)" == "wxBaseDll - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "BaseDllDebug"
# PROP Intermediate_Dir "BaseDllDebug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "WXBASEDLL_EXPORTS" /YX /FD /GZ /c
# ADD CPP /nologo /MTd /W4 /Gm /ZI /Od /I "$(wx)\include" /I "$(wx)\src\zlib" /D "_DEBUG" /D wxUSE_GUI=0 /D "__WIN95__" /D "WIN32" /D "_WIN32" /D WINVER=0x400 /D "__WINDOWS__" /D "__WIN32__" /D "__WXMSW__" /D "_MT" /D "WXMAKINGDLL" /D "__WXDEBUG__" /Yu"wx/wxprec.h" /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /i "$(wx)\include" /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept
# ADD LINK32 kernel32.lib user32.lib advapi32.lib wsock32.lib /nologo /version:2.2 /dll /debug /machine:I386 /pdbtype:sept

!ENDIF 

# Begin Target

# Name "wxBaseDll - Win32 Release"
# Name "wxBaseDll - Win32 Debug"
# Begin Source File

SOURCE=.\src\msw\dummydll.cpp
# ADD CPP /Yc"wx/wxprec.h"
# End Source File
#$ ExpandGlue("WXCOMMONSRCS", "# Begin Source File\n\nSOURCE=.\\src\\common\\", "\n# End Source File\n# Begin Source File\n\nSOURCE=.\\src\\common\\", "\n# End Source File\n");
#$ ExpandGlue("WXMSWSRCS", "# Begin Source File\n\nSOURCE=.\\src\\msw\\", "\n# End Source File\n# Begin Source File\n\nSOURCE=.\\src\\msw\\", "\n# End Source File\n");
#$ ExpandGlue("WXCSRCS", "# Begin Source File\n\nSOURCE=.\\src\\common\\", "\n# SUBTRACT CPP /YX /Yc /Yu\n# End Source File\n# Begin Source File\n\nSOURCE=.\\src\\common\\", "\n# SUBTRACT CPP /YX /Yc /Yu\n# End Source File\n");
#$ ExpandGlue("WXMSWCSRCS", "# Begin Source File\n\nSOURCE=.\\src\\msw\\", "\n# SUBTRACT CPP /YX /Yc /Yu\n# End Source File\n# Begin Source File\n\nSOURCE=.\\src\\msw\\", "\n# SUBTRACT CPP /YX /Yc /Yu\n# End Source File\n");
# End Target
# End Project
