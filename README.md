#Sistemas y Tecnologías Web - Práctica 6: Chat usando Ajax y JQuery

**Autores: Eduardo Javier Acuña Ledesma | Sergio Díaz González**


###Descripción
Chat usando Ajax y JQuery que cumple los siguientes requisitos:

* Los usuarios deberán registrarse.
* Si el nombre del usuario esta tomado se señalara el error y se le pedirá que cambie de nombre.
* Una vez en el chat:
	- En un contenedor aparecen los nombres de usuario.
	- En otro los mensajes.
	- En un tercero con un botón send la entrada para el siguiente mensaje del usuario.
* Escriba las pruebas. Use Selenium.
* Despliegue las pruebas en Travis.
* Haga un análisis de cubrimiento usando Coveralls.
* Análisis de Cubrimiento.
* Despliegue en Heroku.

###Enlaces


#### Coveralls:
[![Coverage Status](https://coveralls.io/repos/alu3286/SYTW-Practica-6/badge.png?branch=master)](https://coveralls.io/r/alu3286/SYTW-Practica-6?branch=test)

#### Travis: 
[![Build Status](https://travis-ci.org/alu3286/SYTW-Practica-6.svg?branch=master)](https://travis-ci.org/alu3286/SYTW-Practica-6)

###Instalación

Lo primero que haremos será clonar el repositorio de github SYTW-Practica-6 de la siguiente forma: `git clone git@github.com:alu3286/SYTW-Practica-6.git`.

Instalaremos las gemas necesarias: `bundle install`

Luego ejecutaremos en local, escribiendo `rake`en la consola.

Por último, iremos a http://localhost:4567/ para poder usar la aplicación.


###Visualización en Heroku
También puedes ver la aplicación en Heroku pinchando [aquí](https://michatajax.herokuapp.com/).

###Comprobación de los tests
Para comprobar los test con selenium ejecutar en terminal `rake selenium`.

Para comprobar test rspec `rake spec`.


# Referencias

Ver

* [DataMapper](http://datamapper.org/getting-started.html)
* [Haml](http://haml.info/)
* [Sinatra](http://www.sinatrarb.com/)
* [Deploying Rack-based Apps in Heroku](https://devcenter.heroku.com/articles/rack) y [Casiano Docs](http://nereida.deioc.ull.es/~lpp/perlexamples/node483.html#section:herokupostgres)
* [Intridea Omniauth](https://github.com/intridea/omniauth)
* [Chartkick](https://github.com/ankane/chartkick)


*Sistemas y Tecnologías Web - Eduardo Javier Acuña Ledesma | Sergio Díaz González*

