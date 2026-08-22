if [ $# -ne 2 ]; then
    echo "Insufficient args"
    exit 1
fi

image=$1
tag=$2

git checkout -b "feature/flaskapp_$tag"

echo "Image = $image"
echo "Tag   = $tag"

cd K8S || exit 1

ex_image=$(grep 'image:' deploy.yml | awk '{print $2}')

echo "Existing image = $ex_image"

sed -i "s|$ex_image|$image:$tag|g" deploy.yml

cat deploy.yml

git config user.name "$GIT_USERNAME"
git config user.email "jenkins@localhost"

git add deploy.yml
git commit -m "Changed image in deploy.yml file"

git push --set-upstream origin "feature/flaskapp_$tag"
