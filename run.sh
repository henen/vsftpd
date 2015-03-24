#!/bin/bash

/init.sh
service vsftpd start && tail -f /var/log/vsftpd.log
