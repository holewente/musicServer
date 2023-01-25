import mysql from 'mysql'
import { configDB } from '../configDB.js';
const db=mysql.createConnection(configDB)

export const books=(request,response)=>{
    db.query('SELECT * FROM musiclist order by username',(err,result)=>{
        if(err)
            console.log('hiba:',err)
        else
            response.send(result)
    })
}