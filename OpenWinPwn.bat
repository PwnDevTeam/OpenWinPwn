@echo off

set FOLDER=%1
set AUTHOR=%2
set APPZ=OpenWinPwn.bat
set VERSION=2.0

title OpenWinPwn V%VERSION% -- By: Fallensn0w

REM
REM OpenWinPwn
REM Programmed by @Fallensn0w.
REM http://wwww.github.com/Fallensn0w/OpenWinPwn
REM

REM Check if we are using paramenters

if "%FOLDER%"=="" (
   msg * You need to enter paramenters like this: %APPZ% payload_name author
   exit
)
if "%AUTHOR%"=="" (
   msg * You need to enter paramenters like this: %APPZ% payload_name author
   exit
)


mkdir %FOLDER%
cd %FOLDER%

REM Make folder(s).

mkdir src
mkdir build
mkdir includes


REM Generate Makefile

echo # Makefile for %FOLDER% >> Makefile
echo # %FOLDER% has been created with %APPZ% - http://OpenPwn.org/ >> Makefile
echo # Not for use in commercial products - %FOLDER% should be Open-Sourced! >> Makefile
echo. >>  Makefile
echo. >>  Makefile
echo all: >> Makefile
echo 	@echo ' ' >> Makefile
echo 	@echo 'Choose your Processor below to compile.' >> Makefile
echo 	@echo '  make s5l8900 (iPhone, iPod Touch, iPhone 3G)' >> Makefile
echo 	@echo '  make s5l8720 (iPod touch 2G)' >> Makefile
echo 	@echo '  make s5l8920 (iPhone 3GS)' >> Makefile
echo 	@echo '  make s5l8922 (iPod Touch 3G)' >> Makefile
echo 	@echo '  make s5l8930 (iPad, iPhone 4, AppleTV 2G)' >> Makefile
echo    @echo '  make s5l8940 (iPad 2 - Not possible to use yet)' >> Makefile
echo 	@echo ' ' >> Makefile
echo. >> Makefile
echo s5l8900: >> Makefile
echo 	@cd src; make s5l8900; cd .. >> Makefile
echo. >> Makefile
echo s5l8920: >> Makefile
echo 	@cd src; make s5l8920; cd .. >> Makefile
echo. >> Makefile
echo s5l8720: >> Makefile
echo 	@cd src; make s5l8720; cd .. >> Makefile
echo. >> Makefile
echo s5l8922: >> Makefile
echo 	@cd src; make s5l8922; cd .. >> Makefile
echo. >> Makefile
echo s5l8930: >> Makefile
echo 	@cd src; make s5l8930; cd .. >> Makefile
echo. >> Makefile
echo s5l8940: >> Makefile
echo 	@cd src; make s5l8940; cd .. >> Makefile
echo. >> Makefile

echo package: >> Makefile >> Makefile
echo 	tar cjf %FOLDER%.tar.gz includes src build README.txt Makefile >> Makefile
echo. >> Makefile
echo clean: >> Makefile
echo 	@cd build; rm %FOLDER%.bin; rm %FOLDER%.elf; cd .. >> Makefile
echo. >> Makefile


REM Generate %FOLDER%\src\entry.s
cd src
echo @ OpenPwn - DarkMalloc, %APPZ% - Fallensn0w >> entry.s
echo @ %FOLDER% has been created with %APPZ% - http://OpenPwn.org/ >> entry.s
echo @ Not for use in commercial products - %FOLDER% should be Open-Source! >> entry.s
echo. >> entry.s
echo .arm >> entry.s
echo .text >> entry.s
echo _start: >> entry.s
echo .global _start >> entry.s
echo   @ store registers >> entry.s
echo   stmfd  sp!, {r0-r12,lr} >> entry.s
echo. >> entry.s
echo   @ branch with link to the main function >> entry.s
echo   bl   main >> entry.s
echo. >> entry.s
echo ldmfd  sp!, {r0-r12,pc} >> entry.s
echo. >> entry.s


REM Generate %FOLDER%\src\main.c

echo // OpenPwn - DarkMalloc , %APPZ% - Fallensn0w >> main.c
echo // %FOLDER% has been created with %APPZ% - http://OpenPwn.org/ >> main.c
echo // Not for use in commercial products - %FOLDER% should be Open-Source! >> main.c
echo. >> main.c
echo #include "commands.h" >> main.c
echo. >> main.c
echo typedef unsigned short uint16_t; >> main.c
echo typedef unsigned long uint32_t; >> main.c
echo. >> main.c
echo // Macros (used for writing to memory addresses) >> main.c
echo #define SET_REG16(x, y) (*((volatile uint16_t*)(x)) = (y)) >> main.c
echo #define SET_REG32(x, y) (*((volatile uint32_t*)(x)) = (y)) >> main.c
echo // End of Macros >> main.c
echo. >> main.c
echo int main(int argc, CmdArg* argv) { >> main.c
echo. >> main.c
echo. >> main.c
echo } >> main.c
echo. >> main.c


REM Generate %FOLDER%\src\Makefile
echo # Makefile for %FOLDER% >> Makefile
echo # %FOLDER% has been created with %APPZ% - http://OpenPwn.org/ >> Makefile
echo # Not for use in commercial products - %FOLDER% should be Open-Source! >> Makefile
echo. >> Makefile
echo. >> Makefile
echo s5l8900: >> Makefile
echo 	arm-elf-gcc entry.S main.c -I../includes -o ../build/%FOLDER%.elf -nostdlib -mthumb-interwork -lc -lgcc -Ttext=0x09000000 >> Makefile
echo 	arm-elf-objcopy -O binary ../build/%FOLDER%.elf ../build/%FOLDER%.bin >> Makefile
echo. >> Makefile
echo s5l8920: >> Makefile
echo	arm-elf-gcc entry.S main.c -I../includes -o ../build/%FOLDER%.elf -nostdlib -mthumb-interwork -lc -lgcc -Ttext=0x41000000 >> Makefile
echo 	arm-elf-objcopy -O binary ../build/%FOLDER%.elf ../build/%FOLDER%.bin >> Makefile
echo. >> Makefile
echo s5l8922: >> Makefile
echo 	arm-elf-gcc entry.S main.c -I../includes -o ../build/%FOLDER%.elf -nostdlib -mthumb-interwork -lc -lgcc -Ttext=0x41000000 >> Makefile
echo 	arm-elf-objcopy -O binary ../build/%FOLDER%.elf ../build/%FOLDER%.bin >> Makefile
echo. >> Makefile
echo s5l8720: >> Makefile
echo 	arm-elf-gcc entry.S main.c -I../includes -o ../build/%FOLDER%.elf -nostdlib -mthumb-interwork -lc -lgcc -Ttext=0x09000000 >> Makefile
echo 	arm-elf-objcopy -O binary ../build/%FOLDER%.elf ../build/%FOLDER%.bin >> Makefile
echo. >> Makefile
echo s5l8930: >> Makefile
echo 	arm-elf-gcc entry.S main.c -I../includes -o ../build/%FOLDER%.elf -nostdlib -mthumb-interwork -lc -lgcc -Ttext=0x41000000 >> Makefile
echo. >> Makefile

cd ..
REM Generate %FOLDER%\includes\commands.h
echo // OpenPwn - DarkMalloc , %APPZ% - Fallensn0w >> commands.h
echo // %FOLDER% has been created with %APPZ% - http://OpenPwn.org/ >> commands.h
echo // Not for use in commercial products - %FOLDER% should be Open-Source! >> commands.h
echo. >> commands.h
echo // Commands.h is used to correctly pass arguments to your payloads main function. >> commands.h
echo. >> commands.h
echo enum { >> commands.h
echo     kCmdArgTypeString = 0, >> commands.h
echo     kCmdArgTypeInteger = 1 >> commands.h
echo }; >> commands.h
echo. >> commands.h
echo typedef struct CmdArg { >> commands.h
echo     signed int unk1; >> commands.h
echo     unsigned int uinteger; >> commands.h
echo     signed int integer; >> commands.h
echo     unsigned int type; >> commands.h
echo     unsigned char* string; >> commands.h
echo } CmdArg; >> commands.h
echo. >> commands.h


REM Generate %PAYLOAD%\README
cd ..
echo OpenPwn - DarkMalloc, %APPZ% - Fallensn0w >> README
echo %FOLDER% has been created with %APPZ% - http://OpenPwn.org/ >> README
echo Not for use in commercial products - %FOLDER% should be Open-Source! >> README
echo. >> README
echo %APPZ% has neatly organised the required files into an includes and a src folder. >> README
echo All you need to do, in the directory that this README is in, is run make and the processor >> README
echo of the device your want this payload to run on. For example, for the iPhone 3G, iPhone 2G or iPod Touch 1G, >> README
echo you simply need to do: make s5l8900 >> README
echo. >> README
echo Payload: %FOLDER% >> README
echo Author: %AUTHOR% >> README
echo. >> README


REM KTHXBYE.
cd ..
echo.
echo Your payload "%FOLDER%" is generated and ready to use. (Location: %USERPROFILE%\Desktop\%PAYLOAD%).
echo.
pause
