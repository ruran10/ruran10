const path = require('path');
require('dotenv').config({ path: path.resolve(__dirname, '../../.env') }); // Carrega o .env na raiz do projeto
const app = require('./app');
const db = require('../../database/db'); // Isso força o Node a rodar a conexão

const PORT = 3000;

app.listen(PORT, () => {
    console.log(`Servidor rodando em http://localhost:${PORT}`);
});