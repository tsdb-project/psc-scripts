# How to use SSH tunnel

## Commands

- From PSC DB to local (Remote on 8080, Local on 10080)

```shell
ssh -N -L localhost:10080:xxx.pvt.bridges.psc.edu:8080 xxx@bridges.psc.edu
```

- From local to routing server (Remote on 10080, Local on 10099)

```shell
ssh -N -R 127.0.0.1:10099:127.0.0.1:10080 xxx@xxxx.xxx
```

## Reference

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
