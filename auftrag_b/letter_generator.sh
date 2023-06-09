#!/bin/bash

# Generiere Benachrichtigungsbriefe
while IFS=',' read -r firstname lastname
do
    # Bereinige Vor- und Nachnamen von Sonderzeichen
    clean_firstname=$(echo "$firstname" | tr -dc '[:alnum:]')
    clean_lastname=$(echo "$lastname" | tr -dc '[:alnum:]')

    # Erstelle Briefdatei
    filename="YYYY-MM-DD_HH-SS_${clean_firstname,,}.${clean_lastname,,}.brf"

    # Fülle den Brief mit den Informationen
    echo "Technische Berufsschule Zürich" > "$filename"
    echo "Ausstellungsstrasse 70" >> "$filename"
    echo "8005 Zürich" >> "$filename"
    echo "" >> "$filename"
    echo "Zürich, den [DD.MM.YYYY]" >> "$filename"
    echo "" >> "$filename"
    echo "                $clean_firstname $clean_lastname" >> "$filename"
    echo "                [Strasse] [StrNummer]" >> "$filename"
    echo "                [Postleitzahl] [Ort]" >> "$filename"
    echo "" >> "$filename"
    echo "Lieber:r $clean_firstname," >> "$filename"
    echo "" >> "$filename"
    echo "Es freut uns, Sie im neuen Schuljahr begrüssen zu dürfen." >> "$filename"
    echo "" >> "$filename"
    echo "Damit Sie am ersten Tag sich in unsere Systeme einloggen" >> "$filename"
    echo "können, erhalten Sie hier Ihre neue Emailadresse und Ihr" >> "$filename"
    echo "Initialpasswort, das Sie beim ersten Login wechseln müssen." >> "$filename"
    echo "" >> "$filename"
    echo "Emailadresse:   $clean_firstname.$clean_lastname@edu.tbz.ch" >> "$filename"
    echo "Passwort:       [GeneriertesPasswort]" >> "$filename"
    echo "" >> "$filename"
    echo "Mit freundlichen Grüssen" >> "$filename"
    echo "" >> "$filename"
    echo "[IhrVorname] [IhrNachname]" >> "$filename"
    echo "(TBZ-IT-Service)" >> "$filename"
    echo "" >> "$filename"
    echo "admin.it@tbz.ch, Abt. IT: +41 44 446 96 60" >> "$filename"

done < cleaned_data.csv

