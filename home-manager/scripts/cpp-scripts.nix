{ stdenv }:
stdenv.mkDerivation {
  pname = "User cpp scripts";
  version = "1.0.0";
  src = ./.;

  installPhase = ''
    mkdir -p $out/bin;

    g++ -O3 $src/system-age.cc -o $out/bin/system-age
    g++ -O3 $src/uptime-fmt.cc -o $out/bin/uptime-fmt
  '';
}
