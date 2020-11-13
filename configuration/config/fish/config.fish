
if status is-interactive
and not set -q TMUX
    exec tmux
end

bind -M insert \r accept-autosuggestion execute

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
