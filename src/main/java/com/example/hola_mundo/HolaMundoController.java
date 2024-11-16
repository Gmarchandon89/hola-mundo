package com.example.hola_mundo;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;


@RestController
public class HolaMundoController {
    
    @GetMapping("/")
    public String holaMundo() {
        return "¡Hola Mundo!";
    }
    
}
