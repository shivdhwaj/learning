NELMAGES=`ls -lRt /boot/vmlinuz-*| awk -F/ '{print $3}' | grep -v $(uname -r) | sed 1d | sed -e 's/vmlinuz/linux-image/g'`

KERNELHEADERS=`ls -lRt /boot/vmlinuz-*| awk -F/ '{print $3}' | grep -v $(uname -r) | sed 1d | sed -e 's/vmlinuz/linux-headers/g'`

for PURGEKERNEL in `echo $KERNELMAGES $KERNELHEADERS`; do

    apt-get autoremove -y && apt-get purge $PURGEKERNEL -y

done
