# Neovim requires this
export XDG_CONFIG_HOME="$HOME/.config"

# parallel make
set -x NUMCPUS grep -c '^processor' /proc/cpuinfo

function pmake
 set -l numcpu ($NUMCPUS)
 time nice make -j$numcpu --load-average=$numcpu $argv
end

# bind -M insert \r accept-autosuggestion execute

function settitle
    printf "\033k$1\033\\"
end

function snip
  nvim ~/git/scripts/vimwiki/snippets/$argv.wiki
  echo "[[snippets/$argv]]" >> ~/git/scripts/vimwiki/Snippets.wiki
end

function wsnip
  nvim ~/git/scripts/vimwiki/snippets/work/$argv.wiki
  echo "[[snippets/work/$argv]]" >> ~/git/scripts/vimwiki/WorkSnippets.wiki
end

alias gl="git log --pretty=oneline"

function cd
    if count $argv > /dev/null
        builtin cd "$argv"; and ls -a
    else
        builtin cd ~; and ls -a
    end
end

export EDITOR="nvim"
export TERM="screen-256color"

# set PATH so it includes user's private bin if it exists
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true
