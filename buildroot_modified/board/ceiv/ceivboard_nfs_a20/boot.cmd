setenv fdt_high ffffffff
setenv ipaddr 192.168.0.4
setenv serverip 192.168.0.5
setenv bootargs noinitrd console=ttyS0,115200 init=/linuxrc root=/dev/nfs rw nfsroot=192.168.0.5:/home/hui/Ceiv_linux/nfs/target,proto=tcp,nfsvers=3,nolock,rsize=1024,wsize=1024 ip=192.168.0.4:192.168.0.5:192.168.0.1:255.255.255.0::eth0:off
tftp $fdt_addr_r sun7i-a20-cubieboard2.dtb
tftp $kernel_addr_r zImage
bootz $kernel_addr_r - $fdt_addr_r
