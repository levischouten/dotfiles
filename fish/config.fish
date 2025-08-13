set -g fish_greeting

fish_add_path /opt/homebrew/bin
fish_add_path (go env GOPATH)/bin
fish_add_path ~/bin

# Editor
set -Ux EDITOR nvim
alias vi="nvim"

# pnpm
set -Ux PNPM_HOME "$HOME/Library/pnpm"
fish_add_path $PNPM_HOME

# output from: fnm env --use-on-cd
set -gx PATH "/Users/lschouten/.local/state/fnm_multishells/80240_1754761133813/bin" $PATH;
set -gx FNM_MULTISHELL_PATH "/Users/lschouten/.local/state/fnm_multishells/80240_1754761133813";
set -gx FNM_VERSION_FILE_STRATEGY "local";
set -gx FNM_DIR "/Users/lschouten/.local/share/fnm";
set -gx FNM_LOGLEVEL "info";
set -gx FNM_NODE_DIST_MIRROR "https://nodejs.org/dist";
set -gx FNM_COREPACK_ENABLED "false";
set -gx FNM_RESOLVE_ENGINES "true";
set -gx FNM_ARCH "arm64";
function _fnm_autoload_hook --on-variable PWD --description 'Change Node version on directory change'
    status --is-command-substitution; and return
    if test -f .node-version -o -f .nvmrc -o -f package.json
    fnm use --silent-if-unchanged
end

end

_fnm_autoload_hook

set -gx FZF_DEFAULT_OPTS '
    --color=bg:-1,fg:-1,bg+:8,fg+:-1,hl:4,hl+:4,border:7,prompt:7,info:7,spinner:7,marker:7,pointer:7
    --border=rounded
    --no-bold
    --pointer=" "
'

function gitui
  if defaults read -g AppleInterfaceStyle >/dev/null 2>&1
    command gitui -t ~/.config/gitui/themes/github-dark.ron $argv
  else
    command gitui -t ~/.config/gitui/themes/github-light.ron $argv
  end
end
