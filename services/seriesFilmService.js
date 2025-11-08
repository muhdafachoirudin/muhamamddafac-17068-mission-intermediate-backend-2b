const db = require('../config/db.js');

//1. List Semua movie
async function getAllSeriesFilms() {
  const [rows] = await db.query("SELECT * FROM `Series/Film`");
  return rows;
}

//2. Menampilkan satu movie berdasarkan id
async function getSeriesFilmById(id) {
  const [rows] = await db.query("SELECT * FROM `Series/Film` WHERE series_film_id = ?", [id]);
  return rows[0];
}

//3. Mengubah data movie berdasarkan id nya
async function updateSeriesFilm(id, film) {
  const { judul, deskripsi, tahun_rilis, rating, sutradara, poster_vertikal, poster_horizontal, link_thriller, tipe_konten } = film;
  const [result] = await db.query(
    "UPDATE `Series/Film` SET judul = ?, deskripsi = ?, tahun_rilis = ?, rating = ?, sutradara = ?, poster_vertikal = ?, poster_horizontal = ?, link_thriller = ?, tipe_konten = ? WHERE series_film_id = ?",
    [judul, deskripsi, tahun_rilis, rating, sutradara, poster_vertikal, poster_horizontal, link_thriller, tipe_konten, id]
  );
  return result.affectedRows;
}

//4. Menghapus data berdasarkan id
async function deleteSeriesFilm(id) {
  const [result] = await db.query("DELETE FROM `Series/Film` WHERE series_film_id = ?", [id]);
  return result.affectedRows;
}

//5. Menambahkan data movie
async function createSeriesFilm(film) {
  const { judul, deskripsi, tahun_rilis, rating, sutradara, poster_vertikal, poster_horizontal, link_thriller, tipe_konten } = film;
  const [result] = await db.query(
    "INSERT INTO `Series/Film` (judul, deskripsi, tahun_rilis, rating, sutradara, poster_vertikal, poster_horizontal, link_thriller, tipe_konten) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
    [judul, deskripsi, tahun_rilis, rating, sutradara, poster_vertikal, poster_horizontal, link_thriller, tipe_konten]
  );
  return { id: result.insertId, ...film };
}



module.exports = {
  getAllSeriesFilms,
  getSeriesFilmById,
  createSeriesFilm,
  updateSeriesFilm,
  deleteSeriesFilm
};