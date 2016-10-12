zotonic/erlang
==============

An Alpine-based Erlang Docker image.

We use this as the base image for [Zotonic](https://hub.docker.com/u/zotonic/) 
because Alpine 3.5 will replace OpenSSL with LibreSSL and Erlang 
[segfaults](https://bugs.alpinelinux.org/issues/6332) on LibreSSL.
