------------------------------------
Hibiscus Payment-Server Docker Image
------------------------------------

[Hibiscus](http://www.willuhn.de/products/hibiscus-server/) communicates with
(German) banks using the HBCI/FinTS protocol.

Usage:

```
TAG=v2.10.25
docker run -e PASSWORD=foo -p 38080:38080 -v /mnt/pool/apps/hibiscus:/srv/hibiscus ghcr.io/jazzpi/docker-hibiscus-server:$TAG
```

(or use `TAG=master` for the latest release).

**PASSWORD** is the (required) password used to encrypt the database.

The data directory is set to ``/srv/hibiscus``.

Database
--------

By default, an embedded database will be created within the data directory.

Other supported environment values
----------------------------------

**USE_SSL** (default: true): Serve via SSL. Set to 0 to disable SSL.

**PORT** (default: 38080): Port to provide service at.
