{
  nix.settings = {
    trusted-users = [
      "@wheel"
    ];
    substituters = [
      "https://hyprland.cachix.org"
      "https://focal.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "focal.cachix.org-1:/YkOWkXNH2uK7TnskrVMvda8LyCe4iIbMM1sZN2AOXY="
    ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    download-buffer-size = 1073741824;
  };
}
