log(){
  if [ -z ${1} ]; then
    dir=$(pwd);
  else
    dir=${1};
  fi
  cd ${dir}
  tmux new -s gtd \; \
    split-window -h \; \
    split-window -v \; \
    select-pane -t 0 \; \
    send-keys 'vi NOTES.txt' C-m \; \
    select-pane -t 1 \; \
    send-keys 'vi TODO.txt' C-m\; \
    select-pane -t 2 \; \
    send-keys 'vi SOMEDAY.txt' C-m\;
}

if [[ ${TERM} =~ xterm.* ]]; then
    exec zsh
fi
