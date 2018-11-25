# Rsync to sync the database file

Haven't tested yet in our environment, but previous experience proved this working.

## Command

- In archive mode

```shell
rsync -avzP -e 'ssh xxx' xxx@bridges.psc.edu:/pylon5/bi5fpep/yiz141/idb_runtime/ /home/bak
```

- Copy from one folder to other

```shell
rsync -aP /pylon5/bi5fpep/yiz141/idb_runtime/data/ $RAMDISK
```
