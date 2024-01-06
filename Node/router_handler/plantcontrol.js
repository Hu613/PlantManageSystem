const db = require('../common/db');

function getplant(req, res) {//get all plants information for the front-end to display the card.
    const query = `SELECT plantid, plantname, plantpicture FROM plant`;
    db.query(query, (err, results) => {
      if (err) {
        console.error('Error fetching plant: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
      
        const plant = results.map(plant => ({
          ...plant
        }));
        res.json(plant);
      }
    });
  }

  
  function incrementPlantEnterTime(req, res) {//increase of plant view count function
    const { plantid } = req.params; 
  
    const updateQuery = `
      UPDATE plant SET entertime = entertime + 1 WHERE plantid = ?`;
  
    db.query(updateQuery, [plantid], (err, results) => {
      if (err) {
        console.error('Error updating database: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
        res.status(200).json({ message: 'Enter time incremented successfully' });
      }
    });
  }
  
  function getPlantPage(req, res) {//get the plant information for the front-end to display the plantpage.
    const plantid = req.params.plantid;
    const plantQuery = `SELECT plantid, plantname, description, planthelp, plantpicture, plantneed, wheretoplant, howtoplant, timetoplant FROM plant WHERE plantid = ?`;
    db.query(plantQuery, [plantid], (err, plantData) => {
      const plant = plantData[0];
      const pestQuery = `SELECT pe.pestid, pe.pestname, pe.pestpicture FROM plant_pest pp JOIN pest pe ON pe.pestid = pp.pestid WHERE pp.plantid = ?`;
      db.query(pestQuery, [plantid], (err, pests) => {
        if (err) {
          res.status(500).json({ error: 'Database error in fetching plants' });
          return;
        }
          const plantData = {
            plantid: plant.plantid,
            plantname: plant.plantname,
            description: plant.description,
            planthelp: plant.planthelp,
            plantpicture: plant.plantpicture,
            plantneed: plant.plantneed,
            wheretoplant: plant.wheretoplant,
            howtoplant: plant.howtoplant,
            timetoplant: plant.timetoplant,
            pests: pests
          };
          res.json(plantData); 
        });
    });
  }

  function gethotplant(req, res) {//get hot plants information for the front-end to display the card.
    const query = `SELECT plantid, plantname, plantpicture FROM plant ORDER BY entertime DESC LIMIT 3`;
    db.query(query, (err, results) => {
      if (err) {
        console.error('Error fetching plant: ', err);
        res.status(500).json({ error: 'Internal server error' });
      } else {
      
        const plant = results.map(plant => ({
          ...plant
        }));
        res.json(plant);
      }
    });
  }


  module.exports = {
    getplant,
    incrementPlantEnterTime,
    getPlantPage,
    gethotplant,
  };
  
   
   
 