#!/usr/bin/env bash

filename=/data/update_package.zip

# Read Password
echo -n Password for update_package.zip:
read -s password
echo
# Run Command
echo $password

7z t -p$password $filename

unzip -P $password $filename
mkdir fw
cp update.zip fw
cd fw
unzip update.zip
mkdir /tmp/car
mount system.ext4 /tmp/car

echo "<permissions>
</permissions>" > /tmp/car/etc/permissions/com.hkmc.software.engineermode.adb_hide.xml

umount /tmp/car
img2simg system.ext4 system.img
cd ..
python3 gen5.py encrypt fw security_force
mv security_force /data

# docker run --privileged --rm -v /yyyy/xxxx/Downloads/NaU/ADB_enable/:/data -it <image_id> bash /app/docker_entrypoint.sh