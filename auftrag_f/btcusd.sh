#!/bin/bash

# API-URLs für den Preis von 10 Kryptowährungen in USD
bitcoin_api_url="https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd"
ethereum_api_url="https://api.coingecko.com/api/v3/simple/price?ids=ethereum&vs_currencies=usd"
ripple_api_url="https://api.coingecko.com/api/v3/simple/price?ids=ripple&vs_currencies=usd"
litecoin_api_url="https://api.coingecko.com/api/v3/simple/price?ids=litecoin&vs_currencies=usd"
bitcoin_cash_api_url="https://api.coingecko.com/api/v3/simple/price?ids=bitcoin-cash&vs_currencies=usd"

# Zeit
timestamp=$(date +"%Y-%m-%d %H:%M:%S")

# Bitcoin-Preis abrufen
bitcoin_response=$(curl -s "$bitcoin_api_url")
bitcoin_price=$(echo "$bitcoin_response" | jq -r '.bitcoin.usd')

# Ethereum-Preis abrufen
ethereum_response=$(curl -s "$ethereum_api_url")
ethereum_price=$(echo "$ethereum_response" | jq -r '.ethereum.usd')

# Ripple-Preis abrufen
ripple_response=$(curl -s "$ripple_api_url")
ripple_price=$(echo "$ripple_response" | jq -r '.ripple.usd')

# Litecoin-Preis abrufen
litecoin_response=$(curl -s "$litecoin_api_url")
litecoin_price=$(echo "$litecoin_response" | jq -r '.litecoin.usd')

# Bitcoin Cash-Preis abrufen
bitcoin_cash_response=$(curl -s "$bitcoin_cash_api_url")
bitcoin_cash_price=$(echo "$bitcoin_cash_response" | jq -r '.["bitcoin-cash"].usd')

# HTML-Quellcode generieren
html_content="<html>
<head>
    <title>Cryptocurrency Prices</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
		text-align: center;
        }

        h1 {
            color: #333333;
	text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 8px;
            text-align: center;
            border-bottom: 1px solid #dddddd;
        }

        .price {
            font-weight: bold;
            color: #009900;
        }
	.time {
	font-weigt: bold;
	font-style: italic;
	text-align: center;
	}
    </style>
</head>
<body>
    <h1>Cryptocurrency Prices</h1>
	<p class="time">$timestamp</p>
    <table>
        <tr>
            <th>Cryptocurrency</th>
            <th>Current Price (USD)</th>
        </tr>
        <tr>
            <td>Bitcoin</td>
            <td class="price">$bitcoin_price</td>
        </tr>
        <tr>
            <td>Ethereum</td>
            <td class="price">$ethereum_price</td>
        </tr>
        <tr>
            <td>Ripple</td>
            <td class="price">$ripple_price</td>
        </tr>
        <tr>
            <td>Litecoin</td>
            <td class="price">$litecoin_price</td>
        </tr>
        <tr>
            <td>Bitcoin Cash</td>
            <td class="price">$bitcoin_cash_price</td>
        </tr>
    </table>
</body>
</html>
"

# HTML-Quellcode in eine Datei schreiben
echo "$html_content" > /home/jannfanzun/repo_m122/m122_scripts/auftrag_f/cryptocurrency_prices.html
