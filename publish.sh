#!/bin/bash
# GitHub CLI（gh）でリポジトリを作成し、GitHub Pages を有効化します。
set -e
REPO=${1:-sengoku-3d}
cd "$(dirname "$0")"
git init -b main
git add .
git commit -m "戦国合戦 3D俯瞰デモ（諏訪原城・関ヶ原）"
gh repo create "$REPO" --public --source=. --push
gh api -X POST "repos/{owner}/{repo}/pages" -f "source[branch]=main" -f "source[path]=/" >/dev/null
OWNER=$(gh api user -q .login)
echo "公開URL（反映まで1〜2分）: https://${OWNER}.github.io/${REPO}/"
