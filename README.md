# PRTG-Graph-Automation
This project automates the daily download of PRTG sensors graphs and sends them to Telegram using the PRTG API and a PowerShell script.

It is designed to run **unattended via Windows Task Scheduler** on a PRTG server.

---

## 🚀 Features

- Uses **PRTG API Token** (no username/password)
- Downloads last 24h sensor graphs
- Generates readable captions from filenames
- Sends graphs to Telegram
- Fully compatible with **Windows Task Scheduler**
- Safe for non-interactive execution

---

## 📦 Requirements

- Windows Server with **PRTG Network Monitor**
- PowerShell 5.1+
- Telegram Bot Token & Chat ID
- PRTG API Token

---

## 🔐 PRTG API Token

Using an API token is **recommended** over username/password authentication.

### Benefits
- More secure
- No password rotation issues
- Works reliably with automation
- Least-privilege friendly

See:
docs/prtg-api-token.md

---

## ⚙️ Configuration

Edit the following variables inside:
scripts/GraphAutomation.ps1
```powershell
$PRTGServer  = "https://prtg.example.com"
$APIToken   = "PRTG_API_TOKEN"
$BotToken   = "TELEGRAM_BOT_TOKEN"
$ChatID     = "TELEGRAM_CHAT_ID"
```

---

## 🕒 Windows Task Scheduler Setup

The script is designed to run via Task Scheduler.

**Program**
```script
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
```

**Arguments**
```script
-ExecutionPolicy Bypass -NonInteractive -File "C:\Program Files (x86)\PRTG Network Monitor\notifications\exe\GraphAutomation.ps1"
```

**Start in (IMPORTANT)**
```script
C:\Program Files (x86)\PRTG Network Monitor\notifications\exe
```

## 🔐 Task Scheduler – Security Options (CRITICAL)

| Setting | Value
| :--- | :--- |
| Run whether user is logged on or not | ✅ |
| Do not store password | ❌ UNCHECKED |
| Run with highest privileges | ✅ |
| User account | Administrator / Service Account |

📌 Do **NOT** check “Do not store password”
This will cause PowerShell, API calls, and Telegram sending to fail silently.

See: docs/task-scheduler.md

---

## 🧪 Testing

🔐 Environment Variables (IMPORTANT)
Before running the script, set these once on the PRTG server. Run Powershell as **Administrator**.
```powershell
setx PRTG_API_TOKEN "insert your PRTG_API_TOKEN" /M
setx TELEGRAM_BOT_TOKEN "insert your TELEGRAM_BOT_TOKEN" /M
setx TELEGRAM_CHAT_ID "insert your TELEGRAM_CHAT_ID" /M
```
Close powershell **(MUST)** if not the script will fail.

Open a new Powershell and run the script.
```powershell
.\GraphAutomation.ps1
```

Then test from Task Scheduler:
```script
Right click on the created task → Run
```

Expected result:
- Exit code: 0x0
- Telegram message received

---

## 🛡️ Best Practices
- Use a dedicated service account for scheduled tasks
- Restrict API token permissions
- Rotate Telegram bot tokens periodically
- Enable Task Scheduler history for debugging

---
