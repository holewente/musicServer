import mysql from 'mysql'
import { configDB } from '../configDB.js';
const db=mysql.createConnection(configDB)

export const addMusic=(request,response)=>{
    const {url,title,categ_id}=request.body
    db.query('insert into library (url,title,categ_id) values (?,?,?)',[url,title,categ_id],(err,result)=>{
        if(err)
            console.log('hiba:',err)
        else{
            console.log("oké")
            response.send({msg:result.affectedRows})
        }
            
    })
}
export const deleteMusic=(request,response)=>{
    const{id}=request.params
    console.log('törlendő:',id,'-----')
    db.query('delete FROM `library` WHERE id=?',[id],(err,result)=>{
        if(err)
            console.log('hibás!',err)
        else
            console.log("törlés:",result)
            /*avatar_id && removeFromCloud(avatar_id)*/
            response.send({msg:'Song successfully deleted from our library.',id:id})
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
export const getUrl=(request,response)=>{
    db.query('select * from library',(err,result)=>{
        if(err)
            console.log('hiba:',err)
        else
            response.send(result)
    })
}
export const getMusic=(request,response)=>{
    db.query('select * from library',(err,result)=>{
        if(err)
            console.log('hiba:',err)
        else
            response.send(result)
    })
}