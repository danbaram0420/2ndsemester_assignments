/*const{Router}=require("express");
const{runQuery}=require("./database");

const router=Router();
router.get("/fare", (req, res) =>{
    const {uid} = req.query;
    const wql = "werwerwer ?";

})*/
const mysql = require('mysql2/promise');
const pool = mysql.createPool({
host: 'localhost',
user: 'root',
password: 'cycpas.2378z',
database: 'kweb_db',
});
const runQuery = async sql => {
const conn = await pool.getConnection();
try {
const [result] = await conn.query(sql);
return result;
} finally {
conn.release();
}
};
module.exports = { runQuery };