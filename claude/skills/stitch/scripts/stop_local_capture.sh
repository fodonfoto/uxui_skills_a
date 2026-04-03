#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  stop_local_capture.sh --pid PID
  stop_local_capture.sh --pid-file FILE
EOF
}

PID=""
PID_FILE=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --pid)
      PID="$2"
      shift 2
      ;;
    --pid-file)
      PID_FILE="$2"
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

if [[ -n "$PID_FILE" ]]; then
  PID="$(cat "$PID_FILE")"
fi

if [[ -z "$PID" ]]; then
  echo "Error: provide --pid or --pid-file." >&2
  exit 1
fi

if kill -0 "$PID" >/dev/null 2>&1; then
  kill "$PID"
fi
