#/bin/sh
cd /data/openpilot || exit 
sed 's#"https://api.commadotai.com/"#"https://c2.openpilot.net/myPilot/"#g' common/api/__init__.py -i
sed 's#ATHENA_HOST + "/ws/v2/" + dongle_id#"wss://c2.openpilot.net/ws?dongleId=" + dongle_id#' selfdrive/athena/athenad.py -i
grep 'from="' /data/params/d/GithubSshKeys >/dev/null ; s1=$?
grep '127.0.0.1' /data/params/d/GithubSshKeys >/dev/null ; s2=$?
[ $s1 -eq 0 -a $s2 -ne 0 ] && sed -i 's/from="/from="127.0.0.1\/32,/' /data/params/d/GithubSshKeys
ps ux|grep -v grep |grep selfdrive.athena.athenad|awk '{print $1}'|xargs kill -9
