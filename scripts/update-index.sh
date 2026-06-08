#!/usr/bin/env bash
# PostToolUse Hook 觸發後，更新 team-knowledge/index.md 的 sessions 目錄

KNOWLEDGE_DIR="$HOME/.claude/team-knowledge"
INDEX_FILE="$KNOWLEDGE_DIR/index.md"
SESSIONS_DIR="$KNOWLEDGE_DIR/sessions"

# 確認目錄存在
[ -d "$SESSIONS_DIR" ] || exit 0

# 重建 sessions 清單（保留 index.md 標頭）
HEADER=$(sed '/^<!-- /q' "$INDEX_FILE" 2>/dev/null | head -n -1)

{
  echo "# Team Knowledge Index"
  echo ""
  echo "跨專案知識庫。由 PostToolUse Hook 自動維護，請勿手動編輯此索引。"
  echo ""
  echo "## Sessions"
  echo ""
  echo "<!-- 以下由 update-index.sh 自動更新 -->"
  echo ""
  # 列出所有 sessions，最新在最上面
  for f in $(ls -t "$SESSIONS_DIR"/*.md 2>/dev/null); do
    filename=$(basename "$f")
    # 從 frontmatter 讀取 project 和 agent
    project=$(grep '^project:' "$f" | head -1 | sed 's/project: //')
    agent=$(grep '^agent:' "$f" | head -1 | sed 's/agent: //')
    status=$(grep '^status:' "$f" | head -1 | sed 's/status: //')
    echo "- [$filename]($filename) — $project / $agent \`$status\`"
  done
} > "$INDEX_FILE"
