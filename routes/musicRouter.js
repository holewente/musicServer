import express from 'express';
export const musicRouter=express.Router();

import {addMusic,getCateg,getUrl} from '../controllers/music.js'

musicRouter.route('/add').post(addMusic)
musicRouter.route('/categ').get(getCateg)
musicRouter.route('/url').get(getUrl)