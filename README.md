# utilityscripts

This repository contains all the scripts which are used for automation of important tasks, usage are as below

1. run2.sh - Used to bulk deploy of local maven repository to nexus repository. 
Equivalent to - mvn deploy:deploy-file -DpomFile=/home/borokali/Documents/repository/classworlds/classworlds/1.1-alpha-2/classworlds-1.1-alpha-2.pom -Dfile=/home/borokali/Documents/repository/classworlds/classworlds/1.1-alpha-2/classworlds-1.1-alpha-2.jar -DrepositoryId=nexusLocalM2 -Durl=http://localhost:8081/repository/localM2

            Usage: bash run2.sh <repo location> <repo id as setup in maven settings.xml> <target nexus repository url>
            bash run2.sh /home/borokali/Documents/repository/ nexusLocalM2 http://localhost:8081/repository/localM2/
