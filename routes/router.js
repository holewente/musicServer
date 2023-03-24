import express from 'express';
export const router=express.Router();

import {login,register,checkEmail,checkUsername,updateAvatar,deleteUser,changePassword,getUsers} from '../controllers/auth.js'

router.route('/login').post(login)
router.route('/register').post(register)
router.route('/checkEmail').post(checkEmail)
router.route('/checkUsername').post(checkUsername)
router.route('/updateAvatar').post(updateAvatar)
router.route('/deleteUser/:id').get(deleteUser)
router.route('/changePassword').put(changePassword)
router.route('/users').get(getUsers)

