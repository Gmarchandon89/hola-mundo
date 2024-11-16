package com.example.hola_mundo;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.web.client.RestTemplate;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
public class HolaMundoControllerTest {

    @LocalServerPort
    private int port;

    @Test
    public void testHolaMundo() {
        RestTemplate restTemplate = new RestTemplateBuilder().build();
        String url = "http://localhost:" + port + "/";
        String response = restTemplate.getForObject(url, String.class);
        assertThat(response).isEqualTo("¡Hola Mundo!");
    }
}
