// server.js
const express = require('express');
const path = require('path');

const app = express();
const port = process.env.PORT || 3000;

// Serve os arquivos estáticos do Flutter Web
app.use(express.static(path.join(__dirname, 'build', 'web')));

// Redireciona qualquer rota para o index.html (para suporte a rotas do Flutter)
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'build', 'web', 'index.html'));
});

app.listen(port, () => {
  console.log(`Flutter Web app is running on http://localhost:${port}`);
});
