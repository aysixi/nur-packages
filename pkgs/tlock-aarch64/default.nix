{ stdenv
, lib
, fetchurl
}:

stdenv.mkDerivation rec {
  pname = "tlock-aarch64";
  version = "0.1";

  src = fetchurl {
    url = "https://github.com/eklairs/tlock/releases/download/v1.0.0/tlock-v1.0.0-linux-arm64.tar.gz";
    sha256 = "sha256-K7d4b3AGouqpn+cHDtqURxh8qzRuE5/40qXHrrOf/t0=";
  };

  unpackPhase = ''
    tar -xvzf ${src}
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp tlock $out/bin
  '';

  meta = with lib; {
    maintainers = with lib.maintainers; [ null ];
    description = "Two-Factor Authentication Tokens Manager in Terminal";
    homepage = "https://github.com/eklairs/tlock";
    license = licenses.mit;
  };
}
