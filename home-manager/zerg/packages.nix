{ config, pkgs, pkgs-unstable, nix-ai-tools, ... }:

{
  programs.vesktop.enable = true;

  # Минимальные пакеты для тестирования
  home.packages = with pkgs; [

    # Базовые утилиты
    neovim wget curl git btop microfetch tmux

    # Редакторы кода
    vscode-fhs

    # Терминал
    wezterm

    # Браузер


    # Git утилиты

    jujutsu
    lazyjj

    # AI инструменты
    # из nix-ai-tools ${pkgs.system} = x86_64-linux
    nix-ai-tools.packages.x86_64-linux.opencode
    nix-ai-tools.packages.x86_64-linux.qwen-code
    nix-ai-tools.packages.x86_64-linux.gemini-cli
    nix-ai-tools.packages.x86_64-linux.claude-code-router
    nix-ai-tools.packages.x86_64-linux.crush

   # git
   # vim
  ] ++ [
    # Пакеты из unstable
   # unstable.zed-editor-fhs  # используем unstable вместо pkgs

  ];

  # home.packages = with inputs.nix-ai-tools.packages.x86_64-linux; [ # ${pkgs.system} # AI tools
  #   qwen-code
  #   gemini-cli
  #   crush
  #   claude-code-router
  #   # ... other tools
  # ];
  # Настройки shell

  programs = {
    bash.enable = true;
    zsh.enable = true;
    fish.enable = true;

    # Добавить другие программы по необходимости
  };
}
