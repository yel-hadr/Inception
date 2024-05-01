service vsftpd start

# Add the USER, change his password and declare him as the owner of wordpress folder and all subfolders

adduser wordpress --disabled-password

echo "wordpress:$FTP_PASS" | /usr/sbin/chpasswd

echo "wordpress" | tee -a /etc/vsftpd.userlist 

mkdir /home/wordpress/ftp

chown nobody:nogroup /home/wordpress/ftp
chmod a-w /home/wordpress/ftp

mkdir /home/wordpress/ftp/files
chown wordpress:wordpress /home/wordpress/ftp/files

sed -i -r "s/#write_enable=YES/write_enable=YES/1"   /etc/vsftpd.conf
sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1"   /etc/vsftpd.conf

echo "
listen_ipv6=NO
listen=YES
local_enable=YES
allow_writeable_chroot=YES
pasv_enable=YES
local_root=/home/wordpress
pasv_min_port=40000
pasv_max_port=40005
userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

service vsftpd stop

/usr/sbin/vsftpd /etc/vsftpd.conf
