{ pkgs, ... }:

with pkgs;

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = [
    stdenv.cc
    git
    python3
    gawk
    which
    bzip2
    chrpath
    cpio
    hostname
    file
    diffutils
    diffstat
    lz4
    wget 
    zstd
    rpcsvc-proto 
    patch
    perlPackages.CPAN
  ];
 
  languages.python.enable = true;
  languages.perl.enable = true;

  enterShell = ''
    echo hello 
  '';
}
