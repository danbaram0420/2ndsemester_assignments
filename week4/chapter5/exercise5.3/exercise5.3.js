const express = require('express');
const app = express();
const port = 3000;

const { runQuery } = require('./database');
const getFareByUid = async (uid) => {
const sql = 'SELECT SUM(Round((`types`.`fare_rate`/100) * (`trains`.`distance`/10), -2)) AS `total_fare` FROM `tickets`' + 
'INNER JOIN `users` ON `tickets`.`user` = `users`.`id`' + 
'INNER JOIN `trains` ON `tickets`.`train` = `trains`.`id`' + 
'INNER JOIN `types` ON `trains`.`type` = `types`.`id`' + 
'WHERE `users`.`id` = ' + `${uid}` + ' GROUP BY `tickets`.`user` '
const results = await runQuery(sql);
return results[0];
};
const getStatusByTid = async (tid) => {
const sql = 'SELECT Count(`tickets`.`train`) AS `occupied`, `types`.`max_seats` AS `maximum` FROM `trains`' + 
'INNER JOIN `types` ON `trains`.`type` = `types`.`id`' + 
'INNER JOIN `tickets` ON `tickets`.`train` = `trains`.`id`' + 
'WHERE `trains`.`id` = ' + `${tid}` + ' GROUP BY `tickets`.`train`';
const results = await runQuery(sql);
return results[0];
};

app.get('/fare?uid=', (req, res) =>{
    const uid = req;
    (async () => {
        const fares = await getFareByUid(uid);
        const {total_fare} = fares;
    })();
    res.send('Total fare is'+total_fare);
});
/*
(async () => {
const uid = 22;
const fares = await getFareByUid(uid);
const {total_fare} = fares;
const tid = 15;
const status = await getStatusByTid(tid);
const {occupied, maximum} = status;
})();*/
