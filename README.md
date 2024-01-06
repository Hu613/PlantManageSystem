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
router.post('/addcomment', commentControl.addcomment);
router.get('/getCommentsByPageId/:pageId', commentControl.getCommentsByPageId);

garden.js stores the apis for get the user's garden and layout, create and delete user's garden.
router.post('/createGarden', gardenControl.createGarden);

router.get('/getgarden/:userId', gardenControl.getgarden);

router.get('/getGardenPage/:gardenid', gardenControl.getGardenPage);

router.post('/deletegarden', gardenControl.deletegarden);

gardencard. js stores the apis for the plant card of the user's garden layout plan.
router.post('/createOrUpdateGardenCard', gardencardControl.createOrUpdateGardenCard);

pest, social, supplier, tag, plant store apis for getting information about pests, user shared experiences, suppliers, plant types, plants
router.get('/getpest', pestControl.getpest);

router.get('/getPestPage/:pestid', pestControl.getPestPage);

router.get('/getplant', plantControl.getplant);

router.get('/getPlantPage/:plantid', plantControl.getPlantPage);

router.post('/incrementPlantEnterTime/:plantid/enter', plantControl.incrementPlantEnterTime);

router.get('/gethotplant', plantControl.gethotplant);

router.get('/getsocial', socialControl.getsocial);

router.get('/gethotsocial', socialControl.gethotsocial);

router.get('/getnewsocial', socialControl.getnewsocial);

router.get('/getusersocial/:userId', socialControl.getusersocial);

router.get('/getsocialpage/:shareid', socialControl.getsocialpage);

router.get('/getusercollect/:userId', socialControl.getusercollect);

router.get('/getsupplier', supplierControl.getsupplier);


router.get('/getplanttypesupplier', supplierControl.getplanttypesupplier);


router.get('/getpestsupplier', supplierControl.getpestsupplier);


router.get('/getplantkitsupplier', supplierControl.getplantkitsupplier);


router.get('/gettag', tagControl.gettag);

router.get('/getPlanttypePage/:tagid', tagControl.getPlanttypePage);

search. js stores the apis for the search function.
router.post('/search', searchControl.search);

user. js stores the apis for user functionality and for getting various types of information about the user into the user interface.
router.post('/login', userControl.login);

router.post('/register', upload.single('avatar'), userControl.register);

router.post('/createExperience', upload.array('sharepictures',5), userControl.createExperience);

router.post('/incrementEnterTime/:shareid/enter', userControl.incrementEnterTime);

router.get('/getuserpage/:userId', userControl.getuserpage);

router.post('/collect', userControl.collect);

router.post('/deleteshare', userControl.deleteshare);

router.post('/deletecollect', userControl.deletecollect);

router.post('/concern', userControl.concern);

router.post('/deleteconcern', userControl.deleteconcern);

router.get('/checkconcern/:userId/:concernuserId', userControl.checkconcern);

router.get('/getUserConcern/:userId', userControl.getUserConcern);