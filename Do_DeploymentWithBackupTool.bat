%echo off 
REM 版本宣告=====
echo "ver. 1.0-20180314-初版建立"
echo "ver. 1.1-20180316-加入備份功能"
echo "ver. 2.0-20180426-重要設定從bat移至文字檔"
echo "ver. 3.0-20190111-改造成抓取打包資料，自動建立LIST，然後備份LIST內資料，最後上版"
REM 版本宣告=====

REM 變數設定=====
set ALL_SETTING=.\Update_Set_UpdateItem.txt 
@Echo Off
For /f "tokens=1* delims=:" %%i in ('Type %ALL_SETTING%^|Findstr /n ".*"') do (
If "%%i"=="1" set LIST=%%j
If "%%i"=="2" set FROM_FOLDER=%%j
If "%%i"=="3" set GOAL_FOLDER=%%j
If "%%i"=="4" set BACKUP_FOLDER=%%j
)
echo 變數資料:
echo ALL_SETTING[%ALL_SETTING%]
echo LIST[%LIST%]
echo FROM_FOLDER[%FROM_FOLDER%]
echo GOAL_FOLDER[%GOAL_FOLDER%]
echo BACKUP_FOLDER[%BACKUP_FOLDER%]
REM 變數設定=====

REM 已下備份資料夾之時間格式設定=====
REM echo %date%   結果為 yyyy/MM/dd
REM echo %date:~0,4%  結果為 yyyy
REM echo %date:~5,2%  結果為 MM
REM echo %date:~8,2%  結果為 dd
REM echo %time%   結果為 hh:mm:ss.ss
REM echo %time:~0,2% 結果為 hh
REM echo %time:~3,2% 結果為 mm
REM 重點就在於 date 後 :~x,y 這個動作
REM x 代表從第幾個位置開始取，從 0 起算
REM y 代表要取幾個字

set yyyymmdd=%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%
rem echo %yyyymmdd%
REM 已上備份資料夾之時間格式設定=====

REM 實際執行=====
echo "======start"
echo "請注意:"
echo "會從設定變數的FROM_FOLDER資料複製到變數GOAL_FOLDER的資料夾(變數結尾請勿放'\')"
echo "也就是會從[ %FROM_FOLDER% ]置換複製位置到[ %GOAL_FOLDER% ]"
echo "清單複製目標(文件內請保留開頭'\'跟相對路徑):[ %LIST% ]到指定資料夾"
echo "此外，如果目標資料夾有相同資料，會排除複製未異動檔案不作複製"

CHOICE /C YNC /M "確認請按 Y，否請按 N，或者取消請按 C。" 

echo "======"
echo "---讀取[ %LIST% ]表列如下:"
for /f %%a in (%LIST%) do ( 
    echo %GOAL_FOLDER%%%a 
)

echo "---"
echo 預備備份以上資料
echo "備份目標[ %GOAL_FOLDER% ]"
echo "存放位置[ %BACKUP_FOLDER% ]"
CHOICE /C YNC /M "確認請按 Y，否請按 N，或者取消請按 C。" 

echo "開始執行備份:"
for /f %%a in (%LIST%) do ( 
    for %%F in ("%%a") do XCOPY "%GOAL_FOLDER%%%a" "%BACKUP_FOLDER%\%yyyymmdd%%%~pF" /S /D /Y /C /R   
)

echo "---"
echo 備份完畢，執行上版公作
echo "來源位置[ %FROM_FOLDER% ]"
echo "覆蓋目標位置[ %GOAL_FOLDER% ]"
CHOICE /C YNC /M "確認請按 Y，否請按 N，或者取消請按 C。" 

echo "開始執行複製:"
for /f %%a in (%LIST%) do ( 
    for %%F in ("%%a") do XCOPY "%FROM_FOLDER%%%a" "%GOAL_FOLDER%%%~pF" /S /D /Y /C /R   
)


echo "======end"
REM 實際執行=====

pause