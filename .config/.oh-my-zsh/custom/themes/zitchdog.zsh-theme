# Colors
PURPLE="%F{135}"
MAGENTA="%F{5}"
YELLOW="%F{3}"
RED="%F{1}"
BLUE="%F{4}"
CYAN="%F{6}"
GREEN="%F{2}"
RESET="%f"

# Git info
function parse_git_branch() {
  git rev-parse --is-inside-work-tree &>/dev/null || return

  local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --exact-match 2>/dev/null)
  local git_status=""
  local staged=$(git diff --cached --name-status | wc -l | tr -d ' ')
  local changed=$(git diff --name-status | wc -l | tr -d ' ')
  local untracked=$(git ls-files --others --exclude-standard | wc -l | tr -d ' ')
  local deleted=$(git ls-files --deleted | wc -l | tr -d ' ')
  local added=$(git ls-files --others --exclude-standard | wc -l | tr -d ' ')

  [ "$changed" -gt 0 ] && git_status+="*"
  [ "$untracked" -gt 0 ] && git_status+="%"
  [ "$deleted" -gt 0 ] && git_status+="-"
  [ "$staged" -gt 0 ] && git_status+="+"

  local ahead_behind=""
  if git rev-parse @{u} &>/dev/null; then
    local ahead=$(git rev-list --left-right --count HEAD...@{u} 2>/dev/null | awk '{print $1}')
    local behind=$(git rev-list --left-right --count HEAD...@{u} 2>/dev/null | awk '{print $2}')
    [ "$behind" -gt 0 ] && ahead_behind+=" ↓"
    [ "$ahead" -gt 0 ] && ahead_behind+=" ↑"
  fi

  echo " (${branch}${git_status}${ahead_behind})"
}

# Execution time
function timer_start() {
  timer=${timer:-$SECONDS}
}

function timer_stop() {
  timer_show=$((SECONDS - timer))
  unset timer
}

function format_time() {
  if [[ $timer_show -ge 5 ]]; then
    echo "${YELLOW}{ ${RED}${timer_show}s ${YELLOW}}${RESET}"
  fi
}

# Prompt components
precmd() {
  timer_stop
}

preexec() {
  timer_start
}

PROMPT='${PURPLE}󰫢 ${RESET}'
PROMPT+="${YELLOW}[ ${RED}%~ ${YELLOW}]${RESET}"
PROMPT+='${CYAN}$(parse_git_branch)${RESET}${GREEN} :${RESET} '
RPROMPT='$(format_time)'
