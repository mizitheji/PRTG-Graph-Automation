# Windows Task Scheduler Configuration

This document explains the correct configuration required for running
GraphAutomation.ps1 reliably.

## General Tab

- Run whether user is logged on or not ✅
- Run with highest privileges ✅
- Do NOT check "Do not store password" ❌

Why?
Windows runs tasks without stored passwords using a restricted token,
which breaks:
- PowerShell execution
- Network access
- API calls

## How to setup Task scheduler

1. On windows search bar, type "Task Scheduler".

2. To create basic task, right click on the **Task Scheduler Library** and click **Create Basic Task...**.

<p align="center">
  <img src="screenshots/Create basic task.png" alt="Create basic task"><br>
</p>

3. 


