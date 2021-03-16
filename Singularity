Bootstrap: docker
From: ubuntu:18.04

%environment
    export PATH=/opt/elasticsearch/bin:/opt/kibana/bin:$PATH
%post
    sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
    sed -i.bak -e "s%http://security.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
    apt-get -y update
    apt-get -y upgrade
    apt-get -y install vim wget sudo less openjdk-11-jdk

    cd /usr/local/src
    wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.11.2-linux-x86_64.tar.gz
    tar xzvf elasticsearch-7.11.2-linux-x86_64.tar.gz
    mv elasticsearch-7.11.2 /opt/elasticsearch
    chmod 666 /opt/elasticsearch/config/*.yml
    chmod 666 /opt/elasticsearch/config/jvm.options
    chmod 666 /opt/elasticsearch/config/log4j2.properties
    chmod 666 /opt/elasticsearch/config/users
    chmod 666 /opt/elasticsearch/config/users_roles
    chmod 755 /opt/elasticsearch/config/jvm.options.d
    chmod 755 /opt/elasticsearch/jdk/*
    chmod 644 /opt/elasticsearch/jdk/release
    chmod 755 /opt/elasticsearch/jdk/conf/management
    chmod 755 /opt/elasticsearch/jdk/conf/sdp
    chmod 755 /opt/elasticsearch/jdk/conf/security
    chmod 755 /opt/elasticsearch/jdk/conf/security/policy
    chmod 755 /opt/elasticsearch/jdk/conf/security/policy/limited
    chmod 755 /opt/elasticsearch/jdk/conf/security/policy/unlimited
    chmod 755 /opt/elasticsearch/jdk/include/linux
    chmod 755 /opt/elasticsearch/jdk/legal/*
    chmod 755 /opt/elasticsearch/jdk/lib/jfr
    chmod 755 /opt/elasticsearch/jdk/lib/security
    chmod 755 /opt/elasticsearch/jdk/lib/server
    chmod 755 /opt/elasticsearch/jdk/man/man1

    /opt/elasticsearch/bin/elasticsearch-plugin install analysis-kuromoji
    /opt/elasticsearch/bin/elasticsearch-plugin list

    wget https://artifacts.elastic.co/downloads/kibana/kibana-7.11.2-linux-x86_64.tar.gz
    tar xzvf kibana-7.11.2-linux-x86_64.tar.gz
    mv kibana-7.11.2-linux-x86_64 /opt/kibana


