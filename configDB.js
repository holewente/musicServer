/*export const configDB={
    host :"localhost",
    user : "root",
    password : "",
    database :"musiclist"
}*/
import * as dotenv from 'dotenv';
dotenv.config();
export const configDB={
    host     : process.env.MYSQL_HOST,
    user     : process.env.MYSQL_USERNAME,
    password : process.env.MYSQL_PASSWORD,
    database : process.env.MYSQL_DATABASE
}
console.log("database:",configDB.host)