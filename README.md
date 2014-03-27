bash-ec2-host-building
======================

bash automation cluster building for cloudera 

This is a collection all the commands that we need to run to automate the setting up of cloudera cluster. 

We bring the hosts up using AWS CLI and pass the install script as a param. The instlal script will install the required packages, make config changes, format the drive, mount it and then finally restart the host.
