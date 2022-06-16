const express = require("./node_modules/express");
const app = express();

app.get("/" , function(req, res){
    res.sendFile(__dirname + /caminhosdosol_);
})

app.listen(9091, function(){
    console.log("Servidor rodando na URL http://localhost:9091");
});