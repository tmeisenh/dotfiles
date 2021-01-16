# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# prompt.zsh setup - sets up git, works with zprezto as well
#********************************************************************

function prompt_tmeisenh_precmd() {
  vcs_info
  print -Pn "\033]0;%n@%m%#  %~  %W :: %T\a"
}

function prompt_tmeisenh_preexec() {
  print -Pn "\033]0;%n@%m%#  <$1>  %W :: %T\a"
}

function prompt_char() {
  if [ $UID -eq 0 ]; then echo "#"; else echo "%%"; fi
}

function prompt_tmeisenh_setup() {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS
  prompt_opts=(cr percent subst)

  # Load required functions.
  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info
  autoload -U promptinit && promptinit
  #autoload -U colors && colors # colors must be loaded

  _tmeisenh_colors=(
    "%B%F{1}" #red
    "%B%F{2}" #green
    "%B%F{7}" #white
    "%B%F{3}" #yellow
    "%B%F{4}" #blue
    "%b%f"    #clear
  )

  # Add hook for calling git-info before each command.
  add-zsh-hook precmd prompt_tmeisenh_precmd
  add-zsh-hook preexec prompt_tmeisenh_preexec
  # Set vcs_info parameters.
  # check-for-changes (disabled by default) can be slow.
  # For actionformats/formats: http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information
  zstyle ':vcs_info:*' enable git svn
  zstyle ':vcs_info:*' check-for-changes true
  zstyle ':vcs_info:*' unstagedstr '!'
  zstyle ':vcs_info:*' stagedstr '+'
  zstyle ':vcs_info:*' actionformats "(%b %u%c (%a)) "
  zstyle ':vcs_info:*' formats "(%b %u%c) "
  zstyle ':vcs_info:*' nvcsformats ""

  # trailing space to separate vcs_info from cwd is in the vcs_info zstyles....
  PROMPT='%(!.${_tmeisenh_colors[1]}.${_tmeisenh_colors[2]}%n@)%m ${_tmeisenh_colors[3]}%@ ${_tmeisenh_colors[4]}${vcs_info_msg_0_}${_tmeisenh_colors[5]}%1d $(prompt_char)${_tmeisenh_colors[6]} '
}

prompt_tmeisenh_setup "$@"
