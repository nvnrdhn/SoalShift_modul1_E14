#!/bin/bash

cat /var/log/syslog | awk '
{
	temp = tolower($0)
	if ( NF < 13 && match(temp, "sudo") == 0 && match(temp, "cron") != 0 )
		print $0
}
' /home/somi/modul1/syslog
