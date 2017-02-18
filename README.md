
This repo contains an example ansible script to bring up a 
spark, hdfs, and yarn cluster in ec2.  The AWS configuration settings
are set in config.yml.  The ansible playbook is in ispark.yml.  At
least two instances are needed.

Jupyter is also installed, so remote access to pyspark
as well as sparkR through Jupyter notebooks is possible.

To run the playbook, run:

     $ ansible-playbook ispark.yml

I installed the python3 version of ansible on my host computer using:

     $ sudo apt-get install python3-setuptools
     $ sudo easy_install3 pip 
     $ sudo pip install ansible

I. On the computer running the playbook, three files will
be generated when done: 

1. master.sh: This script connects to the master instance using ssh.

2. proxy.sh: This script creates a ssh tunnel into tinyproxy which is running on the master.  The script will then open chrome to the spark and hadoop UI webapps running on the cluster.

3. ispark.sh: This script tunnels to the jupyter server running on the master using ssh.  It then opens chrome to the jupyter notebook. (Jupyter websockets do not work through http proxies.)

II. On the master server additional files are created:

1. const.txt: The constitution of the United States.

2. hive.sh: A simple hive example using const.txt.

3. mapreduce: A simple map-reduce example using const.txt.

4. pyspark.sh: A script which executes pyspark in standalone mode with the address of the cluster as master.

5. sparkR.sh: A script which executes sparkR in standalone mode with the address of the cluster as master.

6. wc.py: A simple python word count example for spark.

7. wc.sh: A script which executes wc.py using const.txt.  wc.y is run three times, first in standalone mode, second in yarn client mode, and last in yarn cluster mode.

8. ispark.sh: A script which run the jupyter notebook server.  Both the python3 and R notebooks should be available off the "new" button.  Run ispark.sh on the host to access the server.

9. *.ipynb: Example notebooks for python and R.

