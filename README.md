# Mesos in one command

It uses official images from mesosphere, some zookeeper repo (not sure what's official), and vagrant private networking to enable interactions with tasks over real network. It also enables docker containerizer.

The attemp is made to persist state insite Vagrant box between restart. Intent is continue developing this configuration and put it in production on permanent virtual machine. Tested by starting a task, then rebooting whole master host (zk, mesos, marathon): when it came back, it knew about running task, it did not start antoher one, and did not restart existing.

## Versions

* Mesos 0.26.0
* Marathon 0.13.0
* Zookeeper 3.4.6
* Docker registry 2

## Usage

Run your cluster:

```
vagrant up
```

That's it, use the following URLs:

* http://192.168.33.10:5050/ for Mesos master UI
* http://192.168.33.10:8080/ for Marathon UI

To start hello world web server, run hello-world.sh. This will send a task to marathon with a very simple docker image. Go to marathon UI to find out where to go for propoer host and port.

To kill your cluster and wipe all state to start fresh:

```
vagrant destroy
```

## IP addresses

Mesos is sensitive to IP addresses, and needs to know explicitly how to advertise itself (both slave AND master). For that reason, IP address has been assigned to both machines explicitly, and added to MESOS environment variables. If you need to change IPs, make sure to do that in all locations, otherwise slave might not connect to master, or it might cause constant disconnects.

## More slaves

You can copy slave machine definition in vagrant file, update provision and compose scripts, and get more slaves started.

## Docker Registry

Master server starts with Docker Registry that persists images on the master host file system. It's safe to restart the registry to keep all images.

## Caveats

For some reason, slave did not want to run right away, and I had to install libapparmor1 to fix docker error.