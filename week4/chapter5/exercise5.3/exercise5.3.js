const express = require('express');
const app = express();
const port = 3000;

const { runQuery } = require('./database');

const getFareByUid = async (uid) => {
const sql = ' SELECT `users`.`name`, SUM(Round((`types`.`fare_rate`/100) * (`trains`.`distance`/10), -2)) AS `total_fare` FROM `tickets`' + 
'INNER JOIN `users` ON `tickets`.`user` = `users`.`id`' + 
'INNER JOIN `trains` ON `tickets`.`train` = `trains`.`id`' + 
'INNER JOIN `types` ON `trains`.`type` = `types`.`id`' + 
'WHERE `users`.`id` = ' + `${uid}` + ' GROUP BY `tickets`.`user` '
const results = await runQuery(sql);
return results[0];
};
const getStatusByTid = async (tid) => {
const sql = 'SELECT `trains`.`id`, Count(`tickets`.`train`) AS `occupied`, `types`.`max_seats` AS `maximum` FROM `trains`' + 
'INNER JOIN `types` ON `trains`.`type` = `types`.`id`' + 
'INNER JOIN `tickets` ON `tickets`.`train` = `trains`.`id`' + 
'WHERE `trains`.`id` = ' + `${tid}` + 
' GROUP BY `tickets`.`train`';
const results = await runQuery(sql);
return results[0];
};

app.get('/fare', function (req, res){
    const {uid} = req.query;
    (async () => {
        try{
            const fares = await getFareByUid(uid);
            const {name, total_fare} = fares;
            res.send('Total fare of ' + name + ' is ' + total_fare + ' KRW.');
        } catch (err) {
            console.error('500 Internal Server Error');
        };
    })();
});

app.get('/train/status', function (req, res){
    const {tid} = req.query;
    (async () => {
        try{
            const status = await getStatusByTid(tid);
            const {id, occupied, maximum} = status;
            if(occupied == maximum){
                res.send('Train ' + id + ' is sold out.');
            }else{
                res.send('Train ' + id + ' is not sold out.');
            };
        } catch (err) {
            console.error('500 Internal Server Error');
        };
        })();
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));       

