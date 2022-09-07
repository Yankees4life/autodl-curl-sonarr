SET title=%1
SET downloadUrl=%2
SET apiKey=%3
for /f %%a in ('wmic Path Win32_UTCTime get Year^,Month^,Day^,Hour^,Minute^,Second /Format:List ^| findstr "="') do (SET %%a)
SET Second=0%Second%
SET Second=%Second:~-2%
SET Minute=0%Minute%
SET Minute=%Minute:~-2%
SET Hour=0%Hour%
SET Hour=%Hour:~-2%
SET Day=0%Day%
SET Day=%Day:~-2%
SET Month=0%Month%
SET Month=%Month:~-2%
SET UTCTIME=%Hour%:%Minute%:%Second%
SET UTCDATE=%Year%-%Month%-%Day%
SET date="%UTCDATE% %UTCTIME%"

curl -i -H "Accept: application/json" -H "Content-Type: application/json" -H "X-Api-Key: %apiKey%" -X POST -d '{"title":"'"%title%"'","downloadUrl":"'"%downloadUrl%"'","downloadProtocol":"torrent","publishDate":"'"%date%"'"}' http://localhost:8989/api/release/push &> NUL
