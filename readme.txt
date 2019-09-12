GET http://localhost:4000/api/workingtimes
GET http://localhost:4000/api/workingtimes/X   			// pour le workingtime ou l'id = X
GET http://localhost:4000/api/workingtimes/?user_id=X		// pour le workingtime dont le user id = X mais il faut que celui-ci soit existant

GET http://localhost:4000/api/users
GET http://localhost:4000/api/users/x				// pour le user ou l'id = X
GET http://localhost:4000/api/users/?email=XX@X.X		// normalement pour avoir seulement le user avec cette adresse Mail mais ça, ça ne fonctionne pas

GET http://localhost:4000/api/clocks
GET http://localhost:4000/api/clocks/X				// pour avoir le clock ou l'ID = X
GET http://localhost:4000/api/clocks/?user_id=X			// pour le clock dont le user id = X mais lui je sais pas pk ça ne marche pas (je suis en train de regarder)



Exemple de POST

POST http://localhost:4000/api/workingtimes

{ "workingtime":{ "start":"2019-09-12 08:08:28", "end":"2019-09-13 08:08:28", "user_id":"X"}} 		// les dates sont à titre d'exemple 

POST http://localhost:4000/api/users

{ "user":{ "username":"Luc", "email":"luc@epitech.eu"}} 

POST http://localhost:4000/api/clocks

{ "clock":{ "time":"2019-09-12 08:08:28", "status":"true", "user_id":"X"}} 				// les dates sont à titre d'exemple

Tous les DELETE fontionne avec L'ID

et tous les PUT fonctionne avec L'ID