# Zulip Daily Message Bot

Sends an automatic daily Zulip message to a channel every morning at 09:00 via GitHub Actions.

## Setup

### 1. Add Files to Repo
```
ZULIP-BOT/
├── send_daily_message.sh
├── .github/
│   └── workflows/
│       └── daily-reminder.yml
└── README.md
```

### 2. Get Your Zulip API Key

Zulip → **Settings** → **Account & privacy** → **API key** → **Show/Generate your API key**

### 3. Add GitHub Secrets

Repo → **Settings** → **Secrets and variables** → **Actions** → **New repository secret**

| Secret | Value | Example |
|--------|-------|---------|
| `ZULIP_EMAIL` | Your Zulip email address | `you@yourorg.zulipchat.com` |
| `ZULIP_API_KEY` | Your Zulip API key | `abcdef1234567890...` |
| `ZULIP_SITE` | Zulip instance URL | `https://yourorg.zulipchat.com` |
| `ZULIP_TO` | Channel name | `Bulut Bilişim Genel` |

### 4. Test

Repo → **Actions** → **Daily Zulip Message** → **Run workflow**

## Customize the Message

Edit the `MESSAGE` variable in `send_daily_message.sh`. Markdown is supported.