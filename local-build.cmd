REM run as Administrator
@echo off
cd /d %~dp0
@REM set DOWNLOAD_DIR=%USERPROFILE%\Downloads
@REM set DOWNLOAD_DIR_LINUX=%DOWNLOAD_DIR:\=/%

@REM SET PATH=^
@REM %DOWNLOAD_DIR%\PortableGit\bin;^
@REM %DOWNLOAD_DIR%\x86_64-8.1.0-release-win32-seh-rt_v6-rev0;^
@REM %DOWNLOAD_DIR%\x86_64-8.1.0-release-win32-seh-rt_v6-rev0\bin;^
@REM %DOWNLOAD_DIR%\cmake-3.22.2-windows-x86_64\bin;

set PATH=^
D:\Softwares\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64;^
D:\Softwares\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64\bin;^
D:\Softwares\cmake-3.23.0-rc1-windows-x86_64\bin;

@REM set PATH=^
@REM D:\Softwares\LLVM-14.0.6-win64;^
@REM D:\Softwares\LLVM-14.0.6-win64\bin;^
@REM D:\Softwares\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64;^
@REM D:\Softwares\x86_64-8.1.0-release-win32-seh-rt_v6-rev0\mingw64\bin;^
@REM D:\Softwares\cmake-3.23.0-rc1-windows-x86_64\bin;

@REM -DFFMPEG_ROOT="D:/Code Projects/ffmpeg-clang/ffmpeg-master-windows-desktop-clang-lite.tar" ^
@REM -DCMAKE_CXX_COMPILER="D:/Softwares/LLVM-14.0.6-win64/bin/clang++.exe" ^
@REM -DCMAKE_C_COMPILER="D:/Softwares/LLVM-14.0.6-win64/bin/clang.exe" ^

cmake.exe -G"MinGW Makefiles" ^
-DFFMPEG_ROOT="D:/Code Projects/cpp-libraries/ffmpeg-vtest-x86_64-posix-seh-rev0-8.1.0" ^
-DZLIB_ROOT="D:/Code Projects/cpp-libraries/zlib-v1.2.12-x86_64-posix-seh-rev0-8.1.0" ^
-DCMAKE_BUILD_TYPE=Debug -B./build &&^
cd build &&^
cmake --build . &&^
echo "Successful build"
pause