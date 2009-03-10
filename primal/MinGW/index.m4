divert(-1)
define(_TITLE, `GAMMA Builds Using MinGW')
define(_PRIMALDIR, `..')

define(_DOCDIR, `../../doc')
define(_DIRDIR, `../../doc/directories')

define(_TOPFONTSIZE,  6)
define(_TOPNAME, MinGW<BR>Build & Targets)
define(_CREATION,    `September 23 2002')
define(_CGIDOCNAME,  `mingw')
define(_KEYWORDS,    ``
  <META name="keywords" content="NMR, ESR, EMR, MRI, FID, resonance, science, education, simulation">'')
define(_DESCRIPTION, `
  <META name="description" content="GAMMA Builds Using MinGW and MSys.">')
define(_JAVASCRIPT, `')
define(_SUBDIR, mingw)


define(_PAGEHTML,
      <TABLE border=0 valign="top">
        <TR>
          <TD valign=top>
            <BLOCKQUOTE><STRONG><FONT SIZE="-1">
            This page is tailored for building and using GAMMA on a Windows based PC using
            the tools and GCC C++ compiler provided with <A HREF="_MINGW">MinGW and MSys</A>.
            The GAMMA libraries produced should be portable to any Windows based system as
            should any GAMMA based progam executables. 
            </FONT></STRONG></BLOCKQUOTE>

            This directory contains a hand-built Makefile for the build of Windows based
            GAMMA libraries (static and DLL) using <A HREF="_MINGW">MinGW</A>``,''
            Minimalist GNU for Windows.  You MUST have the <A HREF="_MINGW">MinGW</A>`,' 
            and preferably MSYS`,' on your computer PC system before these files will be
            of any direct use to you.  Note that the installation of MinGW/MSys 
            will not have any adverse affect on existing compiler (e.g. CygWin`,' MSVC++`,'
            Borland) and may be easily removed as needed.
<!---
            <P>
            Additionally`,' for PyGAMMA you must have both 
            <A HREF="_PYTHON">Python</A> and <A HREF="_BOOST_PYTHON">Boost.Python</A> on the system. 
            The Python should be that specifically for Windows (not CygWin) and Boost.Python should
            have been built with MinGW.  More information of 
            <A HREF = "_DOCDIR/pygamma/python/mingw/index.html">Setting Up Python</A> and
            <A HREF = "_DOCDIR/pygamma/boostmingw/index.html">Setting Up Boost.Python</A> for MinGW
            is available in local GAMMA documentation if needed.
--->
            <P>
            MinGW provides a small amount of Unix-like tools to Windows based PCs`,' including 
            make`,' gcc`,' and gdb. MSYS adds to this by providing a bash shell which sets up a 
            small Unix-like environment that includes even more Unix tools. Within such a shell 
            the system has the look and feel of Unix.

            <P>
              <OL>
              <TABLE align=center>
                <TR>
                <TH align=center colspan=2>Document Sections</TH>
                </TR>
                <TR> <TD><LI><A HREF="#QUICK">Quick Build Instructions</A></TD>
                     <TD><LI><A HREF="#SHELL">The MinGW/MSys Shell</A></TD>     </TR>
                <TR> <TD><LI><A HREF="#BUILD">About The Build</A></TD> 
                     <TD><LI><A HREF="#DEMO">About The Demos And Tests</A></TD> </TR>
                <TR> <TD><LI><A HREF="#INSTALL">About The Instalaltion</A></TD> 
                     <TD><LI><A HREF="#PYGAMMA">About PyGAMMA</A></TD> </TR>
                <TR> <TD><LI><A HREF="#NOTES">Additional Notes</A></TD> <TD>&nbsp;</TD></TR>
              </TABLE>
              </OL>
            <P>
            Why does this Makefile exist? There may be times where the main GAMMA Makefile fails`,'
            either because it has a bug`,' it is not up to date with the latest GNU software`,' or
            it is not supported on a particular OS/compiler combination. This makefile is a vastly
            simplified version of the main GAMMA makefile. If it does not work`,' at least it can
            be used as a guide to build a working Makefile. At the time this page was written`,'
            the current version of MinGW contains both GCC 3.2 (mingw special 20020817-1).
            Builds of GAMMA using this MinGW primal Makefile were successfully accomplished using it.

            <P>
            <HR>
            <P>
            <CENTER><FONT SIZE="+2"><A NAME="QUICK">Quick Build Instructions</A></FONT>
                    <BR>
                    <FONT SIZE="+1">(Assumes GAMMA Sources`,' MinGW`,' & MSys Installed)</FONT>
            </CENTER>
          </TD>
        </TR>
        <TR>
          <TD>
            <TABLE align="CENTER">
              <TR><TD><IMG SRC="../figs/win.gif"></TD><TD>1.`)' Open a bash shell: Provided with MinGW/MSys</TD></TR>
              <TR><TD><IMG SRC="../figs/mgw.gif"></TD><TD>2.`)' Change into this directory: <EM>cd GAMMAVER/primal/MinGW</EM></TD></TR>
              <TR><TD><IMG SRC="../figs/mgw.gif"></TD><TD>3.`)' Run <EM>make clean</EM> to clean previous files</EM></TD></TR>
              <TR><TD><IMG SRC="../figs/mgw.gif"></TD><TD>4.`)' Run make to build static lib. & DLLs: <EM>make</EM></TD></TR>
              <TR><TD><IMG SRC="../figs/mgw.gif"></TD><TD>5.`)' Run <EM>make install</EM> to use this build as your GAMMA</TD></TR>
              <TR><TH colspan=2>Optional Cleanup`,' Demos`,' & Testing<TH></TR>
              <TR><TD><IMG SRC="../figs/mgw.gif"></TD><TD>5.`)' Run make to clean: <EM>make clean</EM></TD></TR>
              <TR><TD><IMG SRC="../figs/mgw.gif"></TD><TD>6.`)' Run make to build demo program <EM>make demo</EM></TD></TR>
              <TR><TD><IMG SRC="../figs/mgw.gif"></TD><TD>7.`)' Run make to build test program <EM>make test</EM></TD></TR>
              <TR><TD valign="top"><IMG SRC="../figs/mgw.gif"></TD><TD>8.`)' Run make to clean: <EM>make clean</EM></TD></TR>
            </TABLE>
	    <FONT SIZE="-1">
              &nbsp;<BR>
              The target <EM>make dll</EM> can be used in step 4 to build only the GAMMA dll.
              Similarly <EM>make lib</EM> would build only the GAMMA static library 
<!---
              and <EM>make pyg</EM> would build only the PyGAMMA DLL. 
--->
              Often the static library is not desired because the DLL is essentially equivalent
              and typically much better to use as it makes smaller executables. 
             </FONT>
          </TD>
        </TR>
        <TR>
          <TD>
            <P>
            <HR>
            <P>
            <CENTER><FONT SIZE="+2"><A NAME="SHELL">The MinGW/MSys Command Shell</A></FONT>
          </TD>
        </TR>
        <TR>
          <TD>
            If both MinGW and MSys have been installed on the system the user will have an
            bash shell avaialable in which commands `('i.e. the make commands to build GAMMA
            and the commands to run GAMMA programs`)' can be issued. The following image is how
            this shell appears on one of my systems.  Within the shell the MinGW environment
            is set up so that programs may find the proper executables`,' libraries`,' and headers.
            <BR>&nbsp;
            <CENTER><IMG SRC="../figs/msyswindow.gif"></CENTER>
        </TR>
        <TR>
          <TD>
            <P>
            <HR>
            <P>
            <CENTER><FONT SIZE="+2"><A NAME="BUILD">About The Build</A></FONT>
          </TD>
        </TR>
        <TR>
          <TD>
            The main target <EM>make</EM> will attempt to build GAMMA as both a static library and a DLL. 
            It will also try to build a PyGAMMA DLL used for running GAMMA interactively under Python.
            These libraries will automatically placed into a MinGW binaries directory within the GAMMA
            directory hierarchy`,' <EM>../../i686-pc-mingw32</EM>. As the GAMMA code files (*.cc) are 
            compiled into object files (*.o or *.po) they will also be placed into this same binaries
            directory. The MinGW binaries directory is the same one which the main GAMMA Makefile
            would use if properly configured`,' run`,' and working in the bash shell provided by MSys.
            The object files may be safely removed after the build using <EM>make clean</EM>`,' 
            as they may take up valuable disk space.<BR>&nbsp;
          </TD>
        </TR>
        <TR>
          <TD>
            <TABLE align=center>
              <TR>
                <TH>Sources</TH>
                <TH>&nbsp;</TH>
                <TH>MinGW Dir.</TH>
                <TH>&nbsp;</TH>
                <TH>MinGW Dir.</TH>
              </TR>
              <TR>
                <TH><FONT SIZE="-1">(GV/src)</FONT></TH>
                <TH>&nbsp;</TH>
                <TH><FONT SIZE="-1">(GV/i686-pc-mingw32)</FONT></TH>
                <TH>&nbsp;</TH>
                <TH><FONT SIZE="-1">(GV/i686-pc-mingw32)</FONT></TH>
              </TR>
              <TR>
                <TD align=center>
                Basics/*.cc<BR>
                Basics/*.h<BR>
                Matrix/*.cc<BR>
                Matrix/*.h<BR>
                .......
                </TD>
                <TD valign=center>
                  <EM>&nbsp;make&nbsp;</EM><BR>
                  <STRONG>&nbsp;====>&nbsp;</STRONG>
                </TD>
                <TD align=center>
                *.o<BR>
                *.po<BR>
                *.a<BR>
                *.dll<BR>
                </TD>
                <TD valign=center>
                  <EM>&nbsp;make&nbsp;</EM><BR>
                  <STRONG>&nbsp;=====>&nbsp;</STRONG><BR>
                  <EM>&nbsp;clean&nbsp;</EM>
                </TD>
                <TD valign=center align=center>
                libgamma.a<BR>
                gamma.dll<BR>
                libgamma.dll.a<BR>
<!---
                pygamma.dll<BR>
--->
                </TD>
              </TR>
            </TABLE>
	    In the above diagram <EM>GV</EM> is used to inicate the base GAMMA version
            directory. For example this is C:/gamma/gamma-4.1.0 on my current system.
            Use of <EM>make clean</EM> can significantly reduce disk space usage`,' yet
            leaves the GAMMA libraries intact.
            <BR>&nbsp;
          </TD>
        </TR>
        <TR>
          <TD>
            <P>
            <HR>
            <P>
            <CENTER><FONT SIZE="+2"><A NAME="DEMO">About The Demos and Tests</A></FONT>
          </TD>
        </TR>
        <TR>
          <TD>
            The targets <EM>make demo</EM> and <EM>make test</EM> will build and run GAMMA module demo and
            test programs. They will compile the C++ programs found in <EM>../../demo/modules</EM> and
            <EM>../../test</EM> respectively`,' preferentially linking to the GAMMA DLL build in the main
            target (make all). The builds will produce executable programs in this directory`,'
            DemoGAMMA.exe and TestGAMMA.exe`,' then run them so the user can see the results. Alternative targets
            <EM>make demostatic</EM> and <EM>make teststatic</EM> will do the same but will insure linking
            is done to the GAMMA static library.  You should notice an increased executable file size in 
            DemoGAMMA.exe and TestGAMMA.exe (or any GAMMA program) when static linkage is done.
            When dynamic linking is done the system must be told where to find the GAMMA DLL when the
            executables are run outside of the makefile. That can be accomplished by moving the DLL into a
            known PATH directory.

            <P> 
            <STRONG><FONT SIZE="-1">
                    Note that if the MinGW generated GAMMA DLL is present in <EM>../../i686-pc-mingw32</EM>
                    it will be used preferentially over the static library when running the tests and demos.
                    If you wish to insure that the static library is used rather than the DLL when running 
                    them`,' use the targets <EM>make demostatic</EM> and <EM>make teststatic</EM>
                    rather their counterparts.
            </FONT></STRONG>

            <P>
            There is a problem with the bash shell provided with MSys`,' at least in the version I have.
            When <EM>make demo</EM> and/or <EM>make test</EM> are run it is near impossible to stop the
            executions of either DemoGAMMA.exe or TestGAMMA.exe once started. Even if the bash window is
            killed the program keeps running. The only way I know how to kill it is in the Windows Task
            manager. However`,' once either program has been built it can be run directly in an bash shell
            using either <EM>./DemoGAMMA</EM> or </EM>./TestGAMMA</EM> and in that case Cntrl-C works fine
            to stop the execution. 

            <P>
            Lastly`,' although the executables produced by linking to the GAMMA DLL or GAMMA static library
            are relocatable`,' they do rely on the associated GAMMA library. Since compilation time specifies
            that these reside in <EM>../../i686-pc-mingw32</EM> the executable inherently knows to look in
            that directory for the <STRONG>static</STRONG> libraries`,' <EM>i.e. libgamma.a</EM> and
            <EM>libgamma.dll.a</EM>. But the executable will NOT know where to find the GAMMA DLL. This is not
            of consequence if linking is done to the static library`,' but if linking is done to the DLL
            (default) then the executable must be able to find the DLL.  The makefile solves this by simply
            copying the DLL into this directory`,' that is one of the first directories looked for when
            searching for a DLL. 

            <P>
            To be able to run the (DLL linked) GAMMA executable program the GAMMA DLL
            must be placed into a directory where it can be easily found. This can be the dirctory containing
            the executable (as is done in the Makefile) or it can be any directory in the PATH. To see what
            the path is`,' use the command <EM>env</EM> in the MSys provided bash window. Probably the best
            choice of where to put <EM>gamma.dll</EM> is in directory <EM>/usr/local/bin</EM> or maybe even
            <EM>/bin</EM>. MSys puts these two in the PATH automatically`,' they correspond to the MSys
            <EM>local/bin</EM> and the MinGW <EM>/bin</EM> directories respectively. Where these reside on
            your system depends upon where you installed MinGW and MSys. Note that the Makefile command
            <EM>make install</EM> will copy the GAMMA dll <EM>gamma.dll</EM> into <EM>/usr/local/bin</EM>.
            Of course`,' if you wish to be able to just click on the Windows icon to run a program then the
            DLL must be in the Windows path....<BR>&nbsp; 
          </TD>
        </TR>
        <TR>
          <TD>
            <P>
            <HR>
            <P>
            <CENTER><FONT SIZE="+2"><A NAME="INSTALL">About The Installation</A></FONT>
          </TD>
        </TR>
        <TR>
          <TD>
            Normally GAMMA is built and installed with the usual GNU configure-make process done
            in the main GAMMA version direcotry using the main Makefile.  The purpose of this <EM>primal</EM>
            Makefile is to demonstrate how GAMMA and PyGAMMA libraries are built on a relatively simplistic
            level`,' by-passing the complexities buried in the main Makefile. But this build is somewhat
            specific in that it <STRONG>assumes the user is working with MinGW</STRONG>. Consequently it
            keeps all binaries in a MinGW specific directory. Builds and runs of any demo or test programs
            in done in this local directory.
            <P>
            If the build and programs work nicely`,' the user may wish to use this build as their default GAMMA.
            What does that mean? The binaries generated from this build are placed into the MinGW binaries
            directory in the GAMMA hierarchy`,' and this is identical to what is done from the main Makefile.
            The difference lies in two areas. First`,' the GAMMA DLL <EM>gamma.dll</EM> must be moved into a
            location that is known by the system. Second`,' the GAMMA script <EM>gamma</EM> must be set specific
            for the MinGW build and moved into a location known by the system.
            <P>
            All <EM>make install</EM> does is copy <EM>gamma.dll</EM> from the MinGW binaries directory
            and <EM>gamma</EM> from this directory into the common directory <EM>/usr/local/bin</EM>. Since
            <EM>/usr/local/bin</EM> is known within any MSys shell (and only in MSys shells, not DOS or CygWin)
            these set what GAMMA is on the system. The only additional point to know is that the GAMMA script
            <EM>gamma</EM> in this directory has been preset for use with MinGW too. Normally it is configured`,'
            but not in this <EM>primal</EM> build.<BR>&nbsp;
          </TD>
        </TR>
        <TR>
          <TD>
            <P>
            <HR>
            <P>
            <CENTER><FONT SIZE="+2"><A NAME="PYGAMMA">About PyGAMMA</A></FONT>
          </TD>
        </TR>
        <TR>
          <TD>
            Currently the MinGW primal Makefile does NOT build the PyGAMMA library (DLL).
            There primary reason for this is that (AFAIK) there is no MinGW port of Python.
            For PyGAMMA to work one needs compatiblity between Python`,' the Boost.Python 
            DLL`,' and the PyGAMMA DLL. If there is no build of Python under MinGW`,' we
            have no reason build the PyGAMMA (nor Boost.Python) DLL under MinGW.

            <P>
            Can one use PyGAMMA and MinGW? Yes`,' individually! 

            <P>
            If you want to use
            PyGAMMA you needed a compatible Python and PyGAMMA DLL on the system. Since
            the system in this case is a Windows PC`,' it is easy to install the 
            pre-packaged Windows Python freely availble from the Python WWW site. 
            To use PyGAMMA with it`,' one uses the Windows based PyGAMMA and Boost.Python
            DLLs. MinGW has nothing to do with that at all (at least`,' not a present)
            
            <P>
            GAMMA based programs (C++ code) are compiled into executables and linked to the
            GAMMA library. This can be intrinsically connected to MinGW if one is working
            with its supplied GCC C++ compiler. Both the library and program executables
            are "MinGW" based even though the executables will run on any Windows system
            without MinGW. In particular`,' take note that the compiler used to build the
            GAMMA program executable is the same that was used to to build the GAMMA library.
            Mixing libraries built with other compilers most often fails during the linking step.

            <P>
            In contrast`,' PyGAMMA programs are Python scripts. These scripts are iterpreted
            in Python when run and the PyGAMMA library (DLL) is imported into Python at that time.
            While the PyGAMMA DLL must be compatible with Python`,' there is no intrinsic connection
            between the program and the (Py)GAMMA library. Hence`,' since I know of know MinGW port of Python`,' use of PyGAMMA
            independent from MinGW. Currently the Makefile does NOT build PyGAMMA with
            MinGW is NOT particularly dependent i  when the program is run so there is no connection to jjjjjjjjj
            and do NOT depend upon the C+MinGW One may not use for example a MSVC++ based a 
            because MinGW
             
            Since PyGAMMA runs under Python it is not particularly related to MinGW. This is
            not true for GAMMA since GAMMA based programs may be compiled with the MinGW
            supplied GCC and link the the MinGW produced GAMMA library. I know of no build of
            Python under MinGW
             and MS
          </TD>
        </TR>
<!---
        <TR>
          <TD>
            The PyGAMMA library build related to the build of the GAMMA DLL`,' but it demands that
            <OL>
              <LI>Window Python is installed on the system.
              <LI>Boost.Python for MinGW is installed on the system.
              <LI>Linking includes Python and Boost.Python libraries.
              <LI>The flag _PYGAMMA is set during compilations.
            </OL>
            As a consequence`,' a different target <EM>pygamma</EM> is used to build the PyGAMMA DLL.
            Similarly`,' the GAMMA module demo and test programs are not compiled under PyGAMMA but
            exists as Python scripts which must be run in a Python window. Hence`,' the targets to
            run these are different as well.<BR>&nbsp;
          </TD>
        </TR>
--->
        <TR>
          <TD>
            <P>
            <HR>
            <P>
            <CENTER><FONT SIZE="+2"><A NAME="NOTES">Additional Notes</A></FONT>
            </CENTER>
          </TD>
        </TR>
        <TR>
          <TD>
            <P>
            You can remove any DLL related files from <EM>../../i686-pc-mingw32</EM> by using the target
            <EM>make dllclean</EM>. Two additional targets allow one to insure there will be a build of the
            demo and test programs. These are <EM>make democlean</EM> and <EM>make testclean</EM> respectively.
            These do not remove any object files from the GAMMA library build. The target <EM>make demo</EM>
            will build an run a program which demonstrates what the GAMMA modules do. They do not demonstrate
            how to build any MR simulation programs currently. After running the demo or test targets one should
            run <EM>make clean</EM> to remove any files produced during the execution of those programs. Any
            clutter files left in this directory can be removed with the script <EM>cleanup</EM> by issuing
            the command <EM>./cleanup</EM> from a bash shell as needed.
          </TD>
        </TR>
      </TABLE>
      )  

include(_PRIMALDIR/base.m4)
include(_DIRDIR/base.m4)
include(_BASEDIR/base.m4)
include(_COREDIR/gamma.m4)
divert(0)

_GAMMAPAGE(_TITLE, _BGIMAGE)
