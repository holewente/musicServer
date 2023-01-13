import express from 'express';
export const adminRouter=express.Router();

import {books} from '../controllers/admin.js'

adminRouter.route('/books').get(books)