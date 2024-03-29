@echo off

rem =====
rem For more information on ScriptTiger and more ScriptTiger scripts visit the following URL:
rem https://scripttiger.github.io/
rem Or visit the following URL for the latest information on this ScriptTiger script:
rem https://github.com/ScriptTiger/DAIDE-QuickStart
rem =====

if exist "%~dp0aiserver\AiServer.exe" (
	if exist "%~dp0aimapper\AiMapper.exe" (
		if exist "%~dp0albert\Albert.exe" (
			if exist "%~dp0holdbot\AiClient.exe" goto 0
		)
	)
)

if not exist "%~dp0aiserver\AiServer.exe" (
	echo "%~dp0aiserver\AiServer.exe" cannot be found
	echo Ensure the server is installed and located in the correct directory
	echo Can be downloaded from the following URL:
	echo http://www.ellought.demon.co.uk/dipai/aiserver.msi
)

if not exist "%~dp0aimapper\AiMapper.exe" (
	echo "%~dp0aimapper\AiMapper.exe" cannot be found
	echo Ensure the client is installed and located in the correct directory
	echo Can be downloaded from the following URL:
	echo http://www.ellought.demon.co.uk/dipai/aimapper.msi
)

if not exist "%~dp0albert\Albert.exe" (
	echo "%~dp0albert\Albert.exe" cannot be found
	echo Ensure the AI bot is installed and located in the correct directory
	echo Can be downloaded from the following URL:
	echo https://sites.google.com/site/diplomacyai/Albert.msi?attredirects=0
)

if not exist "%~dp0holdbot\AiClient.exe" (
	echo "%~dp0holdbot\AiClient.exe" cannot be found
	echo Ensure the civil disorder bot is installed and located in the correct directory
	echo Can be downloaded from the following URL:
	echo http://www.ellought.demon.co.uk/dipai/holdbot.zip
)

pause
exit /b

:0

setlocal ENABLEDELAYEDEXPANSION

echo Press Y to select the variant you would like to play
echo Press N to skip to the next variant

:Variants
set var=
for %%0 in (
	"Standard,STANDARD,7,Austria:AUS,England:ENG,France:FRA,Germany:GER,Italy:ITA,Russia:RUS,Turkey:TUR"
	"1898,1898,7,Austria:AUS,England:ENG,France:FRA,Germany:GER,Italy:ITA,Russia:RUS,Turkey:TUR"
	"1900,1900,7,Austria:AUS,England:ENG,France:FRA,Germany:GER,Italy:ITA,Russia:RUS,Turkey:TUR"
	"Abstraction,abstraction2,7,Austria:AUS,England:END,France:FRA,Germany:GER,Italy:ITA,Russia:RUS,Turkey:TUR"
	"African,AFRICAN2,6,Ethiopia:ETH,Ivory-Coast:IVC,Libya:LIB,Saudi-Arabia:SAR,South-Africa:SAF,Zaire:ZAI"
	"Americas,americas4,10,Argentina:ARG,Mexico:MXC,Colombia:COL,Brazil:BRA,Chile:CHL,Peru:PER,Spain:SPN,United_States:USA,Venezuela:VEN,Great_Britain:GBR"
	"Balkans,balkans,7,Trieste:TRS,Budapest:BDP,Vienna:VNA,Serbia:SRB,Greece:GRC,Bulgaria:BLG,Rumania:RMN"
	"Chromatic,chromatic,5,Yellow:YEL,Red:RED,Blue:BLU,Light:LIG,Dark:DAR"
	"Classical,classical,5,Carthage:CRT,Egypt:EGY,Macedon:MAC,Rome:RME,Syria:SYA"
	"Fleet Rome,fleet_rome,7,Austria:AUS,England:ENG,France:FRA,Germany:GER,Italy:ITA,Russia:RUS,Turkey:TUR"
	"Greece,greece,7,Athen:ATH,Kreta:KRE,Mazedonia:MAA,Sparta:SPA,Thessalien:THS,Delos:DEL,Trova:TRA"
	"Hundred v3,HUNDRED3,3,Burgundy:BUR,England:ENG,France:FRA"
	"Hundred v3.1,hundred31,3,Burgundy:BUR,England:ENG,France:FRA"
	"Hundred v3.2,hundred32,3,Burgundy:BUR,England:ENG,France:FRA"
	"Iberian,IBERIAN2,5,Aragon:ARA,Castile:CSL,Portugal:PRT,Al-Andalus:ALA,Leon:LEN"
	"Modern,modern,10,Britain:BRT,Egypt:EGY,France:FRN,Germany:GER,Italy:ITA,Poland:POL,Russia:RUS,Spain:SPA,Turkey:TUR,Ukraine:UKR"
	"Sail Ho^^^^^^^^^^^!,SAILHO,4,North:NTH,South:STH,East:EST,West:WST"
	"Shift Around,shift_around,7,Austria:AUS,England:ENG,France:FRA,Germany:GER,Italy:ITA,Russia:RUS,Turkey:TUR"
	"South America 3.2,south_america32,4,Argentina:ARG,Brazil:BZL,Chile:CHI,Colombia:COL"
	"South America 5.1,south_america51,5,Argentina:ARG,Brazil:BZL,Chile:CHL,Colombia:COL,Peru:PER"
	"South America 5.3,sam53,5,Argentina:ARG,Brazil:BRA,Chile:CHL,Colombia:COL,Peru:PER"
	"South East Asia,south_east_asia3,7,Australia:AUS,China:CHN,Indonesia:IND,Malaysia:MLY,Thailand:THL,Philippines:PHI,Vietnam:VTN"
	"Versailles,versailles3,7,Britain:BRI,USSR:USS,France:FRA,Germany:GER,Italy:ITA,Poland:POL,Turkey:TUR"
	"World,WORLD3,17,Argentina:ARG,Brazil:BRZ,China:CHN,Europe:EUR,Frozen-Antarctica:FAN,Ghana:GHN,India:IDA,Kenya:KNY,Libya:LBY,Near-East:NEE,Downunder:DOW,Pacific-Russia:PRU,Quebec:QUE,Russia:RUS,South-Africa:SAA,Union:UNN,Western-USA:WUS"
) do (
	if "!var!"=="" (
		for /f "tokens=1,2,3* delims=," %%a in ('echo %%~0') do (
			choice /m "%%a [%%c players]"
			if !errorlevel!==1 (
				set var=%%b
				set p=%%c
				set all_cty=%%d
				set all_cty=!all_cty:,= !
			)
		)
	)
)
if "%var%"=="" goto Variants

choice /c nl /n /m "Start [N]ew game or [L]oad saved game?"

if %errorlevel%==1 (
	echo Available press levels:
	echo  A.] 0=No Press
	echo  B.] 10=Peace and Alliances
	echo  C.] 20=Order proposals
	echo *D.] 30=Multipart Offers
	echo  E.] 40=Sharing out the Supply Centres
	echo  F.] 50=Nested Multipart Offers
	echo  G.] 60=Queries and Insistences
	echo  H.] 70=Requests for suggestions
	echo  I.] 80=Accusations
	echo  J.] 90=Future discussions
	echo  K.] 100=Conditionals
	echo  L.] 110=Puppets and Favours
	echo  M.] 120=Forwarding Press
	echo  N.] 130=Explanations
	echo  O.] 800=Free Text
	echo *Note: Current bots limited to D.] 30, this is recommended for games with bots
	choice /c abcdefghijklmno /n
	if !errorlevel!==1 set lvl=0
	if !errorlevel!==2 set lvl=10
	if !errorlevel!==3 set lvl=20
	if !errorlevel!==4 set lvl=30
	if !errorlevel!==5 set lvl=40
	if !errorlevel!==6 set lvl=50
	if !errorlevel!==7 set lvl=60
	if !errorlevel!==8 set lvl=70
	if !errorlevel!==9 set lvl=80
	if !errorlevel!==10 set lvl=90
	if !errorlevel!==11 set lvl=100
	if !errorlevel!==12 set lvl=110
	if !errorlevel!==13 set lvl=120
	if !errorlevel!==14 set lvl=130
	if !errorlevel!==15 set lvl=8000
	set add=
	echo Time limits default to no limit if no number is given
	echo 900 seconds is 15 minutes, which is a standard limit given for movements
	set /p mtl=Movement deadline in seconds: && set add=-mtl=!mtl!
	set /p rtl=Retreat deadline in seconds: && set add=!add! -rtl=!rtl!
	set /p btl=Adjustment dealine in seconds: && set add=!add! -btl=!btl!
	choice /m "Allow any order to be submitted, even mistaken orders doomed to be rejected?"
	if !errorlevel!==1 set add=!add! -aoa
	choice /m "Allow partial draws?"
	if !errorlevel!==1 set add=!add! -pda
	choice /m "Skip player assignments and play a randomized local game against bots?"
	if !errorlevel!==1 (
		set d=50
		set /p d="Bot difficulty [4-100], defaults to !d!: "
		echo Starting game...
		start "" /d "%~dp0aiserver" /b AiServer.exe -start -fixedpowers -var=%var% -lvl=!lvl! !add!
		timeout /t 3 > nul
		for /l %%0 in (1,1,!p!) do set p_!random:~-1!!random:~-1!!random:~-1!!random:~-1!!random:~-1!=%%0
		for /f "tokens=2 delims==" %%0 in ('set p_') do set h=%%0
		for /f "tokens=1 delims==" %%0 in ('set p_') do set %%0=
		if exist "%~dp0aimapper\*.clg" del "%~dp0aimapper\*.clg"
		for /l %%0 in (1,1,!p!) do (
			if !h!==%%0 (start "" /d "%~dp0aimapper" /b AiMapper.exe -nHuman -cPlayer
			) else start "" /d "%~dp0albert" /b Albert.exe -t -d!d!
			timeout 1 > nul
		)
		goto Save
	)
	echo Starting server...
	start "" /d "%~dp0aiserver" /b AiServer.exe -start -fixedpowers -var=%var% -lvl=!lvl! !add!
	timeout /t 3 > nul
	echo Filling player slots...
	if exist "%~dp0aimapper\*.clg" del "%~dp0aimapper\*.clg"
	for /l %%0 in (1,1,!p!) do start "" /d "%~dp0aimapper" /b AiMapper.exe -n%%0 -cPlayer
	timeout /t 3 > nul
	taskkill /f /im aimapper.exe > nul
) else (
	start "" /d "%~dp0aiserver" /b AiServer.exe -fixedpowers
	echo Load your saved game now and press any key once the server has started
	pause > nul
)

set p=0
set rand_cty=
for %%0 in (%all_cty%) do (
	set /a p=!p!+1
	set rand_cty=!rand_cty!!random:~-1!!random:~-1!!random:~-1!!random:~-1!!random:~-1!:!p!:%%0 
)

echo The following player assignments are in a randomly generated order

set d=50
for /f %%0 in (
	'^(
		for %%a in ^(%rand_cty%^) do @^(echo %%a^)
	^) ^| sort'
) do (
	for /f "tokens=2,3,4 delims=:" %%a in ('echo %%0') do (
		if %%a==1 set rpc=41
		if %%a==2 set rpc=2083
		if %%a==3 set rpc=6334
		if %%a==4 set rpc=1924
		if %%a==5 set rpc=2785
		if %%a==6 set rpc=7532
		if %%a==7 set rpc=3286
		if %%a==8 set rpc=4782
		if %%a==9 set rpc=2386
		if %%a==10 set rpc=8080
		if %%a==11 set rpc=5705
		if %%a==12 set rpc=3569
		if %%a==13 set rpc=6897
		if %%a==14 set rpc=443
		if %%a==15 set rpc=1769
		if %%a==16 set rpc=491
		if %%a==17 set rpc=2995
		set cty=%%b
		set rcty=%%c
	)
	echo !cty!
	choice /c hbc /n /m "[H]uman, [B]ot, or [C]ivil disorder?"
	if !errorlevel!==1 (
		echo Power:		!rcty!
		echo Passcode:	!rpc!
		choice /m "Open a client instance now to play as !cty! locally?"
		if !errorlevel!==1 start "" /d "%~dp0aimapper" /b AiMapper.exe -n!cty! -cPlayer
	) else (
		if !errorlevel!==2 (
			set /p d="Bot difficulty [4-100], defaults to !d!: "
			start "" /d "%~dp0albert" /b Albert.exe -t -d!d! -r!rcty!:!rpc!
		)
		if !errorlevel!==3 start "" /d "%~dp0holdbot" /b AiClient.exe -r!rcty!:!rpc!
	)
)

choice /m "Open an observer client instance just for observing the game?"
if !errorlevel!==1 start "" /d "%~dp0aimapper" /b AiMapper.exe -nObserver -cObserver

:Save
echo If you would like to save your game later, keep this window open
choice /m "Would you like to save your game now?"
if %errorlevel%==1 (
	if exist "%~dp0aiserver\tcpiplog.txt" (
		set /p fn=File name: 
		if /i not "!fn:~-4!"==".txt" set fn=!fn!.txt
		copy "%~dp0aiserver\tcpiplog.txt" "%~dp0aiserver\!fn!" /-y
	) else (
		echo There is no log file to save at this time
		echo Ensure your server has permission to write to its home directory
	)
)
pause