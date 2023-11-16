{ pkgs }: pkgs.vimUtils.buildVimPlugin {
  pname = "givre-nvim";
  version = "0.1.0";
  src = ./.;
  installPhase = ''
    mkdir -p $out
    cd -r ./* $out/
  '';
}
