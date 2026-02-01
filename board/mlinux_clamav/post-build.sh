#/bin/sh
#configuring clamd and freshclam
cp ${TARGET_DIR}/usr/etc/clamd.conf.sample ${TARGET_DIR}/usr/etc/clamd.conf
cat ${TARGET_DIR}/usr/etc/clamd.conf | grep -E '^Example' | sed -i 's/Example/#Example/' ${TARGET_DIR}/usr/etc/clamd.conf
echo "DatabaseDirectory /var/lib/clamav" >> ${TARGET_DIR}/usr/etc/clamd.conf
#echo "TCPSocket 3310" >> ${TARGET_DIR}/usr/etc/clamd.conf
echo "ExtendedDetectionInfo yes" >> ${TARGET_DIR}/usr/etc/clamd.conf
echo "PidFile /var/run/clamd.pid" >> ${TARGET_DIR}/usr/etc/clamd.conf
echo "LocalSocket /tmp/clamd.socket" >> ${TARGET_DIR}/usr/etc/clamd.conf
echo "FixStaleSocket yes" >> ${TARGET_DIR}/usr/etc/clamd.conf


cp ${TARGET_DIR}/usr/etc/freshclam.conf.sample ${TARGET_DIR}/usr/etc/freshclam.conf
cat ${TARGET_DIR}/usr/etc/freshclam.conf | grep -E '^Example' | sed -i 's/Example/#Example/' ${TARGET_DIR}/usr/etc/freshclam.conf
echo "DatabaseDirectory /var/lib/clamav" >> ${TARGET_DIR}/usr/etc/freshclam.conf
echo "UpdateLogFile /var/log/freshclam.log" >> ${TARGET_DIR}/usr/etc/freshclam.conf
echo "LogRotate yes" >> ${TARGET_DIR}/usr/etc/freshclam.conf
echo "PidFile /var/run/freshclam.pid" >> ${TARGET_DIR}/usr/etc/freshclam.conf
echo "DatabaseMirror http://database.clamav.net" >> ${TARGET_DIR}/usr/etc/freshclam.conf

# Create the custom os-release file content
#echo 'NAME="Custom Buildroot Linux"' > $TARGET_DIR/etc/os-release
#echo 'VERSION="1.0"' >> $TARGET_DIR/etc/os-release
#echo 'ID=buildroot' >> $TARGET_DIR/etc/os-release
#echo 'PRETTY_NAME="Custom Buildroot Linux 1.0"' >> $TARGET_DIR/etc/os-release
#echo 'BUILD_ID="20260118"' >> $TARGET_DIR/etc/os-release

#setting PATH environment variable
sed -i  's|^.*export PATH=.*$|export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"|' $TARGET_DIR/etc/profile

#set permissions
chmod 755 $TARGET_DIR/etc/init.d/S50copy_clamdb
chmod 755 $TARGET_DIR/etc/init.d/S89clamd
chmod 755 $TARGET_DIR/usr/local/bin/custom_mount
