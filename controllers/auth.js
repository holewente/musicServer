import mysql from 'mysql';
import bcrypt from 'bcryptjs';
import { configDB } from '../configDB.js';
const db=mysql.createConnection(configDB)
import {upload,removeFromCloud} from '../cloudinary.js'
import fs from 'fs';
//import { url } from 'inspector';

export const login=(request,response)=>{
    console.log(request.body)
    const{username,password}=request.body
    db.query('SELECT id,email,avatar,avatar_id,password,role FROM `users` WHERE username=? ',[username],(err,result)=>{
        if(err)
            console.log('hibás!',err)
        else{
            console.log(result[0].password.length)
            bcrypt.compare(password,result[0].password.trim(),(err,resultCompare)=>{
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
export const checkEmail=(request,response)=>{
    console.log(request.body)
    const{email}=request.body
    db.query('SELECT COUNT(*) nr FROM `users` WHERE email=?',[email],(err,result)=>{
        if(err)
            console.log('hibás!',err)
        else
            response.send({rowCount:result[0].nr,email:email})
    })
}

export const checkUsername=(request,response)=>{
    console.log(request.body)
    const{username}=request.body
    db.query('SELECT COUNT(*) nr FROM `users` WHERE username=?',[username],(err,result)=>{
        if(err)
            console.log('hibás!',err)
        else
            response.send({rowCount:result[0].nr,username:username})
    })
}


const saltRound=10

export const register=(request, response)=>{
    console.log(request.body)
    const {username,email,password} = request.body
    bcrypt.hash(password,saltRound,(err,hashedPassword)=>{
        if(err)
            console.log('bcrypt hibás!',err)
        else{console.log(hashedPassword)
            db.query('insert into users (username,email,password) values (?,?,?)',
            [username,email,hashedPassword],(err,result)=>{
                if(err){
                    console.log('hiba az insertnél',err)
                    response.send({msg:"Nem sikerült a regisztráció."})
                }else
                    response.send({msg:"Sikeres regisztráció",id:result.insertId})
            })
        }
    })
    
}

export const updateAvatar=async (request,response) => {
    const {username,avatar_id}=request.body
    if(request.files){
        const {selFile}=request.files
        const cloudFile=await upload(selFile.tempFilePath)
        console.log(cloudFile)
        db.query('update users set avatar=?,avatar_id=? where username=?',
        [cloudFile.url,cloudFile.public_id,username],
        (err,result)=>{
            if(err){
                console.log(err)
                response.send({msg:"Hiba",err})
            }else{
                removeFromCloud(avatar_id)
                removeTMPfiles(selFile.tempFilePath)
                response.send({msg:"Sikeres módosítás",
                            avatar:cloudFile.url,
                            avatar_id:cloudFile.public_id
                        })
            }
        })

    }
}

const removeTMPfiles=path=>{
    console.log("a törlendő path:",path)
    fs.unlink(path, err =>{
        if(err) throw err
    })
}

export const deleteUser=(request,response)=>{
    const{id}=request.params
    console.log('törlendő:',id,'-----')
    db.query('delete FROM `users` WHERE id=?',[id],(err,result)=>{
        if(err)
            console.log('hibás!',err)
        else
            console.log("törlés:",result)
            /*avatar_id && removeFromCloud(avatar_id)*/
            response.send({msg:'Sikeresen törölte a fiókját!',id:id})
    })
}

export const deleteFavorite=(request,response)=>{
    const{id}=request.params
    console.log('törlendő:',id,'-----')
    db.query('delete FROM `favorites` WHERE id=?',[id],(err,result)=>{
        if(err)
            console.log('hibás!',err)
        else
            console.log("törlés:",result)
            /*avatar_id && removeFromCloud(avatar_id)*/
            response.send({msg:'Song successfully removed from your favorites',id:id})
    })
}

export const changePassword=(request, response)=>{
    const {password,username} = request.body
    bcrypt.hash(password,saltRound,(err,hashedPassword)=>{
        if(err)
            console.log('bcrypt hibás!',err)
        else{console.log(hashedPassword)
            db.query('update users set password=? where username=?',
            [hashedPassword,username],(err,result)=>{
                if(err){
                    console.log('hiba az insertnél',err)
                    response.send({msg:"Jelszó változtatás sikertelen."})
                }else
                    response.send({msg:"Sikeres jelszó váltás!"})
            })
        }
    })
    
}

export const getUsers=(request, response)=>{
            db.query('select * from users', (err,result)=>{
                if(err){
                    console.log('hiba az insertnél',err)
                }else
                    response.send(result)
            })
        }


        export const addFavorite=(request,response)=>{
            console.log(request.body)
            const{user_id,link_url}=request.body
            db.query('SELECT count(*) nr from favorites where link_url=? and user_id=?',[link_url,user_id],(err,result)=>{
                if(err)
                    console.log('hibás!',err)
                else
                    console.log(result[0].nr)
            
            
            result[0].nr==0 && db.query('INSERT into favorites values (null,?,?)',[user_id,link_url],(err,result)=>{
                if(err)
                    console.log('hibás!',err)
                else
                    response.send(result)
            })
        })
        }

        export const getFavorites=(request,response)=>{
            const{user_id}=request.params
            console.log('felhasználó:',user_id,'-----')
            db.query('SELECT favorites.id,favorites.link_url,library.title from favorites,library where favorites.link_url=library.url and favorites.user_id=?',[user_id],(err,results)=>{
                if(err)
                    console.log('hibás!',err)
                else
                    response.send(results)
            })
        }



/*export const uploadURL=(request, response)=>{
    const {url} = request.body
    bcrypt.hash(url,saltRound,(err,hashedUrl)=>{
        if(err)
            console.log('bcrypt hibás!',err)
        else{console.log(hashedUrl)
            db.put('update library set url=?',
            [hashedUrl,url],(err,result)=>{
                if(err){
                    console.log('hiba az insertnél',err)
                    response.send({msg:"URL upload error."})
                }else
                    response.send({msg:"URL upload successful!"})
            })
        }
    })
    
}

export const uploadTitle=(request, response)=>{
    const {title} = request.body
    bcrypt.hash(title,saltRound,(err,hashedTitle)=>{
        if(err)
            console.log('bcrypt hibás!',err)
        else{console.log(hashedTitle)
            db.put('update library set title=?',
            [hashedTitle,title],(err,result)=>{
                if(err){
                    console.log('hiba az insertnél',err)
                    response.send({msg:"Title upload error."})
                }else
                    response.send({msg:"Title upload successful!"})
            })
        }
    })
    
}*/