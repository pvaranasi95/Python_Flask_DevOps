image=$1
tag=$2

git checkout -b "feature/flaskapp_$tag"

if [ $# -ne 2 ]; then
   echo "Insufficient args"
   exit
fi

echo "Image= " $image
echo "Tag  = " $tag
cd K8S
ex_image=$(grep image: deploy.yml | awk '{print $2}')
echo $ex_image
sed -i "s|$ex_image|$image:$tag|g" deploy.yml
cat deploy.yml
git config --global user.email "pavanvaranasi95@gmail.com"
git config --global user.name "pvaranasi95"
git add .
git commit -m "Changed image in deploy.yml file"
git push --set-upstream origin feature/flaskapp_$tag
