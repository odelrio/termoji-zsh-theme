# termoji zsh theme - Based on HYPERZSH theme by Tyler Reckart.

# MIT License

# Copyright (c) 2018 Oriol del Rio

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Prompt
NEWLINE=$'\n'
PROMPT='$(_python_venv)%{$fg[blue]%}%~ $(git_prompt_info)%{$reset_color%}$(git_prompt_short_sha)$(_git_time_since_commit)$(git_prompt_status)${NEWLINE}${_return_status}🚀 '

local _return_status="%{$fg[red]%}%(?..😧 )%{$reset_color%}"

# Determine if there is an active Python virtual environment
function _python_venv() {
  if [[ $VIRTUAL_ENV != "" ]]; then
    echo "%{$fg[blue]%}(${VIRTUAL_ENV##*/})%{$reset_color%} "
  fi
}

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}🌳 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" 🚧 "
ZSH_THEME_GIT_PROMPT_UNTRACKED="💫"
ZSH_THEME_GIT_PROMPT_CLEAN=" "
ZSH_THEME_GIT_PROMPT_ADDED="📦"
ZSH_THEME_GIT_PROMPT_MODIFIED="✏️"
ZSH_THEME_GIT_PROMPT_DELETED="❌"
ZSH_THEME_GIT_PROMPT_RENAMED="renamed"
ZSH_THEME_GIT_PROMPT_UNMERGED="unmerged"
ZSH_THEME_GIT_PROMPT_AHEAD="ahead"

ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[white]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[white]%}"

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function _git_time_since_commit() {
# Only proceed if there is actually a commit.
  if git log -1 > /dev/null 2>&1; then
    # Get the last commit.
    last_commit=$(git log --pretty=format:'%at' -1 2> /dev/null)
    now=$(date +%s)
    seconds_since_last_commit=$((now-last_commit))

    # Totals
    minutes=$((seconds_since_last_commit / 60))
    hours=$((seconds_since_last_commit/3600))

    # Sub-hours and sub-minutes
    days=$((seconds_since_last_commit / 86400))
    sub_hours=$((hours % 24))
    sub_minutes=$((minutes % 60))

    if [ $hours -gt 24 ]; then
      commit_age="${days}d "
    elif [ $minutes -gt 60 ]; then
      commit_age="${sub_hours}h${sub_minutes}m "
    else
      commit_age="${minutes}m "
    fi
    if [[ -n $(git status -s 2> /dev/null) ]]; then
        if [ "$days" -gt 7 ]; then
            COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG"
        elif [ "$days" -gt 4 ]; then
            COLOR="$ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM"
        else
            COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT"
        fi
    else
        COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
    fi

    echo "⏰ $COLOR$commit_age%{$reset_color%}"
  fi
}
