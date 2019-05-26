# README

API para el control de entrada y salida de empleados,
desarrollada en Rails 5.1.3, ruby 2.5.2 y postgresql 10

**Instalación**

Cambiar nombre archivo de variables de entorno `./config/application.yml.example` por `./config/application.yml` , 
luego reemplezar valor a las variables `DATABASE_USERNAME, DATABASE_PASSWORD`

Luego realizar:

1. `bundle install`

2. `rails db:create && rails db:migrate`

3. `rails db:seed`

4. `rails s`

**Tests**

`rspec`

**Documentación**

[Aqui](https://github.com/LGerMa/IO-employee-control-api/tree/master/docs)
