# Telegram Bot Setup Guide

This guide explains how to create a Telegram bot and retrieve the required
**Bot API Token** and **Chat ID** for sending messages from PowerShell.

---

## 🤖 Step 1: Create a Telegram Bot

1. Open Telegram
2. Search for **@BotFather**
3. Start a chat and run:
```bash
/start
```
4. Create a new bot:
```bash
/newbot
```
5. Enter:
- Bot name (example: `PRTGGraphAutomation`)
- Bot username (must end with `bot`)
  ```bash
  PRTGGraphAutomationbot
  ```
6. BotFather will return a token:
```token
123456789:AAE_xxxxxxxxxxxxxxxxxxxxx
```

  📌 **Save this token securely**  
This is your **Telegram Bot API Token**.

---

## 🔐 Step 2: Add the Bot to Telegram

### Option A: Personal Chat
- Open your bot using:
```bash
https://t.me/<your_bot_username>
```
- Click **Start**

### Option B: Group / Channel
1. Create a Telegram group or channel
2. Add your bot to the group
3. (Recommended) Promote bot to **Admin**
 - Required for sending messages in groups/channels

---

## 🆔 Step 3: Get Your Chat ID

### Method 1: Using Telegram API (Recommended)

1. Send **any message** to the bot:
```message
hello
```
2. Open in browser:
```link
https://api.telegram.org/bot<YOUR_BOT_TOKEN>/getUpdates
```
3. Look for:
```json
"chat": {
    "id": -1001234567890,
    "type": "group",
    "title": "PRTG Alerts"
}
```

📌 Chat ID examples
- Personal chat: 123456789
- Group / Channel: -1001234567890

---

🔒 Security Best Practices
- Rotate token if exposed
- Use private repos for production automation
- Restrict bot to required groups only

---
