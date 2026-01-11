package io.github.persiliao.echo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Simple REST controller for demonstrating API endpoints.
 * This class provides a basic echo endpoint to verify service functionality.
 *
 * @RestController indicates that this class handles HTTP requests and returns response bodies.
 * @RequestMapping maps all methods to the base path "/api".
 */
@RestController
@RequestMapping("/api")
public class EchoController {

    /**
     * Echo endpoint that returns a greeting message.
     * This can be used to test if the service is working correctly.
     *
     * @return A string message with a greeting.
     */
    @GetMapping("/echo")
    public String echo() {
        return "Hello from Echo Service!";
    }
}
