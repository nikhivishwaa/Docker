const express  = require('express');

const app = express()


app.get('/', (req,res)=>{
    res.send("<h1>i am working inside container</h1>")
})

const port = process.env.PORT || 8000;


app.listen(port, () => {
  console.log(`node app listening on port ${port}`)
})