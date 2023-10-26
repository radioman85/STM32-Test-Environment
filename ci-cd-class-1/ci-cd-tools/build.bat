rem
rem usage: build build-dir {Debug|Release} {all|clean}
rem

setlocal

if not [%3]==[] goto :get_args
echo "Insufficient arguments"
exit /b 1

:get_args

set "build_dir=%1"
set "build_type=%2"
set "target=%3"

cd "%build_dir%"

set PATH=C:\ST\STM32CubeIDE_1.8.0\STM32CubeIDE\plugins\com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.11.3.rel1.win32_1.1.0.202305231506\tools\bin;C:\ST\STM32CubeIDE_1.8.0\STM32CubeIDE\plugins\com.st.stm32cube.ide.mcu.externaltools.make.win32_2.1.0.202305091550\tools\bin;C:/ST/STM32CubeIDE_1.8.0/STM32CubeIDE//plugins/com.st.stm32cube.ide.jre.win64_3.0.0.202305091045/jre/bin/server;C:/ST/STM32CubeIDE_1.8.0/STM32CubeIDE//plugins/com.st.stm32cube.ide.jre.win64_3.0.0.202305091045/jre/bin;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\Program Files (x86)\Webex\Plugins;C:\Program Files\dotnet\;C:\Program Files (x86)\IVI Foundation\VISA\WinNT\Bin\;C:\Program Files\IVI Foundation\VISA\Win64\Bin\;C:\Program Files (x86)\IVI Foundation\IVI\Bin\;C:\Program Files\IVI Foundation\IVI\Bin\;C:\Program Files (x86)\IVI Foundation\VISA\WinNT\Bin;C:\Program Files\Docker\Docker\resources\bin;C:\Program Files\PuTTY\;C:\Program Files\nodejs\bin;C:\Program Files\nodejs\;C:\Program Files\mosquitto;C:\Program Files\Microsoft SQL Server\150\Tools\Binn\;C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\;C:\Users\niklas.roth\Documents\pico-sdk;C:\Program Files\Git\cmd;C:\Espressif\frameworks\esp-idf-v5.0.2\tools;C:\Users\niklas.roth\arduino-fwuploader_2.2.2_Windows_64bit;C:\Program Files\Go\bin;C:\arduino-cli;C:\Program Files\srecord\bin;C:\Program Files (x86)\Arm GNU Toolchain arm-none-eabi\12.2 mpacbti-rel1\bin;C:\Program Files\Nordic Semiconductor\nrf-command-line-tools\bin\;C:\Users\niklas.roth\AppData\Local\Programs\Python\Python311\Scripts\;C:\Users\niklas.roth\AppData\Local\Programs\Python\Python311\;C:\Espressif\tools\idf-python\3.11.2\;C:\Espressif\tools\idf-git\2.39.2\cmd\;C:\Program Files (x86)\Google\Chrome\Application;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\Program Files (x86)\Webex\Plugins;C:\Program Files\dotnet\;C:\Program Files (x86)\IVI Foundation\VISA\WinNT\Bin\;C:\Program Files\IVI Foundation\VISA\Win64\Bin\;C:\Program Files (x86)\IVI Foundation\IVI\Bin\;C:\Program Files\IVI Foundation\IVI\Bin\;C:\Program Files (x86)\IVI Foundation\VISA\WinNT\Bin;C:\Program Files\Docker\Docker\resources\bin;C:\Program Files\PuTTY\;C:\Program Files\nodejs\bin;C:\Program Files\nodejs\;C:\Program Files\mosquitto;C:\Program Files\Microsoft SQL Server\150\Tools\Binn\;C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\;C:\Users\niklas.roth\Documents\pico-sdk;C:\Program Files\Git\cmd;C:\Users\niklas.roth\esp\esp-idf\tools;C:\Users\niklas.roth\arduino-fwuploader_2.2.2_Windows_64bit;C:\Users\niklas;C:\Users\niklas.roth\AppData\Local\Programs\jaguar;;C:\msys64\mingw64\bin;C:\Users\niklas.roth\go\bin;C:\Users\niklas.roth\AppData\Local\Programs\Microsoft VS Code\bin;C:\01 NOSER\Sandbox\STM32-Test-Environment\ci-cd-class-1

set compiler_prefix=arm-none-eabi-

set "version_file=..\App\version.h"

if [%BUILD_TAG%]==[] goto :do_make

echo #ifndef _VERSION_H_ >"%version_file%"
echo #define _VERSION_H_ >>"%version_file%"
echo #define VERSION "%BUILD_TAG%-%build_type%" >>"%version_file%"
echo #endif >>"%version_file%"

:do_make

make -j4 "%target%"
