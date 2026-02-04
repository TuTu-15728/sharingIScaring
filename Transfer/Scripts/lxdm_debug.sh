#!/bin/bash
# Save as: ~/lxdm_i3_debug.sh

LOG_FILE="/tmp/lxdm_i3_debug.log"

echo "=== LXDM to i3 Debug Log - $(date) ===" > $LOG_FILE

# 1. Check what processes are running
echo -e "\n--- Running Processes ---" >> $LOG_FILE
ps aux | grep -E "(i3|Xorg|lxdm|Xauthority)" >> $LOG_FILE

# 2. Check X sessions
echo -e "\n--- X Sessions ---" >> $LOG_FILE
who | grep :0 >> $LOG_FILE
ls -la /tmp/.X11-unix/ >> $LOG_FILE

# 3. Check display manager service
echo -e "\n--- LXDM Service Status ---" >> $LOG_FILE
systemctl status lxdm >> $LOG_FILE

# 4. Check what's on display :0
echo -e "\n--- Windows on Display :0 ---" >> $LOG_FILE
xwininfo -root -tree -display :0 2>/dev/null >> $LOG_FILE

# 5. Check i3 status
echo -e "\n--- i3 Processes ---" >> $LOG_FILE
pgrep -a i3 >> $LOG_FILE

# 6. Check X authority
echo -e "\n--- X Authority ---" >> $LOG_FILE
ls -la ~/.Xauthority 2>/dev/null >> $LOG_FILE
echo $XAUTHORITY >> $LOG_FILE

echo -e "\n=== Debug Complete ===" >> $LOG_FILE
