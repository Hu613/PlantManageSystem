const db = require('../common/db');

function search(req, res) {
    console.log('Search route called');
    const query = req.body.query;
    const searchResults = {
        users: [],
        shares: [],
        plants: []
    };

    try {

        db.query('SELECT id, username FROM user WHERE username LIKE ?', [`%${query}%`], (err, userResults) => {
            if (err) throw err;
            searchResults.users = userResults;
            console.log(userResults);
        
            db.query('SELECT shareid, title FROM share WHERE title LIKE ?', [`%${query}%`], (err, shareResults) => {
                if (err) throw err;
                searchResults.shares = shareResults;
               console.log(shareResults);
         
                db.query('SELECT plantid, plantname FROM plant WHERE plantname LIKE ?', [`%${query}%`], (err, plantResults) => {
                    if (err) throw err;
                    searchResults.plants = plantResults;

                    res.json(searchResults);
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
