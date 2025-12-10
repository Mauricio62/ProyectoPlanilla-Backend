package com.cibertec.planillaback.Service;

import com.cibertec.planillaback.Dto.JwtResponseDto;
import com.cibertec.planillaback.Dto.LoginRequestDto;
import com.cibertec.planillaback.Dto.RegisterRequestDto;

public interface AuthService {
    JwtResponseDto authenticateUser(LoginRequestDto loginRequest);
    String registerUser(RegisterRequestDto registerRequest);
}
