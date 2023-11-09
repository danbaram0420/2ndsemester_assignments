const { runQuery } = require('./database');
const getScoreStats = async () => {
const sql = 'SELECT course, Count(*) AS cnt, Avg(final) AS avg, ' +
'Stddev(final) AS stddev FROM scores GROUP BY course';
const results = await runQuery(sql);
return results;
};
const getScoreByIdName = async (id, name) => {
const sql = `SELECT * FROM scores WHERE id = ${id} AND student = '${name}'`;
const results = await runQuery(sql);
return results[0];
};
(async () => {
const stats = await getScoreStats();
console.log(stats);
stats.forEach(stat => {
const { course, cnt, avg, stddev } = stat;
console.log(`${course} (${cnt} people): Average ${avg}, Std.Dev. ${stddev}`);
});
const scoreData = await getScoreByIdName(2, 'Joe');
console.log(scoreData);
const { course, final } = scoreData;
console.log(`Course: ${course} / Final score: ${final}`);
})();
