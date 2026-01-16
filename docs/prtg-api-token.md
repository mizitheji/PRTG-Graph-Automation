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

---

## How to setup user for the API and get the API key from PRTG

1. On the PRTG and the very top, click **Setup**.
2. Under **System Administration**, click **User Accounts**.
<p align="center">
  <img src="../screenshots/User account tab.png" alt="User account tab"><br>
</p>

3. At the very right of the screen, click **+** icon > **Add User**.
<p align="center">
  <img src="../screenshots/add user tab.png" alt="add user tab"><br>
</p>

4. Under **User Account Settings**, fill in:
  - Login Name
  - Display Name
  - Primary Email Address
  - Password
  - Confirm Password

  On the **Account Settings** select **Read-only user and click **Create**.
<p align="center">
  <img src="../screenshots/add user.png" alt="add user"><br>
</p>

5. After user creation, click the created user.
<p align="center">
  <img src="../screenshots/click the user.png" alt="click the user"><br>
</p>

6. Click **API Keys** tab > **+** icon > **Add API Key**.
<p align="center">
  <img src="../screenshots/click the api tab.png" alt="click the api tab"><br>
</p>

<p align="center">
  <img src="../screenshots/click api key.png" alt="click api key"><br>
</p>

7. In the **Add New API Key** window, fill in the Name. API Key will be display at the bottom of the window. Click ok.
   > Note: Copy and store the API key because after clicking **OK** , the API key will not be visible again.
<p align="center">
  <img src="../screenshots/save the api key.png" alt="save the api key"><br>
</p>

---
