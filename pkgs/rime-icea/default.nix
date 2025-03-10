{
  stdenv,
  lib,
  fetchFromGitHub,
}:

stdenv.mkDerivation {
  pname = "rime-icea";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "aysixi";
    repo = "rime-icea";
    rev = "main";
    sha256 = "sha256-U4xhWtFcejyV3VT54ZklYPBlwJN0B1J41udnSVFDJEE=";
  };

  installPhase = ''
    mkdir -p $out/share/rime-data
    cp -r * $out/share/rime-data/
  '';

  meta = with lib; {
    maintainers = with lib.maintainers; [ xddxdd ];
    description = "Rime 配置：雾凇拼音 | 长期维护的简体词库";
    homepage = "https://github.com/iDvel/rime-ice";
    license = licenses.gpl3;
  };
}
