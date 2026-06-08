#!/usr/bin/env bash
# 安裝 AI 敏捷團隊到 ~/.claude/
# 換新電腦 / 換開發環境時，clone 這個 repo 後執行：bash install.sh
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="$HOME/.claude"

mkdir -p "$DEST/agents" "$DEST/skills" "$DEST/references" "$DEST/scripts"

# 32 個角色 agent
cp "$DIR"/agents/*.md "$DEST/agents/"

# 9 個通用 skill
cp -r "$DIR"/skills/* "$DEST/skills/"

# 素材庫 references（唯讀，外部引入）
if [ -d "$DIR/references" ]; then
  cp -r "$DIR/references/"* "$DEST/references/" 2>/dev/null || true
fi

# 自動化腳本
cp "$DIR"/scripts/*.sh "$DEST/scripts/" 2>/dev/null || true
chmod +x "$DEST/scripts/"*.sh 2>/dev/null || true

# team-knowledge symlink（跨專案知識共享核心）
if [ -L "$DEST/team-knowledge" ]; then
  rm "$DEST/team-knowledge"
fi
ln -sf "$DIR/team-knowledge" "$DEST/team-knowledge"
echo "ℹ team-knowledge symlink 建立完成 → $DIR/team-knowledge"

# assets symlink（自有打磨素材，可寫入）
if [ ! -d "$DIR/assets" ]; then
  mkdir -p "$DIR/assets/typography" "$DIR/assets/color-palettes" "$DIR/assets/visual-styles" \
           "$DIR/assets/brand-templates" "$DIR/assets/banner-sizes" "$DIR/assets/animation"
fi
if [ -L "$DEST/assets" ]; then
  rm "$DEST/assets"
fi
ln -sf "$DIR/assets" "$DEST/assets"
echo "ℹ assets symlink 建立完成 → $DIR/assets"

# 全域 CLAUDE.md
if [ -f "$DEST/CLAUDE.md" ]; then
  cp "$DEST/CLAUDE.md" "$DEST/CLAUDE.md.bak"
  echo "ℹ 已備份原有 ~/.claude/CLAUDE.md → ~/.claude/CLAUDE.md.bak"
fi
cp "$DIR/CLAUDE.md" "$DEST/CLAUDE.md"

# 合併 PostToolUse Hook 到 settings.json
SETTINGS="$DEST/settings.json"
if [ ! -f "$SETTINGS" ] || [ "$(cat "$SETTINGS")" = "{}" ] || [ "$(cat "$SETTINGS")" = "" ]; then
  cat > "$SETTINGS" << 'HOOK_EOF'
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "bash ~/.claude/scripts/update-index.sh"
          }
        ]
      }
    ]
  }
}
HOOK_EOF
  echo "ℹ PostToolUse Hook 已寫入 $SETTINGS"
else
  echo "⚠ $SETTINGS 已有內容，請手動合併以下 Hook："
  echo '  "hooks": { "PostToolUse": [{ "matcher": "Write|Edit", "hooks": [{"type": "command", "command": "bash ~/.claude/scripts/update-index.sh"}] }] }'
fi

echo ""
echo "✅ 完成：32 個 agent、9 個 skill、素材庫、team-knowledge、全域 CLAUDE.md 已安裝到 $DEST"
echo "   重開 Claude Code 後，所有專案即可使用這支 AI 敏捷團隊。"
