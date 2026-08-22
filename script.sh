image=$1
tag=$2

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
