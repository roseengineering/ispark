
This repo contains an example ansible script to bring up a 
spark, hdfs, and yarn cluster in EC2.  The AWS configuration settings
are set in config.yml.  The ansible playbook is in ispark.yml.  At
least two instances are needed.

Jupyter is also installed, so remote access to pyspark
as well as sparkR through Jupyter notebooks is possible.

To run the playbook, type:

     $ ansible-playbook ispark.yml

I installed the python3 version of ansible on my local host computer using:

     $ sudo apt-get install python3-setuptools
     $ sudo easy_install3 pip 
     $ sudo pip install ansible

Extra programs: The python program kill\_all.py terminates all 
running instances in EC2.  The file yarn-utils.py is program from apache for
calculating hadoop memory settings.  I used its output to set the values in 
config.yml.

I. On the local host running the playbook, four files will
be generated when done: 

1. master.sh: Connects to the master instance using ssh.

2. proxy.sh: Tunnels into the tinyproxy server on the master node using ssh.  It then opens chrome to the spark and hadoop UI webapps running on the cluster.

3. notebook.sh: Tunnels into the Jupyter server on the master node using ssh.  It then opens chrome to the Jupyter notebook. (Jupyter websockets do not work through http proxies.)

4. push.sh: Pushes your local repo up to the master node.

II. On the master server additional files are created:

1. const.txt: The constitution of the United States.

2. hive.sh: Runs a simple hive example using const.txt.

3. mapreduce.sh: Runs a simple map-reduce example using const.txt.

6. wc.py: A simple python word count example for spark.

7. wc.R: A simple R example that counts lines in a file.

7. wc.sh: Runs wc.py over const.txt.  wc.py is run three times, first in standalone mode, second in yarn client mode, and last in yarn cluster mode.

8. notebook.sh: Runs the Jupyter notebook server.  Both the python3 and R notebooks should be available off the "new" button.  Run notebook.sh on your host to access the server.

9. ipyspark.sh: Runs pyspark as a Jupyter notebook.

