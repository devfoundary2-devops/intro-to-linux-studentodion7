#!/bin/env bash

#system monitor script

#Logs system info to /var/log/sysmon.log every 5 minutes

     while true; do
      echo "--- $(date) ---" >> /var/log/sysmon.log

       # CPU: show usage (instead of uptime load averages)
         echo "CPU:" >> /var/log/sysmon.log
          mpstat 1 1 | awk '/Average:/ {print "User: "$3"% | System: "$5"% | Idle: "$12"%"}' >> /var/log/sysmon.log

           # MEMORY: show used and free RAM only (ignore swap)
             echo "MEMORY:" >> /var/log/sysmon.log
              free -m | awk 'NR==2{printf "Used: %s MB | Free: %s MB | Total: %s MB\n",$3,$4,$2}' >> /var/log/sysmon.log

               # DISK: show only root (/) partition usage
                 echo "DISK:" >> /var/log/sysmon.log
                  df -h / | awk 'NR==2{print "Used: "$3" / "$2" ("$5")"}' >> /var/log/sysmon.log

                   # NETWORK: show eth0 status (packets in/out, errors)
                     echo "NET:" >> /var/log/sysmon.log
		     ip -s link show eth0 | grep -A 3 eth0 >> /var/log/sysmon.log

                       echo "" >> /var/log/sysmon.log
		      # Run every 5 minutes
                                 sleep 300   
			 done


