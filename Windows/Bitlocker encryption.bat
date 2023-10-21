:: Check if BitLocker is available
if not exist %SystemRoot%\System32\manage-bde.exe (
    echo BitLocker is not available on this system.
    exit /b 1
)

:: Enable bitlocker
manage-bde -protectors -add C: -TPM
manage-bde -on C: -RecoveryPassword -SkipHardwareTest -UsedSpaceOnly

:: Save RecoveryPassword in a temp folder
manage-bde -protectors C: -get >> C:\Temp\BitLocker_Recovery_Password.txt
