Useful Resources for Jitsi
==========================

Here are some useful resources for understanding Jitsi and its place in NixOS, as well as how to work on it in this repo.

Jitsi source
-------------

* https://github.com/jitsi/jitsi-meet
* https://github.com/jitsi/jitsi-videobridge
* https://github.com/jitsi/jigasi
* https://github.com/jitsi/jicofo
* https://github.com/jitsi/jibri

Jitsi in Nixpkgs
----------------

All components are currently in nixpkgs except Jigasi, which is in this PR: https://github.com/NixOS/nixpkgs/pull/137003

A section on basic configuration is in the NixOS manual here: https://nixos.org/manual/nixos/stable/index.html#module-services-jitsi-meet

Jitsi deployment docs
---------------------

Jitsi's official docs for deployment and configuration.
https://jitsi.github.io/handbook/docs/devops-guide/devops-guide-start

Testing on a Digital Ocean VM
-----------------------------

* Use the "Custom image" section of this guide https://justinas.org/nixos-in-the-cloud-step-by-step-part-1 to create a NixOS image file that is compatible with Digital Ocean.
* Upload the image file through the DO browser interface (Create Droplets > Custom images > Add image > Upload image), set the distribution to "Unknown OS".
* Use this custom image to create a new droplet, make sure to add your SSH public key in the Authentication part of the creation process.
* If you don't already have access to the DNS for a domain, register one (can be done for free here https://www.freenom.com/).
* Enter the IP address DO provides for your new VM as a DNS "A record" for your domain.
* Create a branch of our repo and set your domain as the hostname for deploy-rs in the flake.nix (as well as anywhere else in the repo that is using the default project.zone domain), and change the email address in the configuration.nix.
* Set the sshUser in the flake.nix to root for the initial deploy and probably leave it that way since there is a currently an unresolved, intermittent issue with using the default deploy user).
* Run deploy-rs on your branch of the repo to do an initial deployment, as described in the README.md file.

Now you should be able to visit your domain in a browser and test that you have a working jitsi instance!

Third party resources
---------------------

TODO: useful blog posts, articles, etc.
