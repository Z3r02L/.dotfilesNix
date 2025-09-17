{ pkgs, ... }:
let

in
{
  programs.starship = {
    enable = true;
    # Путь до конфигурационного файла starship.toml (опционально)
    # configFile = ./starship.toml;

    # Пример конфигурации starship в формате Nix
    # Конфигурация передается в виде строки TOML
    # settings = ''
    #   # Настройка prompt
    #   prompt_order = [
    #     "username",
    #     "hostname",
    #     "directory",
    #     "git_branch",
    #     "git_state",
    #     "git_status",
    #     "cmd_duration",
    #     "line_break",
    #     "jobs",
    #     "character"
    #   ]

    #   [username]
    #   style = "yellow"
    #   show_always = false

    #   [hostname]
    #   style = "green"

    #   [directory]
    #   style = "cyan"
    #   truncate_to_repo = false
    #   truncation_length = 3

    #   [git_branch]
    #   symbol = " "
    #   style = "magenta"
    #   format = "[$symbol$branch]($style) "

    #   [git_status]
    #   conflicted = "⚔️ "
    #   ahead = "↑${count} "
    #   behind = "↓${count} "
    #   untracked = "?? "
    #   staged = "+${count} "
    #   deleted = "✘${count} "
    #   modified = "~${count} "
    #   renamed = "➜${count} "

    #   [cmd_duration]
    #   min_time = 2000
    #   format = "took [$duration]($style) "

    #   [character]
    #   symbol = "➜ "
    #   style = "bold green"

    #   [line_break]
    #   disabled = false
    # '';
  };
}
