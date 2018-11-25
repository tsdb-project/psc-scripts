# How to use SSH tunnel

## Commands

- From PSC DB to local brainflux (Remote on 8086, Local on 8086)

```shell
ssh -N -L localhost:8086:rxxx.pvt.bridges.psc.edu:8086 xxx@bridges.psc.edu
```

- From local brainflux to routing server (Remote on 10080, Local on 10099)

```shell
ssh -N -R 127.0.0.1:10099:127.0.0.1:10080 xxx@xxxx.xxx
```

- From local brainflux to routing server in a stable way(Remote on 10080, Local on 10099)

```shell
autossh -f -M 20000 -N -R 127.0.0.1:10099:127.0.0.1:10080 xxx@xxxx.xxx
```

## Notes

**Local** means where `sshd` runs, **remote** means where `ssh` runs.

- Local (Outgoing): Listen on **remote**, tunnel from **local**.
- Remote (Incoming): Tunnel from **local**, listen on **remote**.

## Reference

### SSH

From Linux man:

```shell
-L [bind_address:]port:host:hostport
-L [bind_address:]port:remote_socket
-L local_socket:host:hostport
-L local_socket:remote_socket
```

Explain:

>     Specifies that connections to the given TCP port or Unix socket on the local (client) host are to be forwarded to the given host and port, or Unix socket, on the remote side.  This works by
>     allocating a socket to listen to either a TCP port on the local side, optionally bound to the specified bind_address, or to a Unix socket.  Whenever a connection is made to the local port or
>     socket, the connection is forwarded over the secure channel, and a connection is made to either host port hostport, or the Unix socket remote_socket, from the remote machine.
>
>     Port forwardings can also be specified in the configuration file.  Only the superuser can forward privileged ports.  IPv6 addresses can be specified by enclosing the address in square brack‐
>     ets.
>
>     By default, the local port is bound in accordance with the GatewayPorts setting.  However, an explicit bind_address may be used to bind the connection to a specific address.  The bind_address
>     of “localhost” indicates that the listening port be bound for local use only, while an empty address or ‘*’ indicates that the port should be available from all interfaces.

### AutoSSH

```
usage: autossh [-V] [-M monitor_port[:echo_port]] [-f] [SSH_OPTIONS]

    -M port[:echo_port]
            specifies the base monitoring port to use. Without the echo port, this port and the port immediately above it ( port + 1) should
            be something nothing else is using.  autossh will send test data on the base monitoring port, and receive it back on the port
            above. For example, if you specify "-M 20000", autossh will set up forwards so that it can send data on port 20000 and receive it
            back on 20001.

            Alternatively, a port for a remote echo service may be specified. This should be port 7 if you wish to use the standard inetd echo
            service.  When an echo port is specified, only the specified monitor port is used, and it carries the monitor message in both
            directions.

            Many people disable the echo service, or even disable inetd, so check that this service is available on the remote machine. Some
            operating systems allow one to specify that the service only listen on the localhost (loopback interface), which would suffice for
            this use.

            The echo service may also be something more complicated: perhaps a daemon that monitors a group of ssh tunnels.

            Setting the monitor port to 0 turns the monitoring function off, and autossh will only restart ssh upon ssh's exit. For example,
            if you are using a recent version of OpenSSH, you may wish to explore using the ServerAliveInterval and ServerAliveCountMax
            options to have the SSH client exit if it finds itself no longer connected to the server. In many ways this may be a better solu-
            tion than the monitoring port.

    -f      causes autossh to drop to the background before running ssh. The -f flag is stripped from arguments passed to ssh. Note that there
            is a crucial difference between -f with autossh, and -f with ssh: when used with autossh ssh will be unable to ask for passwords
            or passphrases. When -f is used, the "starting gate" time (see AUTOSSH_GATETIME) is set to 0.
```
