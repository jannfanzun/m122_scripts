template_directory="01_Templates"
classes_directory="02_Classes"



# Generate template files
mkdir "$template_directory"
cd "$template_directory"



touch "Datei-1.txt"
touch "Datei-2.docx"
touch "Datei-3.pdf"



cd ../



# Generate class lists
mkdir "$classes_directory"
cd "$classes_directory"



# Generate AP22d
class_ap22d_file="AP22d.txt"
echo "Liam" >>  "$class_ap22d_file"
echo "Ava" >>  "$class_ap22d_file"
echo "Noah" >>  "$class_ap22d_file"
echo "Olivia" >>  "$class_ap22d_file"
echo "Ethan" >>  "$class_ap22d_file"
echo "Emma" >>  "$class_ap22d_file"
echo "Mia" >>  "$class_ap22d_file"
echo "Samuel" >>  "$class_ap22d_file"
echo "Henry" >>  "$class_ap22d_file"



# Generate AP22c
class_ap22c_file="AP22c.txt"
echo "Daniel" >>  "$class_ap22c_file"
echo "Emily" >>  "$class_ap22c_file"
echo "Peter" >>  "$class_ap22c_file"
echo "Benjamin" >>  "$class_ap22c_file"
echo "James" >>  "$class_ap22c_file"
echo "Henry" >>  "$class_ap22c_file"
echo "Amelia" >>  "$class_ap22c_file"
echo "Samuel" >>  "$class_ap22c_file"
echo "Sophia" >>  "$class_ap22c_file"


echo "files erfolgreich erstellt"
