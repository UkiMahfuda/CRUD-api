const express = require("express");
const app = express();
const port = 3000;
const bodyParser = require("body-parser");
const db = require("./config.js");
const response = require("./response.js");

db.connect((err) => {
  if (err) {
    console.error("Database gagal:", err);
    return;
  }
  console.log("Connection Database Success");
});

app.use(bodyParser.json());

//Menampilkan data di tabel
app.get("/barang", (req, res) => {
  const sql = "SELECT*FROM tbl_brg";
  db.query(sql, (error, result) => {
    response(200, result, "data barang", res);
  });
});

app.get("/ruangan", (req, res) => {
  const sql = "SELECT*FROM tbl_ruangan";
  db.query(sql, (error, result) => {
    response(200, result, "data ruangan", res);
  });
});

app.get("/peminjaman", (req, res) => {
  const sql = "SELECT*FROM tbl_peminjaman";
  db.query(sql, (error, result) => {
    response(200, result, "data peminjaman", res);
  });
});

//menampilkan data berdasarkan id
app.get("/barang/:id_brg", (req, res) => {
  const { id_brg } = req.params;
  const sql = `SELECT*FROM tbl_brg WHERE id_brg = '${id_brg}'`;
  db.query(sql, (err, result) => {
    if (err) throw err;
    response(200, result, `Get detail Barang`, res);
  });
});

app.get("/ruangan/:id_ruang", (req, res) => {
  const { id_ruang } = req.params;
  const sql = `SELECT*FROM tbl_ruangan WHERE id_ruang = '${id_ruang}'`;
  db.query(sql, (err, result) => {
    if (err) throw err;
    response(200, result, `Get detail Ruangan`, res);
  });
});

app.get("/peminjaman/:id", (req, res) => {
  const { id } = req.params;
  const sql = `SELECT*FROM tbl_peminjaman WHERE id = '${id}'`;
  db.query(sql, (err, result) => {
    if (err) throw err;
    response(200, result, `Get detail Peminjaman`, res);
  });
});

//menambahkan data baru di tabel
app.post("/barang", (req, res) => {
  const { id_brg, nama_brg, jumlah_ketersediaan } = req.body;
  const sql = `INSERT INTO tbl_brg (id_brg, nama_brg, jumlah_ketersediaan) VALUES ('${id_brg}','${nama_brg}','${jumlah_ketersediaan}');`;
  db.query(sql, (error, fields) => {
    if (error) response(500, "invalid", `Barang Gagal ditambahkan`, res);
    if (fields?.affectedRows) {
      const data = {
        isSucces: fields.affectedRows,
        id: fields.insertId,
      };
      response(200, data, `Data barang ${nama_brg} berhasil ditambahkan`, res);
    }
  });
});

app.post("/ruangan", (req, res) => {
  const { id_ruang, nama_ruang, kap_ruangan, gedung } = req.body;
  const sql = `INSERT INTO tbl_ruangan (id_ruang, nama_ruang, kap_ruangan, gedung) VALUES ('${id_ruang}','${nama_ruang}','${kap_ruangan}','${gedung}');`;
  db.query(sql, (error, fields) => {
    if (error) response(500, "invalid", `Barang Gagal ditambahkan`, res);
    if (fields?.affectedRows) {
      const data = {
        isSucces: fields.affectedRows,
        id: fields.insertId,
      };
      response(200, data, `Data ruangan ${nama_ruang} berhasil ditambahkan`, res);
    }
  });
});

app.post("/peminjaman", (req, res) => {
  const { id, id_ruang, id_brg, nama, npm, lama_pinjam, alasan } = req.body;
  const sql = `INSERT INTO tbl_peminjaman ( id, id_ruang, id_brg, nama, npm, lama_pinjam, alasan) VALUES ('${id}','${id_ruang}','${id_brg}','${nama}','${npm}','${lama_pinjam}','${alasan}');`;
  db.query(sql, (error, fields) => {
    if (error) response(500, "invalid", `Peminjaman Gagal ditambahkan`, res);
    if (fields?.affectedRows) {
      const data = {
        isSucces: fields.affectedRows,
        id: fields.insertId,
      };
      response(200, data, `Data peminjaman ${nama} berhasil ditambahkan`, res);
    }
  });
});

app.listen(port, () => {
  console.log(`Runing in port ${port}`);
});
