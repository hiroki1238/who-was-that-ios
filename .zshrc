export PATH=/opt/homebrew/bin:$PATH
. /opt/homebrew/opt/asdf/libexec/asdf.sh
# ↑ asdf経由でインストールした物(goなど)はこのパスがないと認識されない
export PATH=/Users/taba/.asdf/installs/golang/1.18.1/packages/bin:$PATH

# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# https://kojinjigyou.org/10719/
# プロンプトカスタマイズ
PROMPT='%B%F{white}%n: %F{green}%1~%f %F{cyan}$vcs_info_msg_0_%f %F{white}%#%f '

# gitエイリアス
alias g='git'
alias gst='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gpl='git pull'
alias gup='git pull --rebase'
alias gps='git push'
alias gpom='git push origin main'
alias gpo='git push origin'
alias gd='git diff'
alias gb='git branch'
alias gb-d='git branch -d'
alias gb-D='git branch -D'
alias gc='git checkout'
alias gc-b='git checkout -b'
alias gc-m='git commit -m'
alias ga.='git add .'

# dockerエイリアス
alias d='docker'
alias dcd='docker-compose down'
alias dcu='docker-compose up app'
alias dcub='docker-compose up app --build'
alias dps='docker ps'

# 別のアプリを起動
alias chrome="open -a 'Google Chrome'"

# コマンドの候補を表示
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ブランチ切り替え（git checkout lbで実行）
alias -g lb='`git branch | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'

# Starshipを有効にする
eval "$(starship init zsh)"

# Starshipの設定 (git_branchの色をgit_statusに合わせる)
#function git_branch_color {
#  # gitの状態を取得
#  local git_status="$(git status --porcelain 2> /dev/null)"
#
#  # gitの状態に応じて色を設定
#  if [[ -n $(echo "$git_status" | grep '^??') ]]; then
#    # 未追跡のファイルがある場合
#    echo "#ffd500"  # tamago-yellow
#  elif [[ -n $(echo "$git_status" | grep '^ M') ]]; then
#    # 変更がステージされていない場合
#    echo "#ffff00"  # yellow
#  elif [[ -n $(echo "$git_status" | grep '^M') ]]; then
#    # 変更がステージされている場合
#    echo "#ff4dff"  # purple
#  else
#    # gitの状態がクリーンな場合
#    echo "#0000FF"  # blue
#  fi
#}

# 猫を表示
alias neko='echo "🐈 🐈 🐈 🐈 🐈 🐈 🐈 🐈 🐈 🐈 🐈 🐈 🐈 🐈 🐈 🐈 "'


# iTermのタブの色を変更
tab-color() {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}

tab-reset() {
    echo -ne "\033]6;1;bg;*;default\a"
}

alias tab-r='tab-color 153 0 0' #red
alias tab-g='tab-color 0 102 102' #green
alias tab-b='tab-color 13 50 128' #blue
alias tab-y='tab-color 204 197 65' #yellow
alias tab-p='tab-color 102 50 153' #purple
alias tab-c='tab-color 52 160 163' #cyan
alias tab-a='tab-color 102 32 43' #admin
alias tab-s='tab-color 40 80 130' #server

alias staging-auth='gcloud auth application-default login' # stagingDBにログイン
alias staging-start='cloud-sql-proxy --auto-iam-authn wed-staging:asia-northeast1:boba-db-master' # stagingDBに接続

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/taba/Develop/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/taba/Develop/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/taba/Develop/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/taba/Develop/google-cloud-sdk/completion.zsh.inc'; fi

alias boba_staging='cloud-sql-proxy --auto-iam-authn wed-staging:asia-northeast1:boba-db-master'

