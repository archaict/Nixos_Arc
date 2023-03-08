{ pkgs, ... }:

{ # Education & Latex Packages
  environment.systemPackages = with pkgs; [
    zotero

    # texlive.combined.schme-full
    (texlive.combine {
      inherit (texlive)
        collection-basic collection-bibtexextra collection-binextra
        collection-fontsextra collection-fontsrecommended collection-fontutils
        collection-formatsextra
        # collection-genericextra collection-genericrecommended
        collection-langenglish collection-langeuropean collection-langitalian
        collection-latex collection-latexextra collection-latexrecommended
        collection-luatex collection-metapost collection-pictures
        #  collection-mathextra collection-plainextra collection-science
        collection-pstricks collection-publishers collection-xetex;
    })
  ];
}
