#!/bin/sh

if [ "$#" -ne 3 ] || ! [ -d "$1" ]; then
    echo "Usage:"
    echo "       bash run.sh <repoRootFolder> <repositoryId> <repositoryUrl>"
    echo ""
    echo ""
    echo "       Where..."
    echo "       repoRootFolder: The folder containing the repository tree."
    echo "                       Ensure you move the repository outside of ~/.m2 folder"
    echo "                       or whatever is configured in settings.xml"
    echo "       repositoryId:   The repositoryId from the <server> configured for the repositoryUrl in settings.xml."
    echo "                       Ensure that you have configured username and password in settings.xml."
    echo "       repositoryUrl:  The URL of the repository where you want to upload the files."
    exit 1
fi

while read -r line ; do
    echo "Processing file $line"
    pomLocation=${line}
    pomLocation=${pomLocation/jar/pom}
    jarLocation=${line}
    jarLocation=${jarLocation/pom/jar}
    echo $pomLocation
    echo $jarLocation
   /home/borokali/Downloads/apache-maven-3.6.3/bin/mvn deploy:deploy-file -DpomFile=$pomLocation -Dfile=$jarLocation -DrepositoryId=$2 -Durl=$3
done < <(find $1 -name "*.jar")
