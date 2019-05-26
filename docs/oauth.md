**Documentación OAUTH**

Uso de doorkeeper para proveer tokens de seguridad.
Dicho token tiene que utilizarse en el valor del header 
`'Authorization': 'Bearer #{token}'`

_Endpoint_ `POST /oauth/token`

_Status_ 200

_Params_

    {
        "grant_type": "password",
        "email": "admin@admin.com",
        "password": "admin123456"
    }

_Response_

    {
      "access_token": "rAzzdZXvL30lGTLrKCoGcXmcAqLew2ZGm__bvfPD4Vg",
      "token_type": "Bearer",
      "expires_in": 604800,
      "refresh_token": "d5c0VxW6OUX5cQhgZugazwh612r4qkgVbKVxNrJ8JI4",
      "created_at": 1558890626
    }
    
_Status_ 400

_Params_

    {
        "grant_type": "password",
        "email": "admin@admin.com",
        "password": "admin"
    }

_Response_

    {
      "error": "invalid_grant",
      "error_description": "The provided authorization grant is invalid, expired, revoked, does not match the redirection URI used in the authorization request, or was issued to another client."
    }