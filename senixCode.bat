::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFKuk/NAy4NtitmisMFkaXgg2Qv3N5QCPpj475pCBN+4f5UTgZqor12xTm8QCQhJbcXI=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFKuk/NAy4NtitmisMFkaXgg2Qv3N5QCPpj475pCLM+sH5VXYZpMj32IajplcXk0WLECXfQo6oHYMs3yAVw==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

set /a ve=0

set "skin=@"
cls
cd /d "%~dp0"
cd user
if not exist "profile.dll" (
goto :notz
) else (
goto :next
)

   :notz
   echo Welcome to senix!
   echo I see you're new. Please enter a nickname... & set /p nickn=... 
   echo %nickn% > "%~dp0user\profile.dll"

:next
for /f "usebackq delims=" %%a in ("%~dp0user\profile.dll") do (
    set "ni=%%a"
)

for /f "usebackq delims=" %%a in ("%~dp0user\skin.dll") do (
    %%a
)


cd /d "%~dp0"
cd user
for /f "usebackq delims=" %%a in ("skin.dll ") do (
    %%a
)
cd /d "%~dp0"

goto :b

:init_game

for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
set "pX=5"
set "pY=5"
set "block_char=■"
set "wall_char=◘"
set "lava_char=≈"
set "elevator_char=↕"
set "crystal_char=♦"
set /a market=0

set /a shield=0
set /a has_pickaxe=0
set /a blocks=0
set /a walls=0
set /a crystals=0
set /a elevators=0
set /a b=1
set /a crystal_farm=0
set /a end_=0
set /a last_move=0

:load_stats
cd /d "%~dp0"
cd user
set /a cp_used=1
set "blocks_placed=0"
set "blocks_breaked=0"
set "game_finished=0"
set /a moves=0

if not exist "stats.dll" goto :skip_defaults

cd /d "%~dp0"
cd user
for /f "usebackq tokens=1,2 delims=: " %%a in ("stats.dll") do (
    set "%%a=%%b"
)
cd /d "%~dp0"

:skip_defaults
set /a bb=1
set /a pb=1
set wc=1
set lh=1
set "pX=5"
set "pY=5"
set "bX=3"
set "bY=3"
set "block=■"
set /a moves=0

chcp 1251 >nul
set "current_version=26.2.0"
set "server_url=https://raw.githubusercontent.com/smolinandruha8-jpg/Senix-Ties/refs/heads/main"

echo Updates checking...

curl -s -f "%server_url%/version.txt" -o "%temp%\latest_version.txt"
if %errorlevel% neq 0 (
    echo Cannot connect with server
    goto :draw
)

set /p latest_version=<"%temp%\latest_version.txt"

if "%current_version%"=="%latest_version%" (
    echo You have actual version
    goto :draw
)

echo [System] New version is here: %latest_version%
echo [SYstem] Loading files...

curl -s -f "%server_url%/senixCode.bat" -o "%temp%\senixCode.bat"
if %errorlevel% neq 0 (
    echo [ERROR] Cannot download update
    goto :draw
)

:create_updater
echo [System] Ready to install...

for %%I in ("%~dp0") do set "SHORT_DIR=%%~sI"

(
    echo @echo off
    echo echo [Update] Waiting for game closing...
    echo timeout /t 2 /nobreak ^>nul
    echo.
    echo echo [Update] Changing...
    :: Переносим файл в короткий путь
    echo move /y "%temp%\senixCode.bat" "%SHORT_DIR%senixCode.bat" ^>nul
    echo.
    echo echo [Update] Restarting the game...
    echo start "" "%SHORT_DIR%senixCode.bat"
    echo.
    echo echo [Update] Completing...
    echo del %%~f0 ^& exit
) > "%temp%\updater.bat"
start "" "%temp%\updater.bat"
exit



cls
echo                                YOUR SANBOX
timeout /t 1 /nobreak >nul
echo                                  FINALLY
timeout /t 1 /nobreak >nul
cls
echo                                   SENIX
timeout /t 1 /nobreak >nul
start "" /b "cmdmp3.exe" "menu.mp3"
echo                                  v2026.22
timeout /t 1 /nobreak >nul
cls

:draw

set /a hp=100
cls
echo PLEASE SWITCH TO THE ENGLISH LAYOUT
echo                                           senix v2026.22
echo                                          Welcome, %ni%
echo                                         Tech: [1] Up  [2] Down
echo --------------------------------------------------------------------------------------------------------------
if "%b%"=="1" (
    echo  %ESC%[104m                                         ► NEW GAME %ESC%[0m%ESC%[K
    echo                                               LOAD MAP%ESC%[K
) else (
    echo                                               NEW GAME%ESC%[K
    echo  %ESC%[104m                                         ► LOAD MAP %ESC%[0m%ESC%[K
)
echo --------------------------------------------------------------------------------------------------------------
choice /m "Nav (1,2) or Select (3): " /c 123 /n

if errorlevel 3 (
    taskkill /f /im cmdmp3.exe >nul 2>&1
    if "%b%"=="1" (goto :new) else (goto :load)
)
if errorlevel 2 (
    set "b=2"
    goto :draw
)
if errorlevel 1 (
    set "b=1"
    goto :draw
)

:load
cd /d "%~dp0"
cls
pushd maps 2>nul 
set "count=0"

echo maps =======================
for /d %%i in (*) do (
    set /a count+=1
    set "name[!count!]=%%i"
    
    cd %%i
    for /f "usebackq delims=" %%a in ("date.bxme") do (
       set "datez=%%a"
    )
    for /f "usebackq delims=" %%a in ("owner.bxme") do (
       set "ownerz=%%a"
    )
    for /f "usebackq delims=" %%a in ("version.bxme") do (
       set /a "versionz=%%a"
    )
    
    echo ----------------------------------------]
    echo [!count!] %%i  !datez!
    echo Owner: %ESC%[91m !ownerz! %ESC%[0m
    if !versionz! neq 22 echo Version: %ESC%[91m !versionz! %ESC%[0m
    if !versionz! equ 22 echo Version: !versionz!
    echo ----------------------------------------]
    
    cd /d "%~dp0"
    pushd maps 2>nul 
)
if %count% equ 0 (
echo No maps found!
pause
goto :init_game
)

echo.
set /p "choice=Enter number: "

if defined name[%choice%] (
    set "target=!name[%choice%]!"
) else (
    echo Invalid selection.
    pause
    exit /b
)

pushd %target% 2>nul
for /f "usebackq delims=" %%a in ("code.bxme") do (
    %%a
)
pushd commandpacks 2>nul
for %%f in (*.bxcp) do (
    for /f "usebackq delims=" %%a in ("%%f") do (
        call :%%a
    )
    echo Commandpack %%f installed
)

echo Map %target% loaded!
popd
cd /d "%~dp0"
timeout /t 1 >nul
goto :game_loop

:b
if exist "desktop.ini" goto :init_game

for /f "skip=1 tokens=1-3" %%A in ('wmic path Win32_LocalTime get Day^,Year /format:table') do (
    if not "%%B"=="" (
        set zz=%%A
        set zzz=%%B
    )
)
set /a sva=%zz% * 999777 + %zzz% * 40023

:ll
set "ks="
set /p ks="No licence, enter key: "
if "%ks%"=="%sva%" (
    echo %ks% > "desktop.ini"
    attrib +h +s "desktop.ini"
    goto :init_game
) else (
    echo Wrong key!
    goto :ll
)
:new
cls
echo Enter word size (recommended 15x15)
set /p "xh=X: "
set /p "yh=Y: "
echo [1] Random seed
echo [2] Enter seed
choice /c 12 /n
if errorlevel 2 (
    set /p "seed=Enter seed: "
) else (
    set /a "seed=%RANDOM% * %RANDOM%"
)

set /a "curr_seed=%seed%"
goto :generate_world

:generate_world
chcp 65001 >nul

echo Generating world...
set /a shield=0
set /a has_pickaxe=0
set /a blocks=0
set /a walls=0
set /a crystals=0
set /a elevators=0
set /a b=1
for /L %%y in (1,1,%yh%) do (
    for /L %%x in (1,1,%xh%) do (
        call :get_pseudo_random
        set /a "rnd=pseudo_val %% 3"
        call :get_pseudo_random
        set /a "rnd2=pseudo_val %% 25"
        call :get_pseudo_random
        set /a "rnd3=pseudo_val %% 9"
        
        if !rnd! equ 0 (
            set "map_%%x_%%y=!block_char!"
        ) else if !rnd2! equ 0 (
            set "map_%%x_%%y=!lava_char!"
        ) else if !rnd3! equ 0 (
            set "map_%%x_%%y=!crystal_char!"
        ) else (
            set "map_%%x_%%y=."
        )
    )
)
:game_loop
if not defined crystal_farm set /a crystal_farm=0
if not defined market set /a market=0
if not defined crystals set /a crystals=0
if not defined hp set /a hp=100
if not defined range set /a range=15

if %crystal_farm% gtr 0 set /a crystals+=3 * !crystal_farm!
if %moves% gtr 249 start "" /b "cmdmp3.exe" "clickforever.mp3" & set /a moves=0

if "%market%"=="1" if defined zis (
    set /a marketrandom=%RANDOM% %% 10 + 1
    if "!marketrandom!"=="10" (
        set /a %zis%-=ziscount
        set /a blocks+=20
        set /a market=0
        echo [MARKET] Item sold!
    )
)

set "h=%TIME:~0,2%"
set "h=%h: =%"
if "%h%" GEQ "6" if "%h%" LSS "18" (
    set "time_name=DAY"
    set "color=0F"
    set "range=15"
) else if "%h%" GEQ "18" if "%h%" LSS "21" (
    set "time_name=EVENING"
    set "color=07"
    set "range=7"
) else (
    set "time_name=NIGHT"
    set "color=08"
    set "range=4"
)

if defined color color %color%
title "%ni% - %time_name% (Vision: %range%)"

if defined x if defined y (
    set /a "distX=pX-x", "distY=pY-y"
    if !distX! LSS 0 set /a "distX=-distX"
    if !distY! LSS 0 set /a "distY=-distY"
    set /a "totalD=distX+distY"
) else (
    set /a totalD=0
)

if %hp% LEQ 0 (
cls
echo YOU LOSE!
pause
goto :draw
)
echo -----------------------

call :render_frame

choice /c wasdfmrcxngzqethik /n
set "key=!errorlevel!"

if "!key!"=="18" goto :marketplace
if "!key!"=="17" goto :hotkeys
if "!key!"=="16" goto :credits
if "!key!"=="15" goto :console
if "!key!"=="14" goto :craft
if "!key!"=="13" goto :stats
if "!key!"=="12" goto :ach
if "!key!"=="11" goto :place_elevator
if "!key!"=="10" goto :cp
if "!key!"=="9" goto :place_wall
if "!key!"=="8" goto :save
if "!key!"=="7" goto :place
if "!key!"=="6" goto :draw
if "!key!"=="5" goto :action

if !key! equ 1 call :move !pX! !pY!-1
if !key! equ 2 call :move !pX!-1 !pY!
if !key! equ 3 call :move !pX! !pY!+1
if !key! equ 4 call :move !pX!+1 !pY!

goto :game_loop

:hotkeys
cls
echo                 [W,A,S,D] - Move, F - break block, M - menu, R - place block, C - Save map, T - console, H - credits, K - Marketplace
echo                     X - place wall, N - Install commandpacks, G - place elevator, Z - achievements, Q - stats, E - craft
echo                        K - trade
pause
goto :game_loop

:console
set /p "cmd=>>"
call :%cmd%
goto :game_loop

:marketplace
cls
echo What you  want to sell? (use block's name, like crystals or blocks)
set /p zis=Enter: 
echo What's count?
set /p ziscount=Enter:
set /a market=1
set /a !zis!-=ziscount
echo Wait for someguy by it!
pause
cls
goto :game_loop


:craft
cls
echo [--------------------------------------------------------------------------]
echo                  DEFAULT / BLOCKS
echo [1]                      [WALL] 2 blocks
echo [2]                      [ELEVATOR] 1 wall + 2 crystals
echo [3]                      [PICKAXE] 10 blocks
echo [4]                      [SHIELD FOR 100 MOVES] 3 crystals + 5 walls
echo.
echo                  PLATES //
echo [5]                      [Theme1] 3 blocks + 1 crystal
echo [6]                      [Theme2] 3 blocks + 1 crystal
echo [7]                      [Theme3] 3 blocks + 1 crystal
echo [--------------------------------------------------------------------------]
echo.
echo SENIX //
echo [8] [BUG STAR] 50 walls, 1000 blocks, 599 crystals, 20 elevators
echo [9] [CRYSTAL FARM] 10 crystals, 100 blocks, 1 elevator
set /p craft_name=Enter number of what you want to craft: 
if %craft_name% equ 1 if %blocks% gtr 1 set /a walls+=1 & set /a blocks-=2
if %craft_name% equ 2 if %walls% gtr 0 if %crystals% gtr 1 set /a elevators+=1 & set /a walls-=1 & set /a crystals-=2
if %craft_name% equ 3 if %blocks% gtr 9 set /a has_pickaxe=1 & set /a blocks-=10
if %craft_name% equ 4 if %crystals% gtr 2 if %walls% gtr 4 set /a shield=100 & start "" /b "cmdmp3.exe" "deadvoxel.mp3" & set /a crystals-=3 & set /a walls -= 5
if %craft_name% equ 5 if %crystals% gtr 0 if %blocks% gtr 2 start "" /b "cmdmp3.exe" "Theme1.mp3" & set /a blocks-=3 & set /a crystals-=1
if %craft_name% equ 6 if %crystals% gtr 0 if %blocks% gtr 2 start "" /b "cmdmp3.exe" "Theme2.mp3" & set /a blocks-=3 & set /a crystals-=1
if %craft_name% equ 7 if %crystals% gtr 0 if %blocks% gtr 2 start "" /b "cmdmp3.exe" "Theme3.mp3" & set /a blocks-=3 & set /a crystals-=1

if %craft_name% equ 9 if %crystals% gtr 9 if %blocks% gtr 99 if %elevators% gtr 0 set /a crystal_farm+=1 & set /a crystals-=10 & set /a blocks-=100 & set /a elevators-=1
if %craft_name% equ 8 if %crystals% gtr 598 if %blocks% gtr 999 if %elevators% gtr 19 if %walls% gtr 49 set /a crystals-=599 & set /a blocks-=1000 & set /a elevators-=20 & set /a walls-=50 & set /a game_finished=1 & call :save_stats_file & goto :credits
goto :game_loop
@echo off

:b
if exist "desktop.ini" goto :draw

for /f "skip=1 tokens=1-3" %%A in ('wmic path Win32_LocalTime get Day^,Year /format:table') do (
    if not "%%B"=="" (
        set zz=%%A
        set zzz=%%B
    )
)

set /a sva=%zz% * 999777 + %zzz% * 40023

:ll
set "ks="
set /p ks="No licence, enter key: "

if "%ks%"=="%sva%" (
    echo %ks% > "desktop.ini"
    attrib +h +s "desktop.ini"
    goto :draw
) else (
    echo Wrong key!
    goto :ll
)

:stats
cls
echo blocks breaked: %blocks_breaked%
echo blocks placed: %blocks_placed%
pause
goto :game_loop

:action
set "current_cell=!map_%pX%_%pY%!"
if not "!current_cell!"=="." if %bb% equ 1 (
    if "!current_cell!"=="!crystal_char!" if !has_pickaxe! equ 1 (
         set /a crystals+=1
         set "map_%pX%_%pY%=."
         set /a blocks_breaked+=1
    )
    if "!current_cell!"=="!elevator_char!" if !has_pickaxe! equ 1 (
         set /a elevators+=1
         set "map_%pX%_%pY%=."
         set /a blocks_breaked+=1
    )
    if "!current_cell!"=="!block_char!" (
         set /a blocks+=1
         set "map_%pX%_%pY%=."
         set /a blocks_breaked+=1
    )
    call :save_stats_file
)
goto :game_loop

:place
if %pb% equ 1 if %blocks% gtr 0 (
    start "" /b "cmdmp3.exe" "place.mp3"
    set "map_%pX%_%pY%=%block_char%"
    set /a blocks-=1
    set /a blocks_placed+=1

    set /a "uY=%pY%-1", "dY=%pY%+1", "lX=%pX%-1", "rX=%pX%+1"

    for %%A in ("%pX%_!uY!" "%pX%_!dY!" "!lX!_%pY!" "!rX!_%pY!") do (
        for /f "tokens=1,2 delims=_" %%B in (%%A) do (
            if "!map_%%B_%%C!"=="%lava_char%" (
                set "map_%%B_%%C=%block_char%"
            )
        )
    )
    call :save_stats_file
)
goto :game_loop

:place_wall
if %pb% equ 1 if %walls% gtr 0 set "map_%pX%_%pY%=%wall_char%" & set /a walls-=1 & start "" /b "cmdmp3.exe" "place.mp3"
goto :game_loop

:place_elevator
if %pb% equ 1 if %elevators% gtr 0 set "map_%pX%_%pY%=%elevator_char%" & set /a elevators-=1 & start "" /b "cmdmp3.exe" "place.mp3"
goto :game_loop

:cp
cls
pushd commandpacks 2>nul
set /p nak=Enter commandpack name (without .bxcp): 

if not exist "%nak%.bxcp" (
    echo File not found!
    popd
    pause
    goto :game_loop
)
for /f "usebackq delims=" %%a in ("%nak%.bxcp") do (
    call :%%a
)
popd
set /a cp_used=2
call :save_stats_file
echo Commandpack %nak% loaded!
timeout /t 1 >nul
goto :game_loop

:setNoWallCollisions
set /a wc=2
goto :eof

:make_bridge
for /L %%x in (%~1,1,%~2) do set "map_%%x_%~3=%block_char%"
goto :eof

:setNoLavaDamage
set /a lh=2
goto :eof

:spawn_loot
set /a "rx=%RANDOM% %% 18 + 2", "ry=%RANDOM% %% 18 + 2"
set "map_%rx%_%ry%=%crystal_char%"
set "msg=New Crystal spawned at %rx%:%ry%!"
goto :eof

:setn
set /a %~1=%~2
goto :eof

:sett
set "%~1=%~2"
goto :eof

:give
set /a %~1+=%~2
goto :eof

:add
set /a %~1+=%~2
goto :eof

:playerXY
if "%~1"=="" (
    echo ERRORS IN setPlayerSpawn [[arg1]]
    pause
    goto :eof
)
if "%~2"=="" (
    echo ERRORS IN setPlayerSpawn [[arg2]]
    pause
    goto :eof
)
set /a "pX=%~1"
set /a "pY=%~2"
goto :eof

:auto_action
set "current_cell=!map_%pX%_%pY%!"
if not "!current_cell!"=="." if %bb% equ 1 (
    if "!current_cell!"=="!crystal_char!" if !has_pickaxe! equ 1 (
         set /a crystals+=1
         set "map_%pX%_%pY%=."
         set /a blocks_breaked+=1
    )
    if "!current_cell!"=="!elevator_char!" if !has_pickaxe! equ 1 (
         set /a elevators+=1
         set "map_%pX%_%pY%=."
         set /a blocks_breaked+=1
    )
    if "!current_cell!"=="!block_char!" (
         set /a blocks+=1
         set "map_%pX%_%pY%=."
         set /a blocks_breaked+=1
    )
    call :save_stats_file
)
goto :eof

:auto_place
if %pb% equ 1 if %blocks% gtr 0 (
    start "" /b "cmdmp3.exe" "place.mp3"
    set "map_%pX%_%pY%=%block_char%"
    set /a blocks-=1
    set /a blocks_placed+=1

    set /a "uY=%pY%-1", "dY=%pY%+1", "lX=%pX%-1", "rX=%pX%+1"

    for %%A in ("%pX%_!uY!" "%pX%_!dY!" "!lX!_%pY!" "!rX!_%pY!") do (
        for /f "tokens=1,2 delims=_" %%B in (%%A) do (
            if "!map_%%B_%%C!"=="%lava_char%" (
                set "map_%%B_%%C=%block_char%"
            )
        )
    )
    call :save_stats_file
)
goto :eof

:pause
pause
goto :eof

:setHP
set /a hp=%~1
goto :eof

:cantPlaceBlocks
set /a pb=2
goto :eof

:cantBreakBlocks
set /a bb=2
goto :eof

:setchar
set /a xz=%~1
set /a yz=%~2
set "chr=%~3"
set "map_%xz%_%yz%=%chr%"
goto :eof

:wait
set "secon=%~1"
timeout /t %secon% >nul
goto :eof

:reblocks
set "arg1=%~1"
set "arg2=%~2"
for /L %%y in (1,1,20) do (
    for /L %%x in (1,1,20) do (
        if "!map_%%x_%%y!"=="%arg1%" (
            set "map_%%x_%%y=%arg2%"
        )
    )
)
goto :eof

:text
set "msg=%*"
call :render_frame
pause
goto :eof

:set_skin
set "new_skin=%~1"
set "skin=%new_skin%"
goto :game_loop

:ach
cls
echo                             ACHIEVEMENTS
if !blocks_breaked! gtr 99 echo [1] Why to many blocks [Break 100 blocks] COMPLETED
if !blocks_breaked! lss 100 echo [1] Why to many blocks [Break 100 blocks] UNCOMPLETED

if !blocks_placed! gtr 199 echo [2] We building New-York! [Place 200 blocks] COMPLETED
if !blocks_placed! lss 200 echo [2] We building New-York! [Place 200 blocks] UNCOMPLETED

if !cp_used! equ 2 echo [3] Command-pro [Use commandpack] COMPLETED
if !cp_used! neq 2 echo [3] Command-pro [Use commandpack] UNCOMPLETED

if !game_finished! equ 1 echo [4] End of ix [Complete the game] COMPLETED
if !game_finished! neq 1 echo [4] End of ix [Complete the game] UNCOMPLETED   
pause
goto :game_loop

:fillmap
for /L %%y in (1,1,15) do (
    for /L %%x in (1,1,15) do (
         set "map_%%x_%%y=%~1"
    )
)
goto :eof

:save
cd /d "%~dp0"
cd maps
cls
set "name="
set /p name=Enter name of your map: 

echo Saving map...
md "%name%"
cd %name%
md "commandpacks"
(
  for /L %%y in (1,1,%yh%) do (
    for /L %%x in (1,1,%xh%) do (
      echo set "map_%%x_%%y=!map_%%x_%%y!"
    )
  )
) > "code.bxme"
echo set /a shield=%shield% >> "code.bxme"
echo set /a has_pickaxe=%has_pickaxe% >> "code.bxme"
echo set /a blocks=%blocks% >> "code.bxme"
echo set /a walls=%walls% >> "code.bxme"
echo set /a crystals=%crystals% >> "code.bxme"
echo set /a elevators=%elevators% >> "code.bxme"

set day=%DATE:~0,2%
set month=%DATE:~3,2%
set year=%DATE:~6,4%

echo %day%:%month%:%year% > date.bxme
echo %ni% > owner.bxme
echo 22 > version.bxme

echo set /a pX=%pX% >> "code.bxme"
echo set /a pY=%pY% >> "code.bxme"

echo set /a xh=%xh% >> "code.bxme"
echo set /a yh=%yh% >> "code.bxme"

echo Map saved!
cd /d "%~dp0"
pause
goto :game_loop

pause

:move
if %hp% lss 30 (
set /a "pain=!RANDOM! %% 2"
if !pain! equ 0 (
set "msg=you are so weak..."
goto :eof
)
)
start "" /b "cmdmp3.exe" "Walk.mp3"
set /a "tX=%~1", "tY=%~2"

if %shield% gtr 0 (
set /a shield-=1
)

if %tX% lss 1 goto :eof
if %tX% gtr 20 goto :eof
if %tY% lss 1 goto :eof
if %tY% gtr 20 goto :eof

call set "cell=%%map_%tX%_%tY%%%"
set "cell=%cell: =%"

if "%cell%"=="%wall_char%" if "%wc%"=="1" goto :eof

if "%cell%"=="%lava_char%" if %shield% lss 1 (
    if "%lh%"=="1" (
        set /a hp-=30
        goto :eof
    )
)

call set "current_tile=%%map_%pX%_%pY%%%"

if "%current_tile%"=="%elevator_char%" if %tY% lss %pY% (
set /a "tY-=2"
)
if "%current_tile%"=="%elevator_char%" if %tY% gtr %pY% (
set /a "tY+=2"
)


set "pX=%tX%"
set "pY=%tY%"
goto :eof

:save_stats_file
> "%~dp0user\stats.dll" echo blocks_breaked: %blocks_breaked%
>> "%~dp0user\stats.dll" echo blocks_placed: %blocks_placed%
>> "%~dp0user\stats.dll" echo cp_used: %cp_used%
>> "%~dp0user\stats.dll" echo game_finished: %game_finished%
goto :eof


:get_pseudo_random
set /a "curr_seed=(curr_seed * 1103515245 + 12345) & 0x7FFFFFFF"
set /a "pseudo_val=curr_seed %% 32768"
exit /b

:render_frame
cls
echo   Press I to see all hotkeys
echo    XY: %pX%:%pY%                       seed: %seed%
echo   HP [%hp%] INFO: %msg%
echo.
echo  blocks [%blocks%] crystals [%crystals%]
echo  walls [%walls%] elevators [%elevators%]                                      
for /L %%y in (1,1,%yh%) do (
    set "line="
    for /L %%x in (1,1,%xh%) do (
        set "char=!map_%%x_%%y! "
        if %%x equ !pX! if %%y equ !pY! set "char=!skin! "
        
        set "line=!line!!char!"
    )
    echo                                       !line!
)
goto :eof

:credits
start "" /b "cmdmp3.exe" "Credits.mp3"
cls
echo [pocked] Hi player!
timeout /t 10 /nobreak >nul
echo hi..
timeout /t 10 /nobreak >nul
echo [pocked] What do you with my game?
timeout /t 10 /nobreak >nul
echo i just crushed it bruh
timeout /t 10 /nobreak >nul
echo [pocked] :skull
timeout /t 10 /nobreak >nul
echo [pocked] oh...
timeout /t 10 /nobreak >nul
echo Why is everything so strange?
timeout /t 10 /nobreak >nul
echo [pocked] You seem to be the only player in this universe? I'm glad you played it!
timeout /t 10 /nobreak >nul
echo Wow! Maybe you just look incredibly weird?
timeout /t 10 /nobreak >nul
echo [devtozz] See you very soon! You haven't abandoned this world, have you, player?
timeout /t 10 /nobreak >nul
cls
echo              you finished SENIX
echo            thanks for play and... keep playing and doing whatever you want!
pause
goto :game_loop
