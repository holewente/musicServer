import mysql from 'mysql';
import bcrypt from 'bcryptjs';

export const login=(request,response)=>{
    console.log(request.body)
    const{username,password}=request.body
    db.query('SELECT id,email,avatar,avatar_id,password,role FROM `users` WHERE username=? ',[username],(err,result)=>{
        if(err)
            console.log('hibás!',err)
        else{
            bcrypt.compare(password,result[0].password,(err,resultCompare)=>{
                if(err)
                    response.send({error:"hibás jelszó"})
                if(resultCompare){
                    console.log('Sikeres összehasonlítás.',result[0].email)
                    response.send({username:username,
                        id:result[0].id,
                        email:result[0].email,
                        avatar:result[0].avatar,
                        avatar_id:result[0].avatar_id,
                        role:result[0].role,
                    })
                }else{
                    console.log('Hiba')
                    response.send({error:"Hibás jelszó!"})
                }
                    
            })
        }
        
    })
}