> Daniel 


- Backup home and exclude directories in exclude file 


`sudo borg create --verbose --stats --exclude-from ~/.config/borg_exclude.txt /mnt/windows/Users/Daniel/Documents/linux_backup::version-$version ~`



- List borg snapshots in repo 

`borg list /mnt/windows//Users/Daniel/Documents/linux_backup`


- List info about snapshot in repo

`borg info /mnt/windows//Users/Daniel/Documents/linux_backup::version-0.01`