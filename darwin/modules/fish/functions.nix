{
  lk = "set loc (walk $argv); and cd $loc;";

  mol = ''
    set -l smiles $(curl -s "https://cactus.nci.nih.gov/chemical/structure/$argv/smiles")
    if [ "$smiles" = "<h1>Page not found (404)</h1>" ]
        then
        echo "Nicht gefunden!"
    else
        obabel -:"$smiles" -O ./strukturen/$argv.svg
        echo "[[./strukturen/$argv.svg]]" | pbcopy
    end
  '';

  money = ''
    set -l btc_amount 0.01461647
    set -l eth_amount 0.051626052277
    set -l xmr_amount 2.020201341553

    set -l prices $(curl -s -H "X-CMC_PRO_API_KEY: e3346ea7-e24e-473e-bc48-9974da219852" -H "Accept: application/json" -d "symbol=BTC,ETH,XMR&convert=EUR" -G https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest | jq "map(.. | .price? | select(. != null))")

    set -l btc_price $(echo $prices | jq .[0])
    set -l eth_price $(echo $prices | jq .[1])
    set -l xmr_price $(echo $prices | jq .[2])

    set -l btc $(math "$btc_amount * $btc_price")
    set -l eth $(math "$eth_amount * $eth_price")
    set -l xmr $(math "$xmr_amount * $xmr_price")

    set -l total $(math "$btc + $eth + $xmr")

    echo "| BTC | $btc € |"
    echo "| ETH | $eth € |"
    echo "| XMR | $xmr € |"
    echo "|-----|--------------|"
    echo "| SUM | $total € |"
  '';
}
