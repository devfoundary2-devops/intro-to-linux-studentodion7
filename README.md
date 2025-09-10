# System Monitoring Script (sysmon.sh)

This is my **Intro to Linux GitHub Classroom assignment**.  
The script continuously logs CPU, memory, disk, and network usage every 5 minutes.

---

## 📌 Features
- Logs **CPU usage** (`mpstat` or `top` fallback)
- Logs **memory usage** (`free -h`)
- Logs **disk usage** for the root partition (`df -h /`)
- Logs **network statistics** for the active network interface (`ip -s link`)
- Appends all data to a log file (`sysmon.log`)

---

## 📂 Files in this repo
- `sysmon.sh` → The monitoring script  
- `sysmon.log` → log output from running the script  
- `screenshot.png` → Proof of the script running in the background  

---

## ⚙️ How to Run

1. **Clone the repo**
   ```bash
   git clone https://
   cd into your repo

2. Make the script executable 
   chmod +x sysmon.sh

3. Run the script in the background
   nohup ./sysmon.sh >/dev/null 2>&1 &

4. Verify the process is running
   ps aux | grep sysmon.sh

5. Check the log file
   tail -f ~/sysmon.log


