const express = require('express');
const router = express.Router();
const seriesFilmService = require('../services/seriesFilmService.js');

//1. Menampilkan semua movie
router.get('/', async (req, res) => {
  try {
    const films = await seriesFilmService.getAllSeriesFilms();
    res.json(films);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

//2. Menampilkan satu movie berdasarkan id
router.get('/:id', async (req, res) => {
  try {
    const film = await seriesFilmService.getSeriesFilmById(req.params.id);
    if (film) {
      res.json(film);
    } else {
      res.status(404).json({ message: 'Film tidak ditemukan' });
    }
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});


//3. Mengubah data movie berdasarkan idnya
router.patch('/:id', async (req, res) => {
  try {
    const affectedRows = await seriesFilmService.updateSeriesFilm(req.params.id, req.body);
    if (affectedRows > 0) {
      res.json({ message: 'Film berhasil diupdate' });
    } else {
      res.status(404).json({ message: 'Film tidak ditemukan' });
    }
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

//4. Menghapus data berdasarkan id
router.delete('/:id', async (req, res) => {
  try {
    const affectedRows = await seriesFilmService.deleteSeriesFilm(req.params.id);
    if (affectedRows > 0) {
      res.json({ message: 'Film berhasil dihapus' });
    } else {
      res.status(404).json({ message: 'Film tidak ditemukan' });
    }
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

//5. Menambahkan data movie
router.post('/', async (req, res) => {
  try {
    const newFilm = await seriesFilmService.createSeriesFilm(req.body);
    res.status(201).json(newFilm);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});


module.exports = router;