{
  lib,
  rustPlatform,
  pkg-config,
  glib,
}:

rustPlatform.buildRustPackage {
  pname = "is-ctrl-pressed";
  version = "0.1.0";

  src = ./.;

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    glib
  ];

  meta = {
    description = "Utilities to determine if the control is pressed";
    homepage = "https://github.com/culottes/dotfiles";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.culxttes ];
  };
}
