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

## Action Tab

Program:
```bash
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
```
Arguments:
```bash
-ExecutionPolicy Bypass -NonInteractive -File "C:\Program Files (x86)\PRTG Network Monitor\notifications\exe\GraphAutomation.ps1"
```
Start in:
```bash
C:\Program Files (x86)\PRTG Network Monitor\notifications\exe
```


