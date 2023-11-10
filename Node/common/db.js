const mysql = require('mysql')
const db = mysql.createPool({
    host: '127.0.0.1',
    user: 'root',
    password: '88888888',
    database: 'PlantSystem',
    port:  3306,
})


module.exports = db