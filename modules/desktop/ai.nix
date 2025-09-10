{ confiig, pkgs, nix-ai-tools, ... }:
# let
#   pkgs.system = "x86_64-linux";
# in
{
  environment.systemPackages = with inputs.nix-ai-tools.packages.x86_64-linux; [ # ${pkgs.system}
    qwen-code
    gemini-cli
    crush
    claude-code-router
    # ... other tools
  ];
}
