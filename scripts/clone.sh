project=$1
if [ "$project" == "" ]; then
  echo "Project name is empty"
  exit
fi
echo "processing $project"

tmp_path=/home/opx/tmp
cd "$tmp_path"
rm -rf "$project"
git clone https://github.com/open-switch/"$project".git
cd $project
git checkout origin/master
git fetch
rm -rf .git

project_home=/home/opx/projects
cd "$project_home"
rm -rf "$project"

git clone git@github.com:learnopx/"$project".git
cd "$project"

cp -rf /home/opx/tmp/"$project"/* .
git add .
git commit -m "init"

git push

exit


#git remote remove origin
#git remote rm “alias or origin”
git remote set-url origin git@github.com:learnopx/"$project".git
#git remote add origin https://github.com/learnopx/"$project".git
git push origin master


exit

cd "$project_home"
rm -rf "$project"
git clone https://github.com/learnopx/"$project".git
cp -rf $tmp_path/$project/* $project_home/$project/.
git add *
git commit -m "cloned from opx"
git push origin master

