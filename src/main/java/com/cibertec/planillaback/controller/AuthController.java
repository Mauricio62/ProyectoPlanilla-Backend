package com.cibertec.planillaback.controller;

import com.cibertec.planillaback.Dto.JwtResponseDto;
import com.cibertec.planillaback.Dto.LoginRequestDto;
import com.cibertec.planillaback.Dto.RegisterRequestDto;
import com.cibertec.planillaback.Dto.RoleDTO;
import com.cibertec.planillaback.Service.AuthService;
import com.cibertec.planillaback.Utils.Enums.RolUsuarioEnum;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
public class AuthController {
    private final AuthService authService;

    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @PostMapping("/login")
    @Operation(summary = "Autenticar usuario", description = "Endpoint para iniciar sesión y obtener JWT token", security = {})
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Autenticación exitosa"),
            @ApiResponse(responseCode = "400", description = "Credenciales inválidas")
    })
    public ResponseEntity<?> authenticateUser(@RequestBody LoginRequestDto loginRequest) {
        try {
            JwtResponseDto response = authService.authenticateUser(loginRequest);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error en autenticación: " + e.getMessage());
        }
    }

    @PostMapping("/register")
    @Operation(summary = "Registrar usuario", description = "Endpoint para crear un nuevo usuario")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Usuario registrado exitosamente"),
            @ApiResponse(responseCode = "400", description = "Error en el registro")
    })
    public ResponseEntity<?> registerUser(@RequestBody RegisterRequestDto registerRequest) {
        try {
            String result = authService.registerUser(registerRequest);
            return ResponseEntity.ok(result);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error en registro: " + e.getMessage());
        }
    }
    @GetMapping("/roles")
    @Operation(summary = "Obtener roles disponibles", description = "Retorna la lista de roles disponibles para registro")
    public List<RoleDTO> getAvailableRoles() {
        return Arrays.stream(RolUsuarioEnum.values())
                .map(role -> new RoleDTO(role.name(), role.getDescription()))
                .collect(Collectors.toList());
    }

}
