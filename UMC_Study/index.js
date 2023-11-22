// index.js
//const express = require('express');
import express from 'express';
import { tempRouter } from '../UMC_Study/src/routes/temp.route.js';

const app = express();
const port = 3000;

// router setting
app.use('/temp', tempRouter);

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
});



//에러 핸들링 실습

// router setting
app.use('/temp', tempRouter);

// error handling
app.use((err, req, res, next) => {
    console.error(err.stack)
    res.status(500).send(err.stack);
});

app.listen(port, () => {
		console.log(`Example app listening on port ${port}`);
});

app.use((err, req, res, next) => {
    // 템플릿 엔진 변수 설정
    res.locals.message = err.message;   
    // 개발환경이면 에러를 출력하고 아니면 출력하지 않기
    res.locals.error = process.env.NODE_ENV !== 'production' ? err : {}; 
    res.status(err.data.status).send(response(err.data));
});