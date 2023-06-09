#!/bin/bash

input_file="MOCK_DATA.csv"
output_file="cleaned_data.csv"

# Funktion zur Entfernung ungültiger Zeichen aus dem Text
sanitize_text() {
    text="$1"
    sanitized_text=$(echo "$text" | tr -d '()[]{}<>"'\''~`!@#$%^&*_=+/|\:;?.,')
    echo "$sanitized_text"
}

# Bereinige die CSV-Datei
while IFS=',' read -r firstname lastname
do
    # Bereinige Vor- und Nachnamen von Sonderzeichen
    clean_firstname=$(sanitize_text "$firstname")
    clean_lastname=$(sanitize_text "$lastname")

    # Schreibe bereinigte Daten in die Ausgabedatei
    echo "$clean_firstname,$clean_lastname" >> "$output_file"

done < "$input_file"

