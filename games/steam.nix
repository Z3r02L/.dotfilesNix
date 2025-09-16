{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  # hardware.opengl has beed changed to hardware.graphics

  services.xserver.videoDrivers = ["nvidia"];
  # services.xserver.videoDrivers = ["amdgpu"];

  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.open = true;

  # Steam
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    protonup
  ];

  programs.gamemode.enable = true;

  # protonge
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
