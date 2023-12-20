const db = require('../common/db');

function search(req, res) {
    console.log('Search route called');
    const query = req.body.query;
    const searchResults = {
        users: [],
        shares: [],
        plants: []
    };//Initialise arrays of user, shares and plants search results

    try {

        db.query('SELECT id, username, useravatar FROM user WHERE username LIKE ?', [`%${query}%`], (err, userResults) => {
            if (err) throw err;
            searchResults.users = userResults; //store  user search results
            console.log(userResults); //print and check information is correct
        
            db.query('SELECT shareid, title FROM share WHERE title LIKE ?', [`%${query}%`], (err, shareResults) => {
                if (err) throw err;
                searchResults.shares = shareResults; //store share's experiences search results
               console.log(shareResults);
         
                db.query('SELECT plantid, plantname, plantpicture FROM plant WHERE plantname LIKE ?', [`%${query}%`], (err, plantResults) => {
                    if (err) throw err;
                    searchResults.plants = plantResults; //store plants search results

                    res.json(searchResults); //send searchResults to front-end
                });
            });
        });
    } catch (error) {
        console.error('Search error:', error);
        res.status(500).send('Internal Server Error');
    }
}

module.exports = {
    search
};
