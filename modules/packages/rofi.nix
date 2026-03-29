{ self, inputs, lib, ... }: {
  perSystem = { pkgs, ... }: let
    inherit (self) theme;

    hexDigit = c: let
      digits = { "0"=0;"1"=1;"2"=2;"3"=3;"4"=4;"5"=5;"6"=6;"7"=7;"8"=8;"9"=9;"a"=10;"b"=11;"c"=12;"d"=13;"e"=14;"f"=15; };
    in digits.${lib.toLower c};

    hexByte = s:
      let hi = hexDigit (builtins.substring 0 1 s);
          lo = hexDigit (builtins.substring 1 1 s);
      in hi * 16 + lo;

    hexToRgb = hex: {
      r = hexByte (builtins.substring 0 2 hex);
      g = hexByte (builtins.substring 2 2 hex);
      b = hexByte (builtins.substring 4 2 hex);
    };

    rgba = hex: opacity:
      let c = hexToRgb hex;
      in { _type = "literal"; value = "rgba ( ${toString c.r}, ${toString c.g}, ${toString c.b}, ${toString opacity} % )"; };

    ref = v: { _type = "literal"; value = v; };

  in {
    packages.rofi = (inputs.wrappers.wrapperModules.rofi.apply {
      inherit pkgs;

      settings = {
        modi = "drun,run,window";
        show-icons = false;
        drun-display-format = "{name}";
      };

      theme = {
        "*" = {
          red                         = rgba theme.base08 100;
          blue                        = rgba theme.base0D 100;
          lightfg                     = rgba theme.base06 100;
          lightbg                     = rgba theme.base01 100;
          foreground                  = rgba theme.base05 100;
          background                  = rgba theme.base00 100;
          background-color            = rgba theme.base00 0;
          separatorcolor              = ref "@foreground";
          border-color                = ref "@foreground";
          selected-normal-foreground  = ref "@lightbg";
          selected-normal-background  = ref "@lightfg";
          selected-active-foreground  = ref "@background";
          selected-active-background  = ref "@blue";
          selected-urgent-foreground  = ref "@background";
          selected-urgent-background  = ref "@red";
          normal-foreground           = ref "@foreground";
          normal-background           = ref "@background";
          active-foreground           = ref "@blue";
          active-background           = ref "@background";
          urgent-foreground           = ref "@red";
          urgent-background           = ref "@background";
          alternate-normal-foreground = ref "@foreground";
          alternate-normal-background = ref "@lightbg";
          alternate-active-foreground = ref "@blue";
          alternate-active-background = ref "@lightbg";
          alternate-urgent-foreground = ref "@red";
          alternate-urgent-background = ref "@lightbg";
          spacing                     = 2;
        };
        window = {
          background-color = ref "@background";
          border           = 1;
          padding          = 5;
        };
        mainbox = {
          border  = 0;
          padding = 0;
        };
        message = {
          border       = ref "1px dash 0px 0px";
          border-color = ref "@separatorcolor";
          padding      = ref "1px";
        };
        textbox = {
          text-color = ref "@foreground";
        };
        listview = {
          fixed-height = 0;
          border       = ref "2px dash 0px 0px";
          border-color = ref "@separatorcolor";
          spacing      = ref "2px";
          scrollbar    = true;
          padding      = ref "2px 0px 0px";
        };
        "element-text, element-icon" = {
          background-color = ref "inherit";
          text-color       = ref "inherit";
        };
        element = {
          border  = 0;
          padding = ref "1px";
        };
        "element normal.normal"     = { background-color = ref "@normal-background";           text-color = ref "@normal-foreground"; };
        "element normal.urgent"     = { background-color = ref "@urgent-background";           text-color = ref "@urgent-foreground"; };
        "element normal.active"     = { background-color = ref "@active-background";           text-color = ref "@active-foreground"; };
        "element selected.normal"   = { background-color = ref "@selected-normal-background";  text-color = ref "@selected-normal-foreground"; };
        "element selected.urgent"   = { background-color = ref "@selected-urgent-background";  text-color = ref "@selected-urgent-foreground"; };
        "element selected.active"   = { background-color = ref "@selected-active-background";  text-color = ref "@selected-active-foreground"; };
        "element alternate.normal"  = { background-color = ref "@alternate-normal-background"; text-color = ref "@alternate-normal-foreground"; };
        "element alternate.urgent"  = { background-color = ref "@alternate-urgent-background"; text-color = ref "@alternate-urgent-foreground"; };
        "element alternate.active"  = { background-color = ref "@alternate-active-background"; text-color = ref "@alternate-active-foreground"; };
        scrollbar = {
          width        = ref "4px";
          border       = 0;
          handle-color = ref "@normal-foreground";
          handle-width = ref "8px";
          padding      = 0;
        };
        sidebar = {
          border       = ref "2px dash 0px 0px";
          border-color = ref "@separatorcolor";
        };
        button = {
          spacing    = 0;
          text-color = ref "@normal-foreground";
        };
        "button selected" = {
          background-color = ref "@selected-normal-background";
          text-color       = ref "@selected-normal-foreground";
        };
        inputbar = {
          spacing    = ref "0px";
          text-color = ref "@normal-foreground";
          padding    = ref "1px";
          children   = [ "prompt" "textbox-prompt-colon" "entry" "case-indicator" ];
        };
        "case-indicator"       = { spacing = 0; text-color = ref "@normal-foreground"; };
        entry                  = { spacing = 0; text-color = ref "@normal-foreground"; };
        prompt                 = { spacing = 0; text-color = ref "@normal-foreground"; };
        "textbox-prompt-colon" = {
          expand     = false;
          str        = ":";
          margin     = ref "0px 0.3000em 0.0000em 0.0000em";
          text-color = ref "inherit";
        };
      };
    }).wrapper;
  };
}
