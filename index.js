// index.js
const express = require('express');
const app = express();
const port = 3000;


app.use(express.json()); 


const seriesFilmRoutes = require('./routes/seriesFilmRoutes.js');


app.use('/api/movies', seriesFilmRoutes); 



app.listen(port, () => {
  console.log(`Server berjalan di http://localhost:${port}`);
  console.log('API Endpoint aktif:');
  console.log('  /api/movies');
});