package com.mo.guardflyway.config;

import org.flywaydb.core.Flyway;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

@Configuration
public class FlywayConfig {

    @Value("${migration.url}")
    public String HOST;

    @Value("${migration.port}")
    public String PORT;

    @Value("${migration.schema}")
    public String SCHEMA;

    @Value("${migration.username}")
    public String ID;

    @Value("${migration.password}")
    public String PW;

    @Value("${migration.location}")
    public String LOCATION;

    public final String OPTION = "verifyServerCertificate=false&useSSL=true&serverTimezone=UTC";

    @PostConstruct
    public void init() {
        /*System.out.println("FlywayConfig init() call");*/
        getFlyway();
    }

    @Bean
    public Flyway getFlyway() {
        Flyway flyway = new Flyway();
        flyway.setDataSource(String.format("jdbc:mysql://%s:%s/%s?%s", HOST, PORT, SCHEMA, OPTION),
                ID,
                PW);
        flyway.setLocations(LOCATION);
        flyway.clean();
        flyway.migrate();
        return flyway;
    }
}
