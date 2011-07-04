Infinite Button Cooperative Edition 2.0
===

Infinite fun with the infinite Button Cooperative Edition 2.0.
This is just an example on how to use SocketStream, not a real game. It's not even fun.

(and this README is basically the one from Socketchat, see https://github.com/addyosmani/socketchat.git)

INSTALL
-------

To get Node and Redis up and running on the cloud servers:

Before you run SocketStream, you will need to install the following software:

  - Node.js (http://nodejs.org)
  - Node Package Manager (http://npmjs.org)
  - Redis (http://redis.io)

Instructions on how to install those items of software are included below for reference, and are taken from the home pages of those software libraries.

Note: You may also need to install the following packages:

    yum install gettext-devel expat-devel curl-devel zlib-devel openssl-devel
  
Step 1 - Install Node.js

Firstly, Check you have the dependencies for Node.js installed first (see https://github.com/joyent/node/wiki/Installation). If you satisfy them, then follow the command line instructions below:

    wget http://nodejs.org/dist/node-v0.4.8.tar.gz     # (check this is the latest version)
    tar xzf node-v0.4.8.tar.gz
    cd node-v0.4.8
    ./configure
    make
    sudo make install
    
Step 2 - Install Node Package Manager (npm)

    curl http://npmjs.org/install.sh | sh

Step 3 - Install redis

    wget http://redis.googlecode.com/files/redis-2.2.7.tar.gz
    tar xzf redis-2.2.7.tar.gz
    cd redis-2.2.7
    make
    
Step 4 - Install SocketStream

    git clone git://github.com/socketstream/socketstream.git
    cd socketstream/
    npm install -g
    
Step 4 - Install Infinite Button Cooperative Edition 2.0

    git clone https://eprochasson@github.com/eprochasson/infinite-button.git
    cd infinite-button/
    npm link

Step 5 - Run Infinite Button Cooperative Edition 2.0

    socketstream start