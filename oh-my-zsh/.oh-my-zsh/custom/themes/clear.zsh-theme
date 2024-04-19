if [ $UID -eq 0 ]; then CLI_MARKER="#"; else CLI_MARKER="\$"; fi

cleartheme_double_colon() {
    echo $'\u2237'
}

cleartheme_in_text() {
    echo "%{$FG[009]%}$(cleartheme_double_colon)%{$reset_color%}"
}

cleartheme_user() {
    echo "%{$FG[010]%}%n%{$reset_color%}"
}

cleartheme_directory() {
    echo "%{$FG[011]%}%3~%{$reset_color%}"
}

ZSH_THEME_GIT_PROMPT_PREFIX="\u3014"
ZSH_THEME_GIT_PROMPT_SUFFIX="\u3015"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

vcs_prompt_info() {
  # https://github.com/ohmyzsh/ohmyzsh/issues/12328
  _omz_git_prompt_info
}

cleartheme_git() {
    echo "%{$FG[012]%}$(vcs_prompt_info)%{$reset_color%}"
}   

PROMPT='$(cleartheme_user) $(cleartheme_in_text) $(cleartheme_directory) $(cleartheme_git)$CLI_MARKER '

infinity() {
    echo "\u221E"
}

RPROMPT='%D{%T} $(infinity)'

