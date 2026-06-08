@echo off
setlocal enabledelayedexpansion
cls
chcp 65001 > nul

:: ==============================================================================
::  ThaAntCBT v9.6.4 - THE COMPLETE FORTRESS (FULL RESTORATION)
::  ----------------------------------------------------------------------------
::  CHANGELOG:
::  - v9.6.4: Restauración de 60 líneas de estructura, lore y reportes técnicos.
::  - Hardware: Recuperado reporte de GPU, BIOS y Serial Number.
::  - Visual: Espaciadores ASCII y bloques de ayuda categorizados.
::  - Minería: Animaciones con %% reales y tiempos de respuesta calibrados.
::  - Protocolo: No Seas Ortiba™ - Hecho por Alva.
:: ==============================================================================

:: --- CONFIGURACIÓN DE VARIABLES ---
set "VERSION= 11 Beta "
set "user_name=Anonimo"
set "color_actual=0C"
set "cmd_total=0"
set "creditos=0"
set "pass=1234"
:init_vars
:: Valores por defecto si no hay save
set "credits=1000"
set "btc_owned=0" & set "alva_owned=0" & set "gem_owned=0" & set "gpt_owned=0"
set "pass=1234"
set "disco_mode=OFF"
:: Cargar si existe el archivo oculto
if exist "config.dat" (
    attrib -h "config.dat"
    < "config.dat" (
        set /p credits=
        set /p btc_owned=
        set /p alva_owned=
        set /p gem_owned=
        set /p gpt_owned=
        set /p pass=
    )
    attrib +h "config.dat"
)

:: Mercado de Valores (Precios Base)
set /a price_alva=300, price_gem=150, price_btc=60000
set /a stocks_alva=0, stocks_gem=0, stocks_btc=0
set /a price_gpt=200
set /a stocks_gpt=0
title ThaAntCBT v%VERSION% - ESTACIÓN DE TRABAJO DE %user_name%

:kernel_draw
cls
color %color_actual%
echo.
echo     █████╗ ██╗     ██╗   ██╗ █████╗ 
echo    ██╔══██╗██║     ██║   ██║██╔══██╗
echo    ███████║██║     ██║   ██║███████║
echo    ██╔══██║██║     ╚██╗ ██╔╝██╔══██║
echo    ██║  ██║███████╗ ╚████╔╝ ██║  ██║
echo    ╚═╝  ╚═╝╚══════╝  ╚═══╝  ╚═╝  ╚═╝
echo.
echo ╔══════════════════════════════════════════════════════════════════════╗
echo                          ThaAntCBT v%VERSION%
echo ╚══════════════════════════════════════════════════════════════════════╝
echo    USUARIO: %user_name% ^| CRÉDITOS: $%creditos% ^| COMANDOS: %cmd_total%
echo    CARTERA: [ALVA:%stocks_alva%] [GEM:%stocks_gem%] [BTC:%stocks_btc%] [GPT:%stocks_gpt%]
echo ────────────────────────────────────────────────────────────────────────


:step_event
set /a cmd_total+=1
set "input="
set /p "input=%user_name%> "
if not defined input (set /a cmd_total-=1 & goto step_event)

:: --- DISPATCHER INTEGRAL (ANTI-CRASH) ---
if /i "%input%"=="ayuda"      goto mod_ayuda
if /i "%input%"=="bolsa"      goto mod_bolsa
if /i "%input%"=="minar"      goto mod_minar
if /i "%input%"=="panico"     goto mod_panico
if /i "%input%"=="jackpot"    goto mod_jackpot
if /i "%input%"=="apostar"    goto mod_apostar
if /i "%input%"=="ruleta"     goto mod_ruleta
if /i "%input%"=="dados"      goto mod_dados
if /i "%input%"=="hardware"   goto mod_hardware
if /i "%input%"=="wifi"       goto mod_wifi
if /i "%input%"=="ip"         goto mod_ip
if /i "%input%"=="hora"       goto mod_hora
if /i "%input%"=="clima"      goto mod_clima
if /i "%input%"=="dolar"      goto mod_dolar
if /i "%input%"=="anecdota"   goto mod_anecdota
if /i "%input%"=="changelog"  goto mod_changelog
if /i "%input%"=="tema"       goto mod_tema
if /i "%input%"=="apodo"      goto mod_apodo
if /i "%input%"=="matrix"     goto mod_matrix
if /i "%input%"=="limpiar"    goto kernel_draw
if /i "%input%"=="salir"      exit
if /i "%input%"=="lock" goto mod_lock
if /i "%input%"=="passwd" goto mod_passwd
if /i "%input%"=="nyan"      cls & curl ascii.live/nyan & goto kernel_draw
if /i "%input%"=="parrot"    cls & curl ascii.live/parrot & goto kernel_draw
if /i "%input%"=="forrest"   cls & curl ascii.live/forrest & goto kernel_draw
if /i "%input%"=="batman"    cls & curl ascii.live/batman & goto kernel_draw
if /i "%input%"=="rick"      cls & curl ascii.live/rick & goto kernel_draw
if /i "%input%"=="dvd"       cls & curl ascii.live/dvd & goto kernel_draw
if /i "%input%"=="donut"     cls & curl ascii.live/donut & goto kernel_draw
if /i "%input%"=="coin"      cls & curl ascii.live/coin & goto kernel_draw
if /i "%input%"=="clock"     cls & curl ascii.live/clock & goto kernel_draw
if /i "%input%"=="bnr"       cls & curl ascii.live/bnr & goto kernel_draw
if /i "%input%"=="hes"       cls & curl ascii.live/hes & goto kernel_draw
if /i "%input%"=="knot"      cls & curl ascii.live/knot & goto kernel_draw
if /i "%input%"=="spidyswing" cls & curl ascii.live/spidyswing & goto kernel_draw
if /i "%input%"=="india"     cls & curl ascii.live/india & goto kernel_draw
if /i "%input%"=="music" goto mod_megalovania
if /i "%input%"=="run"     goto mod_run
if /i "%input%"=="stealth" goto mod_stealth
if /i "%input%"=="ports"   goto mod_ports
if /i "%input%"=="self-destruct" goto mod_destruct
if /i "%input%"=="radar"         goto mod_radar
if /i "%input%"=="glitch"        goto mod_glitch
if /i "%input%"=="boveda"         goto mod_boveda
if /i "%input%"=="health"         goto mod_health
if /i "%input%"=="send-msg"    goto mod_netmsg

powershell -c "[console]::beep(450,150)" >nul 2>&1
echo [!] Comando desconocido. Probá con 'ayuda'.
goto step_event

:: --- MÓDULO MINAR ANIMADO ---
:mod_minar
echo.
echo [SISTEMA] Conectando con el pool de Alva...
timeout /t 1 >nul
echo [LOG] Sincronizando bloques SHA-256...
echo [LOG] Progreso: [■■□□□□□□□□] 20%%
timeout /t 1 >nul
echo [LOG] Progreso: [■■■■■□□□□□] 50%%
timeout /t 1 >nul
echo [LOG] Progreso: [■■■■■■■■■□] 90%%
timeout /t 1 >nul
echo [LOG] Progreso: [■■■■■■■■■■] 100%%
set /a reward=(%random% %% 100) + 50
set /a creditos+=%reward%
echo [OK] Hash encontrado. Ganaste $%reward% créditos.
echo.
goto kernel_draw

:: --- MÓDULO HARDWARE (PROFUNDO) ---
:mod_hardware
echo.
echo  [ REPORTE TÉCNICO COMPLETO ]
echo  ────────────────────────────────────────────────────────
echo  CPU: & wmic cpu get name | findstr /v "Name"
echo  RAM: & wmic OS get TotalVisibleMemorySize /Value
echo  GPU: & wmic path win32_VideoController get name | findstr /v "Name"
echo  BIOS: & wmic bios get smbiosbiosversion | findstr /v "SMBIOSBIOSVersion"
echo  DISCOS: & wmic logicaldisk get caption,size,freespace
echo  ────────────────────────────────────────────────────────
goto step_event

:: --- MÓDULO RED (AVANZADO) ---
:mod_ip
echo.
echo [IP CONFIG]
ipconfig | findstr "IPv4"
echo [MAC ADDRESS]
getmac /fo list | findstr "Physical"
goto step_event

:mod_wifi
echo.
echo [REDES CONOCIDAS]
netsh wlan show profiles | findstr "All User Profile"
set /p "red=Nombre de la red: "
netsh wlan show profile name="%red%" key=clear | findstr "Key Content"
goto step_event

:: --- AYUDA CATEGORIZADA ---
:: --- AYUDA TOTAL ACTUALIZADA v10.5 ---
:mod_ayuda
cls
color 0B
eecho ======================================================================
echo                MANUAL DE OPERACIONES THAANTCBT v11.0
echo ======================================================================
echo.

echo  [ 🛡️ SEGURIDAD Y PRIVACIDAD ]
echo   passwd         - Cambiar clave de acceso global
echo   boveda         - Acceso a carpeta secreta (Requiere clave)
echo   lock           - Bloquear terminal inmediatamente
echo   radar          - Alerta de intrusion por USB
echo   stealth        - Simula actualizacion de Windows
echo   self-destruct  - Protocolo de autodestruccion (Simulado)
echo.

echo  [ 📊 DIAGNOSTICO Y RED ]
echo   health         - Estado de discos, bateria y RAM
echo   hardware       - Reporte tecnico completo del equipo
echo   ip             - Mostrar IP y direccion MAC
echo   wifi           - Ver redes guardadas y claves
echo   ports          - Escaneo de puertos locales (LISTENING)
echo   send-msg       - Enviar mensaje a equipo en red
echo   hora           - Hora y fecha actual
echo   clima          - Abrir clima en navegador
echo   dolar          - Cotizacion del dolar online
echo.

echo  [ 💰 ECONOMIA Y JUEGOS ]
echo   bolsa          - Mercado dinamico de acciones
echo   minar          - Mineria simulada con recompensa
echo   apostar        - Juego de apuesta simple
echo   ruleta         - Ruleta rusa (riesgo total)
echo   dados          - Lanzamiento de dados con premio
echo   jackpot        - Tragamonedas
echo.

echo  [ 🎭 EFECTOS Y VISUAL ]
echo   glitch         - Error critico + spam de ventanas
echo   matrix         - Lluvia de codigo infinita
echo   tema           - Cambiar color del sistema
echo   limpiar        - Redibujar interfaz
echo.

echo  [ 🛠️ SISTEMA ]
echo   run            - Lanzador de aplicaciones Windows
echo   panico         - Cierre forzado de navegadores
echo   apodo          - Cambiar nombre de usuario
echo   changelog      - Historial de versiones
echo   anecdota       - Lore aleatorio del sistema
echo   salir          - Cerrar ThaAntCBT
echo.

echo  [ 🎮 EXTRAS / ASCII LIVE ]
echo   nyan / parrot / forrest / batman / rick
echo   dvd / donut / coin / clock / bnr
echo   hes / knot / spidyswing / india
echo   music
echo ======================================================================
echo.
echo Presione una tecla para volver al centro de control...
pause > nul
goto kernel_draw

:: --- TEMAS Y PERSONALIZACIÓN ---
:mod_tema
echo.
echo  1:Matrix 2:Mar 3:Oro 4:Cielo 5:Cyber 6:Sangre 7:Gris 8:Toxic
set /p "tc=Tema: "
if "%tc%"=="1" set "color_actual=0A"
if "%tc%"=="2" set "color_actual=01"
if "%tc%"=="3" set "color_actual=06"
if "%tc%"=="4" set "color_actual=0B"
if "%tc%"=="5" set "color_actual=05"
if "%tc%"=="6" set "color_actual=0C"
if "%tc%"=="7" set "color_actual=07"
if "%tc%"=="8" set "color_actual=0E"
goto kernel_draw

:: --- LORE Y OTROS ---
:mod_anecdota
echo.
set /a n=%random% %% 2
if %n%==0 echo [LORE] Alva salvó este código de ser un simple script de 20 líneas.
if %n%==1 echo [LORE] Casi le hacemos un culto a una vela xd
echo. & goto step_event

:mod_changelog
cls
echo ======================================================
echo    THAANTCBT - HISTORIAL DE VERSIONES (CHANGELOG)
echo ======================================================
echo  v10.0 [ACTUAL] - "SHADOW PERSISTENCE"
echo    + Sistema de guardado automatico (config.dat oculto).
echo    + Motor de Eventos Globales (Mercado dinamico).
echo    + Comandos 'lock' y 'passwd' integrados.
echo.
echo  v9.6.5 - "REACTIVE TITAN"
echo    + Refresco de interfaz Kernel_Draw (UI reactiva).
echo    + Optimizacion de variables de mercado.
echo.
echo  v9.6.4 - "FINAL TITAN"
echo    + Animaciones y optimizacion de Hardware Full.
echo.
echo  v9.6.0 - "ABSOLUTE FORTRESS"
echo    + Primera capa de seguridad avanzada.
echo.
echo  v1.0.0 - "INICIO"
echo    + Nacimiento del motor base.
echo ======================================================
echo.
echo Presione una tecla para volver al panel...
pause > nul
goto step_event

:mod_panico
taskkill /f /im chrome.exe /t >nul 2>&1
taskkill /f /im msedge.exe /t >nul 2>&1
echo [OK] Evidencia eliminada. Perímetro seguro.
goto step_event

:mod_bolsa
:: Motor de volatilidad (Azar de mercado)
set /a v_a=(%random% %% 61)-30, price_alva+=v_a
set /a v_g=(%random% %% 41)-20, price_gem+=v_g
set /a v_b=(%random% %% 2001)-1000, price_btc+=v_b
set /a v_gpt=(%random% %% 101)-50, price_gpt+=v_gpt

:: Suelos de seguridad (Anti-quiebra)
if %price_alva% LSS 20 set /a price_alva=20
if %price_gem% LSS 10 set /a price_gem=10
if %price_btc% LSS 5000 set /a price_btc=5000
if %price_gpt% LSS 15 set /a price_gpt=15

echo.
echo  [ MERCADO DE VALORES INTEGRAL ]
echo  1. ALVA INC : $%price_alva% (Tienes: %stocks_alva%)
echo  2. GEMINI   : $%price_gem% (Tienes: %stocks_gem%)
echo  3. BITCOIN  : $%price_btc% (Tienes: %stocks_btc%)
echo  4. GPT CORP : $%price_gpt% (Tienes: %stocks_gpt%)
echo.
set /p "b_cmd=Acción (c1, c2, c3, c4 / v1, v2, v3, v4 / x): "

:: Lógica de Compras
if /i "%b_cmd%"=="c1" (if %creditos% GEQ %price_alva% (set /a creditos-=%price_alva%, stocks_alva+=1 & echo [+] Comprado Alva.))
if /i "%b_cmd%"=="c2" (if %creditos% GEQ %price_gem% (set /a creditos-=%price_gem%, stocks_gem+=1 & echo [+] Comprado Gemini.))
if /i "%b_cmd%"=="c3" (if %creditos% GEQ %price_btc% (set /a creditos-=%price_btc%, stocks_btc+=1 & echo [+] Comprado Bitcoin.))
if /i "%b_cmd%"=="c4" (if %creditos% GEQ %price_gpt% (set /a creditos-=%price_gpt%, stocks_gpt+=1 & echo [+] Comprado GPT.))

:: Lógica de Ventas
if /i "%b_cmd%"=="v1" (if %stocks_alva% GTR 0 (set /a creditos+=%price_alva%, stocks_alva-=1 & echo [-] Vendido Alva.))
if /i "%b_cmd%"=="v2" (if %stocks_gem% GTR 0 (set /a creditos+=%price_gem%, stocks_gem-=1 & echo [-] Vendido Gemini.))
if /i "%b_cmd%"=="v3" (if %stocks_btc% GTR 0 (set /a creditos+=%price_btc%, stocks_btc-=1 & echo [-] Vendido Bitcoin.))
if /i "%b_cmd%"=="v4" (if %stocks_gpt% GTR 0 (set /a creditos+=%price_gpt%, stocks_gpt-=1 & echo [-] Vendido GPT.))
goto kernel_draw

:mod_hora
echo. & echo Son las %time:~0,5%hs del %date%. & goto step_event
:mod_clima
start "" "https://www.google.com/search?q=clima+actual" & goto step_event
:mod_dolar
start "" "https://www.cronista.com/MercadosOnline/dolar.html" & goto step_event
:mod_apodo
set /p "new=Apodo: " & if defined new set "user_name=!new!"
goto kernel_draw
:mod_matrix
echo %random%%random%%random%%random% & goto mod_matrix
:mod_ruleta
set /a t=%random% %% 6
if %t%==1 (echo BOOM! & pause & exit) else (echo Zafaste.) & goto step_event
:mod_jackpot
set /a n1=%random% %% 7, n2=%random% %% 7, n3=%random% %% 7
echo [%n1%] [%n2%] [%n3%]
if %n1%==%n2% if %n2%==%n3% (set /a creditos+=5000 & echo JACKPOT) & goto step_event
:mod_apostar
set /p "ap=Monto: " & set /a m=%random% %% 2
if %m%==1 (set /a creditos+=%ap% & echo Ganaste.) else (set /a creditos-=%ap% & echo Perdiste.)
goto step_event
:mod_dados
set /a d1=(%random% %% 6)+1, d2=(%random% %% 6)+1, suma=%d1%+%d2%
echo [🎲] %d1% + %d2% = %suma%
if %suma% GTR 9 (set /a rw=%suma%*10, creditos+=rw & echo +$%rw%!)
goto step_event
:mod_lock
cls
color 0C
echo.
echo  [ SISTEMA BLOQUEADO ]
echo  Identifíquese para acceder al terminal.
echo.
set /p "check_pass=PASSWORD> "
if "%check_pass%"=="%pass%" (
    echo [+] Acceso concedido.
    timeout /t 1 >nul
    goto kernel_draw
) else (
    echo [!] Password incorrecto. Reintentando...
    timeout /t 2 >nul
    goto mod_lock
)
:mod_passwd
cls
echo ======================================================
echo           CONFIGURACION DE CLAVE DE SEGURIDAD
echo ======================================================
echo.
set /p "nueva_pass=[?] Ingrese la nueva clave: "
:: Forzamos que la variable sea global
set "pass_actual=%nueva_pass%"
echo.
echo [OK] Clave actualizada correctamente.
echo [!] Tu clave ahora es: %pass_actual%
pause
goto kernel_draw
:save
(
echo %credits%
echo %btc_owned%
echo %alva_owned%
echo %gem_owned%
echo %gpt_owned%
echo %pass%
) > "config.dat"
attrib +h "config.dat"
goto :eof
:mod_megalovania
echo.
echo  [♪] REPRODUCIENDO: Megalovania (Alva Edit)
echo  [!] Presione Ctrl+C para detener la musica.
echo.
:: Nota: Frecuencia (Hz) y Duración (ms)
powershell -c "[console]::beep(293,150); [console]::beep(293,150); [console]::beep(587,300); [console]::beep(440,300); [console]::beep(415,300); [console]::beep(392,300); [console]::beep(349,300); [console]::beep(293,150); [console]::beep(349,150); [console]::beep(392,150)"
goto step_event

:mod_run
echo.
echo  ╔══════════════════════════════════════════════════╗
echo  ║             LANZADOR DE SISTEMA                ║
echo  ╚══════════════════════════════════════════════════╝
echo   1. Notepad          4. Regedit
echo   2. Calculadora      5. Task Manager
echo   3. Panel Control    6. PowerShell
echo.
set /p "r_cmd=Selección [1-6] o 'x': "
if "%r_cmd%"=="1" start notepad & goto kernel_draw
if "%r_cmd%"=="2" start calc & goto kernel_draw
if "%r_cmd%"=="3" start control & goto kernel_draw
if "%r_cmd%"=="4" start regedit & goto kernel_draw
if "%r_cmd%"=="5" start taskmgr & goto kernel_draw
if "%r_cmd%"=="6" start powershell & goto kernel_draw
goto kernel_draw
:mod_stealth
cls
color 07
powershell -command "(New-Object -ComObject shell.application).minimizeall()"
echo.
echo Trabajando en las actualizaciones: %random%%% completado.
echo No apague el equipo. Esto va a tardar unos momentos.
echo.
echo Su PC se reiniciará varias veces.
:stealth_loop
set /a "perc=%random% %% 100"
echo [%time:~0,5%] Instalando paquetes críticos... %perc%%%
timeout /t 8 > nul
goto stealth_loop
:mod_ports
echo.
echo [!] ESCANEANDO PUERTOS LOCALES (LISTENING)
echo ────────────────────────────────────────────────────────
netstat -an | findstr "LISTENING"
echo ────────────────────────────────────────────────────────
echo Escaneo completado.
pause
goto step_event
:mod_netscan
echo.
echo [📡] Rastreando dispositivos en el perímetro...
echo.
powershell -Command "Get-NetNeighbor | Where-Object { $_.State -ne 'Permanent' -and $_.IPAddress -notlike '*:*' } | Select-Object IPAddress, State | ft"
echo.
pause
goto step_event
:mod_destruct
cls
color 0C
echo ======================================================
echo [!] ADVERTENCIA: PROTOCOLO DE AUTODESTRUCCION v%version%
echo ======================================================
echo.
echo [!] Iniciando borrado de sectores criticos...
timeout /t 2 /nobreak >nul

:: Simulación de borrado de archivos
for /l %%i in (1,1,15) do (
    echo [PURGE] Eliminando: C:\Windows\System32\Drivers\kern%%i.sys... DONE
    timeout /t 0 /nobreak >nul
)

echo.
echo [!] ERROR DE DESBORDAMIENTO EN BUFFER 0x800451
echo [!] EL SISTEMA HA COLAPSADO.
echo.

:: --- GENERACIÓN DEL MENSAJE DE ERROR DE WINDOWS ---
echo x=msgbox("FATAL ERROR: El proceso de autodestruccion ha causado un daño irreversible en el Nucleo v%version%. El sistema debe cerrarse para proteger el hardware.", 16+0, "EMERGENCY HALT") > %temp%\error_self.vbs

:: Ejecuta el error y espera a que el usuario le de a "Aceptar"
start /wait %temp%\error_self.vbs

:: Borra el rastro y sale del programa
del %temp%\error_self.vbs
exit
:mod_radar
cls
echo [📡] RADAR DE HARDWARE ACTIVADO...
echo [!] Monitoreando puertos USB en busca de intrusos.
echo [!] Presione CTRL+C para desactivar el radar.
echo.
:radar_loop
wmic logicaldisk where drivetype=2 get deviceid 2>nul | findstr ":" >nul
if %errorlevel%==0 (
    color 4F
    echo [!!!] ALERTA: DISPOSITIVO EXTRAÍBLE DETECTADO [%time%]
    powershell -c "[console]::beep(2000,300); [console]::beep(2000,300)"
    pause
    color %color_actual%
    goto kernel_draw
)
timeout /t 3 >nul
goto radar_loop
:mod_glitch
:: --- FASE 1: ATAQUE VISUAL ---
set /a "bg=%random% %% 8"
set /a "txt=%random% %% 16"
set "hex=0123456789ABCDEF"
set "c1=!hex:~%bg%,1!"
set "c2=!hex:~%txt%,1!"
color %c1%%c2%

echo [ FATAL ] 0x!random! -- INTRUSION_DETECTED -- !random!
echo !random!!random!!random!!random!!random!!random!!random!!random!

set /a "glitch_count+=1"
if %glitch_count% GTR 50 goto mod_glitch_spam
timeout /t 0 /nobreak >nul
goto mod_glitch

:mod_glitch_spam
:: --- FASE 2: SPAM DE VENTANAS DE ERROR ---
cls
color 0C
echo [!] EL SISTEMA HA COLAPSADO. 
echo [!] LANZANDO ALERTAS DE NÚCLEO...

:: Creamos el archivo de error una sola vez
echo msgbox "El sistema ha detectado una intrusion critica... Razon: Te dije que no tocaras eso!", 16, "ThaAntCBT - Error Fatal" > %temp%\error.vbs

:: Bucle para abrir 10 ventanas (cambia el 10 si quieres mas locura)
for /L %%i in (1,1,10) do (
    start %temp%\error.vbs
    timeout /t 0 /nobreak >nul
)

:: --- FASE 3: EL FINAL ---
echo.
echo [!] CERRANDO TERMINAL EN 3 SEGUNDOS...
timeout /t 3 >nul
del %temp%\error.vbs
exit
:mod_boveda
cls
echo ======================================================
echo           SISTEMA DE ALMACENAMIENTO CIFRADO
echo ======================================================
echo.

:: 1. Verificamos clave
set "input_pass="
set /p "input_pass=[!] Ingrese clave de acceso: "

if "!input_pass!"=="!pass_actual!" goto boveda_acceso_ok

echo.
echo [!] CLAVE INCORRECTA.
pause
goto kernel_draw

:boveda_acceso_ok
echo.
echo [OK] Identidad confirmada.
if not exist "Control_Secure_Data" md "Control_Secure_Data"

:: 2. MÉTODO SEGURO: La hacemos visible, la abrimos y la OCULTAMOS AL INSTANTE
attrib -h -s "Control_Secure_Data"
start "" "Control_Secure_Data"

:: Esperamos 2 segundos para que Windows detecte la apertura y volvemos a ocultar
timeout /t 2 /nobreak >nul
attrib +h +s "Control_Secure_Data"

echo [!] ACCESO TEMPORAL CONCEDIDO.
echo [!] La carpeta ya ha sido re-ocultada en el sistema.
echo [!] Podes seguir usandola, pero no aparecera si refrescas.
echo.
pause
goto kernel_draw
:mod_health
cls
color 0B
echo ======================================================
echo           MONITOR DE VIDA DEL SISTEMA (v11)
echo ======================================================
echo.

:: --- TIEMPO DE ACTIVIDAD ---
echo [>] TIEMPO DESDE EL ULTIMO ARRANQUE:
:: Usamos net stats para ver la fecha y hora de inicio
net statistics workstation | find "Estad"
echo.

:: --- ESTADO DE DISCOS ---
echo [>] INTEGRIDAD DE ALMACENAMIENTO:
echo ────────────────────────────────────────────────────────
:: wmic nos da el ID del disco, el tamaño y el estado de salud (OK o Pred Fail)
wmic diskdrive get model,status,size
echo.

:: --- ESTADO DE ENERGIA ---
echo [>] ESTADO DE BATERIA / CARGA:
:: Usamos PowerShell para extraer el porcentaje exacto y si está cargando
powershell -c "Get-WmiObject -Class Win32_Battery | Select-Object @{Name='Carga(%%)';Expression={$_.EstimatedChargeRemaining}}, @{Name='Estado';Expression={if($_.BatteryStatus -eq 1){'Descargando'}elseif($_.BatteryStatus -eq 2){'Cargando'}else{'Conectado'}}} | ft"
echo.

:: --- MEMORIA RAM ---
echo [>] ESTADO DE MEMORIA RAM (KB):
wmic os get FreePhysicalMemory,TotalVisibleMemorySize /value
echo.
echo ======================================================
echo [!] Presione una tecla para volver al kernel...
pause > nul
goto kernel_draw
:mod_netmsg
cls
echo ======================================================
echo           COMUNICADOR INTER-SISTEMAS v%version%
echo ======================================================
echo.
:: Listamos rápido los equipos para que sepas a quién disparar
echo [!] Equipos detectados en el entorno:
net view | find "\\"
echo.
echo ------------------------------------------------------
set /p "target=[?] Nombre del equipo (ej: \\PC-JUAN): "
set /p "msg_text=[?] Mensaje a enviar: "
echo ------------------------------------------------------
echo.
echo [!] Enviando transmision...

:: El comando mágico. Quitamos las barras \\ si el usuario las puso
set "target=%target:\=%"

msg /server:%target% * /time:20 "%msg_text%"

if %errorlevel% equ 0 (
    echo [OK] Mensaje entregado con exito a %target%.
) else (
    echo [ERROR] No se pudo contactar con %target%. 
    echo [!] Asegurate de que el equipo este encendido y en red.
)
echo.
pause
goto kernel_draw