### If you need find spesific jobs and export their names to the list below script will help implement this. 

# First you should export all your job names to the txt file.

# Go to Script Console under Manage Jenkins, 
# this script will print the name of all jobs including jobs inside of a folder and the folders themselves:

Jenkins.instance.getAllItems(AbstractItem.class).each {
  	println(it.fullName)
  };
  
#!/bin/bash
# Name of the jobs
name=$(cat /home/dodbeg/name.txt)

# Export job conf as a xml per job.
for i in $name
do
    java -jar /home/dodbeg/jenkins-cli.jar -s http://localhost:8080/ -auth admin:admin get-job $i > ./jobs/$i
done

# Grep matrix per xml file and find jobs which configured with this feature
#

grep -nr 'AuthorizationMatrixProperty' ./jobs/ | awk -F '\\:' '{print $1":"}' | sort -u | cut -d '/' -f3 > prjbs.txt
