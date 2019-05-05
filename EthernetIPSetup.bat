ECHO OFF

REM --------------------------------------------------------
REM Settings
REM --------------------------------------------------------
REM Interface name
set name="Local Area Connection"
REM IP 1
set A_IP=192.168.1.10
set A_MASK=255.255.255.0
set A_GATEWAY=
REM IP 2
set B_IP=10.202.11.250
set B_MASK=255.255.255.128
set B_GATEWAY=
REM --------------------------------------------------------

CLS
NET SESSION >nul 2>&1
	set done=--------------------------------------------------------
IF %ERRORLEVEL% EQU 0 ( 
	GOTO STATUS
) ELSE (
    ECHO Error.
	echo.
	GOTO NOADMIN
)

:NOADMIN
echo You have NO Administrator privlleges!  X   X
echO                                         X X
echo Run the script again as Admin.           X
echo                                         X X
echo                                        X   X
pause
GOTO EOF

:CLEAN
CLS
GOTO MENU

:STATUS
CLS
ECHO Administrator PRIVILEGES Detected!
ECHO.
ECHO =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
ECHO Current Network Status
ECHO =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
ECHO.
netsh interface ip show config name="Local Area Connection"
GOTO MENU

:MENU
ECHO.
ECHO %done%
ECHO.
ECHO =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
ECHO PRESS 1, 2, 3, 4, 5, 6 to select your task, or 0 to EXIT.
ECHO =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
ECHO.
ECHO 1) Manual IP
ECHO 2) DHCP
ECHO 3) Quick Change
ECHO 4) Check IP settings
ECHO 5) Ping
ECHO 6) Status
ECHO 0) EXIT
ECHO.
SET /P M="Type 1, 2, 3, 4, 5, 6 or 0 then press ENTER: "
IF %M%==1 GOTO MANUAL
IF %M%==2 GOTO DHCP
IF %M%==3 GOTO QUICKIP
IF %M%==4 GOTO IP_SETTING
IF %M%==5 GOTO IP_PING
IF %M%==6 GOTO STATUS
IF %M%==0 GOTO EOF

:MANUAL
CLS
ECHO.
ECHO =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
ECHO Manual IP Setup
ECHO =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
ECHO.
set /p MANUAL_IP="IP: "
set /p MANUAL_MASK="MASK: "
set /p MANUAL_GATEWAY="GATEWAY: "
ECHO.
pause
set done=IP Set to %MANUAL_IP% %MANUAL_MASK% %MANUAL_GATEWAY%
netsh interface ipv4 set address name=%name% static %MANUAL_IP% %MANUAL_MASK% %MANUAL_GATEWAY%
GOTO CLEAN

:DHCP
netsh interface ipv4 set address name=%name% source=dhcp
CLS
set done=IP Set to DHCP
GOTO CLEAN

:QUICKIP
CLS
ECHO.
ECHO =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
ECHO Set IP as saved in the script settings
ECHO =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
ECHO.
ECHO Name - IP - Network Mask - Default Gateway
ECHO.
echo 1 - %A_IP% - %A_MASK% - %A_GATEWAY%
echo 2 - %B_IP% - %B_MASK% - %B_GATEWAY%
ECHO.
SET /P M="Type 1 or 2 to select IP Profiles or 0 for MENU then press ENTER: "
IF %M%==1 GOTO A
IF %M%==2 GOTO B
IF %M%==0 GOTO CLEAN
:A
netsh interface ipv4 set address name=%name% static %A_IP% %A_MASK% %A_GATEWAY%
CLS
set done=IP Set to %A_IP% %A_MASK% %A_GATEWAY%
GOTO MENU
:B
netsh interface ipv4 set address name=%name% static %B_IP% %B_MASK% %B_GATEWAY%
CLS
set done=IP Set to %B_IP% %B_MASK% %B_GATEWAY%
GOTO CLEAN

:IP_PING
CLS
ECHO.
ECHO =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
ECHO PING
ECHO =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
ECHO.
set /p MANUAL_IP_PING="IP: "
ECHO.
ping %MANUAL_IP_PING%
ECHO. 
pause
set done= Ping to %MANUAL_IP_PING% finished
GOTO CLEAN

:IP_SETTING
CLS
CLS
ECHO.
ECHO =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
ECHO IP SETTINGS
ECHO =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
ECHO.
netsh interface ipv4 show config
ECHO.
set done=Scrol up to see IP configuration for different netowork adapters
GOTO MENU
