{
  appimageTools,
  nix-update-script,
  appImageSrc
}:
let
  pname = "HueForge";
  version = "v0.9.1.2-test";
  # src = builtins.path {
  #   path = "/home/quatro/binaries/${pname}_${version}.AppImage";
  #   name = "${pname}_${version}.AppImage";
  # };
  src = appImageSrc;
  appimageContents = appimageTools.extractType2 { inherit pname src version; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraPkgs =
    pkgs:
    let
      qtPkgs = with pkgs; [
        # qt6.qtbase
        # qt6.qtwayland
        # qt6.full
      ];

      systemPkgs = with pkgs; [
        # X11 and Wayland
        xorg.libX11
        xorg.libXcursor
        xorg.libXrandr
        xorg.libXi
        xorg.libXext
        xorg.libXfixes
        wayland

        # Graphics and OpenGL
        mesa
        libGL
        libGLU

        # System libraries
        fontconfig
        freetype
        dbus
        systemd

        # Serial port support
        udev
      ];
    in
    (appimageTools.defaultFhsEnvArgs.multiPkgs pkgs) ++ qtPkgs ++ systemPkgs;

  passthru.updateScript = nix-update-script { };

  extraInstallCommands = ''
    install -Dm644 ${appimageContents}/usr/share/icons/hicolor/256x256/apps/HueForge.png \
      $out/share/icons/hicolor/256x256/apps/HueForge.png

    install -Dm644 ${appimageContents}/HueForge.desktop \
      $out/share/applications/HueForge.desktop

    substituteInPlace $out/share/applications/HueForge.desktop \
      --replace-fail 'Exec=HueForge' 'Exec=QT_QPA_PLATFORM=xcb ${placeholder "out"}/bin/HueForge'
  '';
}
