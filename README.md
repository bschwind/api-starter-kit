api-starter-kit
===============

This project is half an educational tool for me to learn more infrastructure
and half an easy starting point for making HTTP APIs

Dependencies
------------
- VirtualBox
- Vagrant

Build
-----
    $ vagrant up

Run
---

    $ vagrant ssh
    $ cd starter-kit
    $ node app.js

Visit `http://localhost:8080/api/v1/ping` in your browser. If everything is running, you should get PONG as a response.

I currently don't have any fancy auto-running tools for Node, as this is for
development, and most tools that reload on code changes seem to perform slowly
on VirtualBox VMs.

Debug
-----

Run the PostgreSQL shell:
    $ psql -d DB_NAME -h DB_HOSTNAME -U DB_USERNAME
