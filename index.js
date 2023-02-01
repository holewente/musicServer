import express from 'express';
import mysql from 'mysql';
import cors from 'cors';
import {configDB} from './configDB.js';

const db=mysql.createConnection(configDB)
const app=express()
app.use(express.json())
app.use(cors())