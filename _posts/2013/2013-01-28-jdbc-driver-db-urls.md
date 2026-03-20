---
layout: post
title: JDBC Drivers Classes & URLs
date: "2013-01-28 05:51"
tags: [jmeter, java, jdbc]
permalink: /2013/01/28/jdbc-db-urls/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on JMeter testing with DB"
gh-badge: [star,follow]
comments: true
author: Shantonu Sarker
---

In this article we will see different Driver class & Database URL pattern(syntax) used with JDBC driver in JAVA. We will use them with JMeter under JDBC Connection Configuration config element.
See my SQL testing post for know more about SQL testing.

# MySQL
- Driver class ```com.mysql.jdbc.Driver```
- Database URL ```jdbc:mysql://host[:port]/dbname```

# PostgreSQL
- Driver class ```org.postgresql.Driver```
- Database URL  ```jdbc:postgresql:{dbname}```

# Oracle
- Driver class ```oracle.jdbc.OracleDriver```
- Database URL ```jdbc:oracle:thin:@//host:port/service```  OR ``` jdbc:oracle:thin:@(description=(address=(host={mc-name})(protocol=tcp)(port={port-no}))(connect_data=(sid={sid})))```

# Ingres (2006)
- Driver class ```ingres.jdbc.IngresDriver```
- Database URL ```jdbc:ingres://host:port/db[;attr=value]```

# Apache Derby
- Driver class ```org.apache.derby.jdbc.ClientDriver```
- Database URL  ```jdbc:derby://server[:port]/databaseName[;URLAttributes=value[;...]]```

# SQL Server (MS JDBC driver)
- Driver class ```com.microsoft.sqlserver.jdbc.SQLServerDriver```
- Database URL  ```jdbc:sqlserver://host:port;DatabaseName=[dbname]``` OR ```jdbc:sqlserver://host:port;instanceName=[sqlexpress];DatabaseName=[dbname]```


# SQL Server (Sourgeforge Driver)
- Driver class ```net.sourceforge.jtds.jdbc.Driver```
- Database URL  ```jdbc:jtds:sqlserver:// [server name or ip] / [db name]```

# MS Acces [ODBC bridged]
- Driver class ```sun.jdbc.odbc.JdbcOdbcDriver```
- Database URL  ```jdbc:odbc:dsn", "", ""```

# MS Acces( StelsMDB)
- Driver class ```jstels.jdbc.mdb.MDBDriver2```
- Database URL  ```jdbc:jstels:mdb:```

# cassandra-jdbc
- Driver class ```org.apache.cassandra.cql.jdbc.CassandraDriver```
- Database URL ```jdbc:cassandra://host:port/dbName;```

# SqlLite
- Driver class ```org.sqlite.JDBC```
- Database URL ```jdbc:sqlite:sample.db```

This is all from the JMeter [doc](http://jmeter.apache.org/usermanual/component_reference.html#JDBC_Connection_Configuration). I mention separately to help other in finding them.
I will try to increase more driver syntax incrementally.

Update : 
# Snowflake
- Driver URL ```jdbc:snowflake://myorganization-myaccount.snowflakecomputing.com/?user=peter&warehouse=mywh&db=mydb&schema=public``` where  **myaccount** in the organization **myorganization** , **mywh** is whorehouse where **mydb** is the DataBase. [Source](https://docs.snowflake.com/en/developer-guide/jdbc/jdbc-configure)

 
Thanks ...:)