const exprees = require('express');
const app = express();

app.use((req, res, next) => {
    res.status(200).send({
        mensagem: 'OK, eu certo'
    });
});

module.exports = app;