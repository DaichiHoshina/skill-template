#!/bin/bash
# 新しい公開スキルの repo を雛形から作る
# 使い方: new.sh <スキル名>   (kebab-case。同じ階層に <スキル名>/ を作る)
set -euo pipefail

NAME="${1:?使い方: new.sh <スキル名>}"
[[ "$NAME" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] || { echo "スキル名は kebab-case にしてください" >&2; exit 2; }

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
DEST="$(dirname "$HERE")/$NAME"
[[ -e "$DEST" ]] && { echo "既に存在します: $DEST" >&2; exit 2; }

mkdir -p "$DEST/skills/$NAME" "$DEST/scripts" "$DEST/.claude-plugin"
cp "$HERE/template/SKILL.md" "$DEST/skills/$NAME/SKILL.md"
cp "$HERE/template/README.md" "$HERE/template/LICENSE" "$HERE/template/.gitignore" "$DEST/"
cp "$HERE/template/.claude-plugin/plugin.json" "$DEST/.claude-plugin/"
cp "$HERE/scripts/check-public.sh" "$DEST/scripts/"
find "$DEST" -type f -not -path '*/.git/*' -exec sed -i.bak "s/__SKILL_NAME__/$NAME/g" {} \;
find "$DEST" -name '*.bak' -delete
git -C "$DEST" init -q
echo "作成しました: $DEST"
echo "次: skills/$NAME/SKILL.md を書き、scripts/check-public.sh で検査してから公開する"
