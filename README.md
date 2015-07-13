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

I currently don't have any fancy auto-running tools for Node, as this is for
development, and most tools that reload on code changes seem to perform slowly
on VirtualBox VMs.
