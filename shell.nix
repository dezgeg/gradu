let
  pkgs = import <nixpkgs> {};
in pkgs.stdenv.mkDerivation {
  name = "latex-env";
  buildInputs = with pkgs; [
    graphviz
    imagemagick
    pdftk
    poppler_utils
    python3Packages.pygments
    (texlive.combine {
      inherit (texlive)
        scheme-medium
        enumitem
        framed
        fvextra
        ifplatform
        minted
        tocbibind
        upquote
        xstring
        ;
    })
  ];
}
