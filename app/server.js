require('dotenv').config();
const express = require('express');
const axios = require('axios');
const path = require('path');
const app = express();
const os = require('os');
const fs = require('fs');

const PORT = process.env.PORT || 80;
const API_KEY = process.env.API_KEY;

app.get('/', (req, res) => {
  const hostname = os.hostname();
  fs.readFile(path.join(__dirname, 'public', 'index.html'), 'utf8', (err, data) => {
    if (err) return res.status(500).send('Error cargando HTML');
    const html = data.replace('{{hostname}}', hostname);
    res.send(html);
  });
});


app.get('/api/stock/:symbol', async (req, res) => {
  const symbol = req.params.symbol.toUpperCase();
  try {
    const url = `https://www.alphavantage.co/query`;
    const response = await axios.get(url, {
      params: {
        function: 'GLOBAL_QUOTE',
        symbol,
        apikey: API_KEY,
      },
    });
    res.json(response.data);
  } catch (err) {
    res.status(500).json({ error: 'Error consultando el API' });
  }
});

app.listen(PORT, () => {
  console.log(`Servidor ejecutándose en http://localhost:${PORT}`);
});
