import mysql from 'mysql'
import { configDB } from '../configDB.js';
const db=mysql.createConnection(configDB)

export const addMusic=(request,response)=>{
    const {url,title}=request.body
    db.query('insert into library (url,title) values (?,?)',[url,title],(err,result)=>{
        if(err)
            console.log('hiba:',err)
        else
            response.send(result)
    })
}
export const getCateg=(request,response)=>{
    db.query('select * from category order by genre',(err,result)=>{
        if(err)
            console.log('hiba:',err)
        else
            response.send(result)
    })
}