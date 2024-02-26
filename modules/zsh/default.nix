{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    # defaultKeymap = "viins";
    enableAutosuggestions = true;
    autocd = true;
    dirHashes = {
      docs = "$HOME/Documents";
      vids = "$HOME/Videos";
      dl = "$HOME/Downloads";
    };
    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "main"
        "cursor"
        "brackets"
      ];
      styles = import ./syntax-highlight.nix;
    };
    initExtra = ''
      function lk { cd "$(walk --icons "$@")" }
      function molecule2svg {
        local smiles=$(curl -s https://cactus.nci.nih.gov/chemical/structure/$1/smiles)
        if [[ "$smiles" = "<h1>Page not found (404)</h1>" ]]
        then
          echo "Nicht gefunden!"
        else
          obabel -:"$smiles" -O ./strukturen/$1.svg
          echo "[[./strukturen/$1.svg]]" | pbcopy
        fi
      }
      function money {
        local btc_amount=0.01461647
        local eth_amount=0.05328
        local xmr_amount=2.020201341553

        local prices=$(curl -s -H "X-CMC_PRO_API_KEY: e3346ea7-e24e-473e-bc48-9974da219852" -H "Accept: application/json" -d "symbol=BTC,ETH,XMR&convert=EUR" -G https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest | jq "map(.. | .price? | select(. != null))")

        local btc_price=$(echo $prices | jq ".[0]")
        local eth_price=$(echo $prices | jq ".[1]")
        local xmr_price=$(echo $prices | jq ".[2]")

        local btc=$(($btc_amount * $btc_price))
        local eth=$(($eth_amount * $eth_price))
        local xmr=$(($xmr_amount * $xmr_price))

        local total=$(($btc + $eth + $xmr))

        echo BTC: $btc €
        echo ETH: $eth €
        echo XMR: $xmr €
        echo SUM: $total €
      }
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
    '';
    envExtra = ''
      export LEDGER_FILE="${config.xdg.dataHome}/hledger.journal"
      export CLICOLOR=1
      export LS_COLORS="$(vivid generate catppuccin-macchiato)"
    '';
    history = {
      path = "${config.xdg.stateHome}/zsh/zsh_history";
      extended = true;
    };
  };
}
