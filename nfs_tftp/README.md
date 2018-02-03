# loading kernel & nfs from eth
1. tftp server
2. nfs server

# mount nfs
1. windows: mount 127.0.0.1:/share Z:
2. linux:   mount -t nfs -o nolock 127.0.0.1:/share /mnt
