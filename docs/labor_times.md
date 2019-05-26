**Documentación LaborTimes**

_Endpoint_ `POST /api/v1/labor_times`

_Header_ `'Authorization': 'Bearer rAzzdZXvL30lGTLrKCoGcXmcAqLew2ZGm__bvfPD4Vg'`

_Status_ 201

_Params_

    {}

_Response_

    {
        "id": "953a215b-3cb2-4022-9167-da16baaf6327",
          "start_date": "2019-05-26T16:02:14.642Z",
          "end_date": null,
          "worked_time": 0,
          "user": {
            "id": "eeed207a-3fc9-46cc-9000-49aafedd23cf",
            "email": "admin@admin.com",
            "fullname": "admin",
            "got_pending_labor_time": true,
            "is_admin": false
          }
    }
    
En el caso en que se mande a llamar el endpoint, y  posee un horario pendiente, se comporta de la siguiente manera

_Status_ 422

_Params_

    {}

_Response_

    {
      "error": "pending labor time: 24/Mayo"
    }
    
    
_Endpoint_ `GET /api/v1/labor_times`

_Description_ `List all labor times if current user is admin, shows all labor times, but if is an user, shows only curren user labor_times`

_Header_ `'Authorization': 'Bearer rAzzdZXvL30lGTLrKCoGcXmcAqLew2ZGm__bvfPD4Vg'`

_Status_ 200

_Params_

    {}

_Response_

    [
      {
        "id": "782cda1e-8006-425b-89a1-7528b3c9b540",
        "start_date": "2019-05-24T14:10:14.474Z",
        "end_date": "2019-05-24T22:10:14.474Z",
        "worked_hours": 8,
        "user": {
          "id": "15991af5-e202-4120-8af9-81fe7bb2c7b0",
          "email": "francisco@example.org",
          "fullname": "Raynald Westerling",
          "got_pending_labor_time": true,
          "is_admin": false
        }
      },
      {
        "id": "9d27cbc5-85a2-4e4a-9103-51fab6258710",
        "start_date": "2019-05-24T09:10:14.463Z",
        "end_date": "2019-05-24T16:10:14.463Z",
        "worked_hours": 7,
        "user": {
          "id": "15991af5-e202-4120-8af9-81fe7bb2c7b0",
          "email": "francisco@example.org",
          "fullname": "Raynald Westerling",
          "got_pending_labor_time": true,
          "is_admin": false
        }
      }, ...
    ]
    
_Endpoint_ ` POST /api/v1/labor_times/finish`

_Header_ `'Authorization': 'Bearer rAzzdZXvL30lGTLrKCoGcXmcAqLew2ZGm__bvfPD4Vg'`

_Status_ 200

_Params_

    {}

_Response_

    {
      "result": "success"
    }
    
En el caso en que se mande a llamar el endpoint, y no posee un horario pendiente, se comporta de la siguiente manera

_Status_ 422

_Params_

    {}

_Response_

    {
      "error": "no pending labor time"
    }