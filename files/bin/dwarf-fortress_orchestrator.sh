#!/bin/bash
ps aux |grep dwarf-fortress_script.sh |grep -v grep |wc -l > /toolbox/app/running.bit
#!/bin/bash
sleep 1;
if [ `cat /toolbox/app/running.bit` -eq "0" ]
then
#EXAMPLE script to check and run based on cron
/toolbox/app/bin/<APP_NAME_script.sh /toolbox/app/conf/dwarf-fortress_sources.csv /toolbox/data
fi
