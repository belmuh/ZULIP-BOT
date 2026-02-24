#!/bin/bash
# Zulip Daily Message Bot

set -euo pipefail

: "${ZULIP_EMAIL:?ZULIP_EMAIL is not set}"
: "${ZULIP_API_KEY:?ZULIP_API_KEY is not set}"
: "${ZULIP_SITE:?ZULIP_SITE is not set}"
: "${ZULIP_TO:?ZULIP_TO is not set}"

TODAY=$(date '+%A, %d %B %Y')

MESSAGE="${CUSTOM_MESSAGE:-What a wonderful world!

📅 **${TODAY}**}"

echo "Sending message to Zulip..."

RESPONSE=$(curl -s -o /tmp/zulip_response.json -w "%{http_code}" \
  -X POST "${ZULIP_SITE}/api/v1/messages" \
  -u "${ZULIP_EMAIL}:${ZULIP_API_KEY}" \
  --data-urlencode "type=stream" \
  --data-urlencode "to=${ZULIP_TO}" \
  --data-urlencode "topic=✔Workshop - Zulip integration" \
  --data-urlencode "content=${MESSAGE}")

if [ "$RESPONSE" -eq 200 ]; then
  echo "Message sent successfully! (HTTP $RESPONSE)"
else
  echo "Error! HTTP status: $RESPONSE"
  cat /tmp/zulip_response.json
  exit 1
fi