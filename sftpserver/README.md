# vagrants -> sftpserver

This is an ubuntu 14.04 virtual box to spin up a SFTP server with a user in a chrooted environment.

Once the vagrant is brought up, you can connect to the sftp server as the user sftpuser using the "public" ip. Once connected cd into the repository which has write permissions for the user and you can put files there.

$ sftp sftpuser@<IP of SFTP server>

Example:

$ sftp sftpuser@192.168.0.12
sftpuser@192.168.0.12's password:
Connected to 192.168.0.12.
sftp> ls
repository
sftp> cd repository
sftp> put bootstrapper.sh
Uploading bootstrapper.sh to /repository/bootstrapper.sh
bootstrapper.sh                                                        100% 1056     1.0KB/s   00:00
sftp> ls
bootstrapper.sh
