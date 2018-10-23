------------------------------------
Hibiscus Payment-Server Docker Image
------------------------------------

[Hibiscus](http://www.willuhn.de/products/hibiscus-server/) communicates with
(German) banks using the HBCI/FinTS protocol.

Usage:

    $ docker run -e PASSWORD=foo -p 8080:8080 schlickspringer/docker-hibiscus-server


**PASSWORD** is the (required) password used to encrypt the database.

The data directory is set to ``/srv/hibiscus``.

Database
--------

By default, an embedded database will be created within the data directory.

Other supported environment values
----------------------------------

**USE_SSL** (default: true): Serve via SSL.

**PORT** (default: 38080): Port to provide service at.
