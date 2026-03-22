#!/bin/bash
# Marp Skill - 依存関係セットアップ
# 初回利用時に実行する

set -e

echo "=== Marp Skill セットアップ ==="

# apt update (Chrome依存解決とpoppler取得に必要)
echo "[update] apt package list"
sudo apt-get update -qq

# marp-cli
if ! command -v marp &> /dev/null; then
  echo "[install] @marp-team/marp-cli"
  npm install -g @marp-team/marp-cli
else
  echo "[ok] marp-cli"
fi

# Google Chrome (PDF/画像出力に必要)
if ! command -v google-chrome-stable &> /dev/null && ! command -v google-chrome &> /dev/null; then
  echo "[install] Google Chrome + dependencies"
  curl -fsSL -o /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt-get install -y /tmp/chrome.deb
  rm -f /tmp/chrome.deb
else
  echo "[ok] Google Chrome"
fi

# poppler-utils (pdftoppm: PDF→JPG変換)
if ! command -v pdftoppm &> /dev/null; then
  echo "[install] poppler-utils"
  sudo apt-get install -y poppler-utils
else
  echo "[ok] poppler-utils"
fi

echo ""
echo "=== セットアップ完了 ==="
echo ""
marp --version 2>/dev/null && echo "[ok] marp"
(google-chrome-stable --version 2>/dev/null || google-chrome --version 2>/dev/null) && echo "[ok] chrome"
pdftoppm -v 2>&1 | head -1 && echo "[ok] pdftoppm"
