import express from 'express';
export const musicRouter=express.Router();

import {addMusic,getCateg} from '../controllers/music.js'

musicRouter.route('/add').post(addMusic)
musicRouter.route('/categ').get(getCateg)