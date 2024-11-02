{ stdenv
, lib
, fetchFromGitHub
}:

stdenv.mkDerivation {
  pname = "rime-icea";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "aysixi";
    repo = "rime-icea";
    rev = "e3f0f0e814f85656c3fb6c9075d64a47de068fe7";
    sha256 = "sha256-ZZhFHoymX5I9X6FnXVaWGRKp0BYnRq9Hom0vMtIcYGE=";
  };

  # buildPhase = ''
  #   mv default.yaml rime_ice_suggestion.yaml
  # '';

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
