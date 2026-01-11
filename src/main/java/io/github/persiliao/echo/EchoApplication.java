package io.github.persiliao.echo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @author Persi.Liao
 */
@EnableDiscoveryClient
@SpringBootApplication
public class EchoApplication
{
    public static void main(String[] args) {
        SpringApplication.run(EchoApplication.class, args);
    }
}