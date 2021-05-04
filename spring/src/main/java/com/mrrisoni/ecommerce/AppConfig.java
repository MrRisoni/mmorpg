package com.mrrisoni.ecommerce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;

@Configuration
@ComponentScan("com.mrrisoni.ecommerce")
public class AppConfig {
    @Autowired
    Environment environment;

    String host = System.getenv("LINODE_ORACLE_URL");
    String port = System.getenv("LINODE_ORACLE_PORT");
    String SID = System.getenv("LINODE_ORACLE_SID");
    String schema = System.getenv("LINODE_ORACLE_SCHEMA");
    String passwd = System.getenv("LINODE_ORACLE_PASSWD");
    String dbURL = "jdbc:oracle:thin:@" + host + ":"+ port +":" + SID;

    @Bean
    DataSource dataSource() {
        System.out.println(dbURL);
        DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
        driverManagerDataSource.setUrl(dbURL);
        driverManagerDataSource.setUsername(schema);
        driverManagerDataSource.setPassword(passwd);
        driverManagerDataSource.setDriverClassName("oracle.jdbc.OracleDriver");
        return driverManagerDataSource;
    }
}