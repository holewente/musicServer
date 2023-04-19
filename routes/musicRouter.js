import express from 'express';
export const musicRouter=express.Router();

import {addMusic,getCateg,getUrl,deleteMusic,getMusic} from '../controllers/music.js'

musicRouter.route('/add').post(addMusic)
musicRouter.route('/categ').get(getCateg)
musicRouter.route('/url').get(getUrl)
musicRouter.route('/deleteMusic/:url').get(deleteMusic)
musicRouter.route('/library').get(getMusic)