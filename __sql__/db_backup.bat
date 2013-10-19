set path=%path%;"C:\Program Files\Firebird\Firebird_2_1\bin\"
gfix.exe taxi.fdb -shut -force 0 -user SYSDBA -pass masterkey
gbak.exe -b -v taxi.fdb taxi.fbk -user SYSDBA -pass masterkey
@echo 
@echo АРХИВАЦИЯ почти закончена. Можно запускать СМЕНУ
@echo 
"C:\Program Files\winrar\winrar.exe" a -rr5p -m5 -ibck -ag_YYYYMMDD_HHMMSS taxi taxi.fbk

