set path=%path%;"C:\Program Files\Firebird\Firebird_2_1\bin\"
gfix taxi.fdb -shut -force 0 -user SYSDBA -pass masterkey
copy taxi.fdb taxi_backup.fdb
gfix -v -full taxi.fdb -user SYSDBA -pass masterkey
gfix -mend -full -ignore taxi.fdb -user SYSDBA -pass masterkey
gfix -v -full taxi.fdb -user SYSDBA -pass masterkey
gbak -b -v -ig -g taxi.fdb taxi.fbk -user SYSDBA -pass masterkey
ren taxi.fdb taxi_old.fdb
gbak -c -rep -v taxi.fbk taxi.fdb -user SYSDBA -pass masterkey

