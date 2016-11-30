const env = require('env2');
const fs = require('fs');

const buildDatabase = (cb) => {
  env('./config.env');

  const connection = require('./db_connection');

  const sql = fs.readFileSync(`${__dirname}/db_build.sql`).toString();

  connection.query(sql, (err, result) => {
    if (err) {
      cb(err);
    } else {
      console.log(result, "result");
      cb(null, result);
    }
  });
};

module.exports = buildDatabase;
