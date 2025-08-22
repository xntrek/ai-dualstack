Storage (ZFS Example)

`sudo zpool create -f zfs-pool raidz /dev/nvme0n1 /dev/nvme1n1 /dev/nvme2n1`
`sudo zfs create zfs-pool/vm-storage`
`sudo pvesm add zfspool zfs-pool --pool zfs-pool --content rootdir,images`