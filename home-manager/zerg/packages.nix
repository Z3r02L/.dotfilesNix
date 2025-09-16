{ config, pkgs, unstable, nix-ai-tools, ... }:
let
  aiTools = nix-ai-tools.packages.${pkgs.system};
  # unstable = pkgs.unstable;
in
{
  # programs.vesktop.enable = true;

  home.packages = with pkgs; [
    # Base Utils
    unstable.neovim wget curl git btop tmux yazi unzip
    microfetch fastfetch
    starship

    # Code editor
    unstable.neovim
    # unstable.sublime4
    unstable.zed-editor-fhs
    unstable.vscode-fhs
    unstable.kiro-fhs

    # Massenger
    telegram-desktop vesktop

    # Terminal
    alacritty wezterm

    # Browser
    librewolf brave
    ungoogled-chromium

    # Video
    unstable.audacity
    vlc
    mpv
    unstable.kdePackages.kdenlive

    # Git утилиты
    git lazygit
    jujutsu lazyjj

    # AI инструменты
    aiTools.opencode
    aiTools.qwen-code
    aiTools.gemini-cli
    aiTools.claude-code
    aiTools.claude-code-router
    aiTools.crush
  ];

  # Настройки shell
  programs = {
    bash.enable = true;
    zsh.enable = true;
    fish.enable = true;
    # xdg.enable = true;

    # Добавить другие программы по необходимости
  };
}
