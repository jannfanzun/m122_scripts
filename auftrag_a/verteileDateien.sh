template_directory="01_Templates"
classes_directory="02_Classes"



if [ ! -d "$classes_directory" ]; then
  echo "Direcotry '$classes_directory' does not exist."
  exit 1
fi



for file in "$classes_directory"/*.txt; do
  class=$(basename "$file" .txt)
  echo "Generating directories for class '$class'"
  mkdir "$class"

  while IFS= read -r student; do
     echo "Generting template for  $student"
     mkdir "$class/$student"
     cp "$template_directory"/* "$class/$student"

  done < "$file"
done
