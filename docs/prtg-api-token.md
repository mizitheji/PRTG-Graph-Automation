# PRTG API Token Usage

This project uses a PRTG API token instead of username/password.

## Why API Token?

- More secure
- No credential exposure
- Ideal for automation
- Supported natively by PRTG

## How It Works

API requests authenticate using:
```bash
apitoken=YOUR_TOKEN
```
instead of:
```bash
username=xxx&passhash=yyy
```

## Token Permissions

Recommended:
- Read-only access to required sensors
- No admin permissions unless required
