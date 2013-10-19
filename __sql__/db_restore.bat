set path=%path%;"C:\Program Files\Firebird\Firebird_2_1\bin\"
gfix taxi.fdb -shut -force 0 -user SYSDBA -pass masterkey
ren taxi.fdb taxi_old.fdb
gbak -rep -v taxi.fbk taxi.fdb -user SYSDBA -pass masterkey

