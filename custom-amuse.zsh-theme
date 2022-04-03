# vim:ft=zsh ts=2 sw=2 sts=2

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[183]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[124]%} ●"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[003]%} ?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

GREY="%{$FG[236]%}"
CYAN="%{$FG[110]%}"
YELLOW="%{$FG[220]%}"
RED="%{$FG[009]%}"

BOLD="\u001b[1m"
NC="%{$reset_color%}"

kube_context() {
  CTX=$(kubectx -c 2> /dev/null)

  if [[ $CTX == "" ]]; then
  else
    echo $(wrap "${CYAN}${CTX}")
  fi
}

prev_exit() {
  CODE="$?"

  if [[ $CODE == "0" ]]; then
    echo "${GREY}===${NC}"
  else
    echo "${RED}=!=${NC}"
  fi
}

wrap() {
  if [[ $1 != "" ]]; then
    echo "${GREY}[${NC}${1}${NC}${GREY}]${NC} "
  fi
}

get_prompt() {
  echo "${BOLD}${GREY}$(prev_exit)${NC}$(wrap "${YELLOW}%2~")$(wrap "$(git_prompt_info)")"
}

PROMPT='
$(get_prompt)
✏️%{$reset_color%}  '

RPROMPT='$(kube_context)'
