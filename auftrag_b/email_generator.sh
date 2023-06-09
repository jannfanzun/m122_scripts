#!/bin/bash

# Generiere E-Mail-Adressen und Passwörter
while IFS=',' read -r firstname lastname
do
    # Bereinige Vor- und Nachnamen von Sonderzeichen
    clean_firstname=$(echo "$firstname" | tr -dc '[:alnum:]')
    clean_lastname=$(echo "$lastname" | tr -dc '[:alnum:]')
    
    # Generiere E-Mail-Adresse und Passwort
    email="${clean_firstname,,}.${clean_lastname,,}@edu.tbz.ch"
    password=$(openssl rand -base64 12)
    
    # Schreibe E-Mail-Adresse und Passwort in die Ausgabedatei
    echo "$email;$password" >> YYYY-MM-DD_HH-SS_mailimports.csv

done < cleaned_data.csv

