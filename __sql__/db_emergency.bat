@echo off
move \\TAXI\TAXI\taxi.fdb \\TAXI\TAXI\taxi_old.fdb
set path=%path%;"C:\Program Files\Firebird\Firebird_2_1\bin\"
gfix.exe taxi.fdb -shut -force 0 -user SYSDBA -pass masterkey
copy taxi.fdb \\TAXI\TAXI\taxi.fdb
echo 
echo    ­   α₯ΰ’₯ΰ₯. ΰε¨’¨ΰγ₯βαο ΰ₯§₯ΰ’­λ©... 
echo 
"C:\Program Files\winrar\winrar.exe" a -rr5p -m5 -ag_YYYYMMDD_HHMMSS emergency taxi.fdb
rem move taxi.fdb old_backup.fdb

