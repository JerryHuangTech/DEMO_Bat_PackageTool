REM �����ŧi=====
echo "ver. 1.0-20180314-�쪩�إ�"
echo "ver. 1.1-20180316-�[�J�ƥ��\��"
echo "ver. 2.0-20180426-���n�]�w�qbat���ܤ�r��"
echo "ver. 2.1-20200205-��}���h��"
REM �����ŧi=====

REM �ܼƳ]�w=====
set ALL_SETTING=.\Update_Set_GoBack.txt 
@Echo Off
For /f "tokens=1* delims=:" %%i in ('Type %ALL_SETTING%^|Findstr /n ".*"') do (
If "%%i"=="1" set LIST=%%j
If "%%i"=="2" set FROM_FOLDER=%%j
If "%%i"=="3" set GOAL_FOLDER=%%j
)

echo ALL_SETTING[%ALL_SETTING%]
echo LIST[%LIST%]
echo FROM_FOLDER[%FROM_FOLDER%]
echo GOAL_FOLDER[%GOAL_FOLDER%]

REM �ܼƳ]�w=====

REM �w�U�ƥ���Ƨ����ɶ��榡�]�w=====
REM echo %date%   ���G�� yyyy/MM/dd
REM echo %date:~0,4%  ���G�� yyyy
REM echo %date:~5,2%  ���G�� MM
REM echo %date:~8,2%  ���G�� dd
REM echo %time%   ���G�� hh:mm:ss.ss
REM echo %time:~0,2% ���G�� hh
REM echo %time:~3,2% ���G�� mm
REM ���I�N�b�� date �� :~x,y �o�Ӱʧ@
REM x �N��q�ĴX�Ӧ�m�}�l���A�q 0 �_��
REM y �N��n���X�Ӧr

set yyyymmdd=%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%
rem echo %yyyymmdd%
REM �w�W�ƥ���Ƨ����ɶ��榡�]�w=====

REM ��ڰ���=====
echo "======start"
echo "�Ъ`�N:"
echo "�|�q�]�w�ܼƪ�FROM_FOLDER��m��Ƨ��ƻs���ܼ�GOAL_FOLDER��Ƨ�(�ܼƵ����Фũ�'\')"
echo "�]�N�O�|�q[ %FROM_FOLDER% ]�ƻs��m��[ %GOAL_FOLDER% ]"
echo "�M��ƻs�ؼ�(��󤺽ЫO�d�}�Y'\'��۹���|):[ %LIST% ]����w��Ƨ�"
echo "���~�A�p�G�ؼи�Ƨ����ۦP��ơA�|�ư��ƻs�������ɮפ��@�ƻs"

CHOICE /C YNC /M "�T�{�Ы� Y�A�_�Ы� N�A�Ϊ̨����Ы� C�C" 

echo "======"
echo "---Ū��[ %LIST% ]��C�p�U:"
for /f %%a in (%LIST%) do ( 
    echo "%FROM_FOLDER%%%a" 
)

echo "---"
echo ����]���ʧ@
echo "�ӷ���m[ %FROM_FOLDER% ]"
echo "�g�J�ؼЦ�m[ %GOAL_FOLDER% ]"
CHOICE /C YNC /M "�T�{�Ы� Y�A�_�Ы� N�A�Ϊ̨����Ы� C�C" 

echo "�}�l����ƻs:"
for /f %%a in (%LIST%) do ( 
    for %%F in ("%%a") do XCOPY "%FROM_FOLDER%%%a" "%GOAL_FOLDER%\%%~pF" /S /Y /C /R   
)

echo "======end"
REM ��ڰ���=====

pause