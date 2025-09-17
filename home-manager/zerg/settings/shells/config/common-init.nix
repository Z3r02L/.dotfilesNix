# common-init.nix
{ }:

''
# Пользовательские настройки Zsh и Bash (общие)
export EDITOR="nvim"
export GOOGLE_CLOUD_PROJECT="88268831803"

export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME/bin:$PATH"


case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

eval "$(starship init zsh)"
''
