# Zulip Daily Message Bot

Sends an automatic daily Zulip message every morning at 09:00 via GitHub Actions.

## Setup

### 1. Add Files to Repo
```
ZULIP-BOT/
├── send_daily_message.sh
├── .github/
│   └── workflows/
│       └── daily-message.yml
└── README.md
```

### 2. Create a Zulip Bot

1. Zulip → **Settings** → **Personal settings** → **Bots**
2. **Add a new bot** → Type: **Generic bot**
3. Copy the `API key` and `bot email`

### 3. Add GitHub Secrets

Repo → **Settings** → **Secrets and variables** → **Actions** → **New repository secret**

| Secret | Value | Example |
|--------|-------|---------|
| `ZULIP_EMAIL` | Bot email address | `mybot-bot@yourorg.zulipchat.com` |
| `ZULIP_API_KEY` | Bot API key | `abcdef1234567890...` |
| `ZULIP_SITE` | Zulip instance URL | `https://yourorg.zulipchat.com` |
| `ZULIP_TO` | Your user ID | `1020816` |

### 4. Test

Repo → **Actions** → **Daily Zulip Message** → **Run workflow**

## Customize the Message

Edit the `MESSAGE` variable in `send_daily_message.sh`. Markdown is supported.