set path=%path%;"C:\Program Files\Firebird\Firebird_1_5\bin\"
gfix mart.fdb -shut -force 0 -user SYSDBA -pass masterkey
copy mart.fdb mart_backup.fdb
gfix -v -full mart.fdb -user SYSDBA -pass masterkey
gfix -mend -full -ignore mart.fdb -user SYSDBA -pass masterkey
gfix -v -full mart.fdb -user SYSDBA -pass masterkey
gbak -b -v -ig -g mart.fdb mart.fbk -user SYSDBA -pass masterkey
ren mart.fdb mart_old.fdb
gbak -c -r -v mart.fbk mart.fdb -user SYSDBA -pass masterkey

