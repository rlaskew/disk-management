#!/bin/bash

# notes
# 1. first tried -- ACG cloud server with Amazon Linux 2 .. they add nvme1n1 or 2 drive for your
# 2. second tried -- ACG cloud server -- ubuntu 20.04 -- works the same
# 3. third tried -- ACG cloud  server -- RHEL 8 -- works the same

## from
## https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html
## https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html
## https://www.tecmint.com/linux-file-system-explained/

# Step 1: become root
# sudo -i

# find disk name
# lsblk -f

# format disk .. in this case no partitioning -- NAME in tihs case is nvme1n1
# mkfs.xfs /dev/${NAME}

# make director where you want new device to be mounted to
# mkdir /data
# chmod go+w /data

# manually mount first
# mount /dev/${NAME} /data

# make backup copy of fstab
# cp /etc/fstab /etc/fstab.orig

# find new device UUID blkid or lsblk
# lsblk -o +UUID 

# add entry to fstab, obvi your UUID will be different
# UUID=aebf131c-6957-451e-8d34-ec978d9581ae  /data  xfs  defaults,nofail  0  2

# sanity check fstab is ok
# umount /data
# mount -a

# if you can't fix fstab errors
# mv /etc/fstab.orig /etc/fstab
