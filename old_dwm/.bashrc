PS1="\n\[\033[38;5;202m\]\342\224\214($(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[38;5;161m\]\u@\h'; fi)\[\033[38;5;202m\])\$([[ \$? != 0 ]] && echo \"\342\224\200(\[\033[0;31m\]\342\234\227\[\033[38;5;202m\])\")\342\224\200(\[\033[1;34m\]\@ \d\[\033[38;5;202m\])\[\033[38;5;202m\]\n\342\224\224\342\224\200(\[\033[38;5;127m\]\w\[\033[38;5;202m\])\342\224\200(\[\033[38;5;127m\]\$(ls -1 | wc -l | sed 's: ::g') files, \$(ls -lah | grep -m 1 total | sed 's/total //')b\[\033[38;5;202m\])\342\224\200> \[\033[0m\]"