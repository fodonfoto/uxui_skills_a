#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  prepare_local_capture.sh --html-url URL [--name NAME] [--port PORT] [--workdir DIR]

Description:
  Downloads a Stitch htmlCode.downloadUrl, injects the Figma capture script if missing,
  serves it on localhost, and prints shell-friendly environment variables.

Outputs:
  EXPORT_DIR=...
  EXPORT_FILE=...
  SERVER_PID=...
  LOCAL_URL=...
EOF
}

HTML_URL=""
NAME="stitch-screen"
PORT="8787"
WORKDIR=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --html-url)
      HTML_URL="$2"
      shift 2
      ;;
    --name)
      NAME="$2"
      shift 2
      ;;
    --port)
      PORT="$2"
      shift 2
      ;;
    --workdir)
      WORKDIR="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [[ -z "$HTML_URL" ]]; then
  echo "Error: --html-url is required." >&2
  usage >&2
  exit 1
fi

if [[ -z "$WORKDIR" ]]; then
  WORKDIR="$(mktemp -d "${TMPDIR:-/tmp}/stitch-figma-XXXXXX")"
fi

if lsof -i ":$PORT" -P -n >/dev/null 2>&1; then
  echo "Error: port $PORT is already in use." >&2
  exit 1
fi

mkdir -p "$WORKDIR"

SAFE_NAME="$(printf '%s' "$NAME" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-')"
FILE_NAME="${SAFE_NAME%.html}.html"
FILE_PATH="$WORKDIR/$FILE_NAME"
PID_FILE="$WORKDIR/http-server.pid"

curl -L "$HTML_URL" -o "$FILE_PATH" >/dev/null

CAPTURE_TAG='<script src="https://mcp.figma.com/mcp/html-to-design/capture.js" async></script>'
if ! rg -Fq "$CAPTURE_TAG" "$FILE_PATH"; then
  perl -0pi -e "s#</head>#  $CAPTURE_TAG\n</head>#i" "$FILE_PATH"
fi

cd "$WORKDIR"
python3 -m http.server "$PORT" --bind 127.0.0.1 </dev/null >/dev/null 2>&1 &
SERVER_PID=$!
disown "$SERVER_PID" 2>/dev/null || true
sleep 1
if ! kill -0 "$SERVER_PID" >/dev/null 2>&1; then
  echo "Error: failed to start local http server on port $PORT." >&2
  exit 1
fi
echo "$SERVER_PID" > "$PID_FILE"

LOCAL_URL="http://localhost:$PORT/$FILE_NAME"

printf 'EXPORT_DIR=%s\n' "$WORKDIR"
printf 'EXPORT_FILE=%s\n' "$FILE_PATH"
printf 'SERVER_PID=%s\n' "$SERVER_PID"
printf 'LOCAL_URL=%s\n' "$LOCAL_URL"
