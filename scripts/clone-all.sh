projects=$(cat all-projects.txt)
for name in $projects 
do
   ./clone.sh $name
done




