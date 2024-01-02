Guidance:
Open the Node and Plant folders separately and npm install to install the dependencies. 
Start the backend by typing node index in the node terminal and the frontend by typing npm run dev in the Plant terminal.


Content:
Plant:
Plant is the front-end, responsible for web page display and layout.
The main front-end files are in the src folder.
App.vue is the entry file for the website
The components are in the components folder.
index.js in the router is the route file. Individual pages have to be registered in the index.js before they can be displayed in the web page.
The front-end pages are stored in the views folder.

Node:
Node is the back-end, responsible for connecting to the database, interacting with the database and interacting with the front-end to provide the corresponding content.
Database config is ds.js and uuid.js is the module to create the unique id in the common folder.
The main purpose of file in the router are to define server-side routes. Each route has multiple handler functions.
The file in the route_handler are to interact with the database and send the content required by the front end.
index.js is a typical Express application server setup, covering key aspects such as middleware configuration, routing settings, error handling, and server startup.

PlantSystem.sql is the database.


APIS:
The apis for this project are all stored in the router folder on the backend.
comment. js stores apis about get comments and add comment.
garden.js stores the apis for planning the user's garden layout.
gardencard. js stores the apis for the plant card of the user's garden layout plan.
pest, social, supplier, tag, plant store apis for getting information about pests, user shared experiences, suppliers, plant types, plants
search. js stores the apis for the search function.
user. js stores the apis for user functionality and for getting various types of information about the user into the user interface.
