SELECT * FROM umkm_jabar;

-- 1. Berapa jumlah baris dari umkm_jabar
SELECT COUNT(*) AS jumlah_baris
FROM umkm_jabar;

-- 2. Berapa jumlah usaha di kabupaten bekasi pada tahun 2017
SELECT nama_kabupaten_kota, tahun, SUM(jumlah_umkm) AS jumlah_umkm_kabbekasi
FROM umkm_jabar
WHERE nama_kabupaten_kota = "KABUPATEN BEKASI" AND tahun = 2017;

-- 3. Bagaimana tren jumlah umkm di kabupaten karawang dari tahun 2017 s.d. 2021?
SELECT tahun, SUM(jumlah_umkm) AS jumlah_umkm_kabupaten_karawang
FROM umkm_jabar
WHERE nama_kabupaten_kota = "KABUPATEN KARAWANG" AND tahun >= 2017 AND tahun <= 2021
GROUP BY tahun;

-- 4. Berapa jumlah rata-rata umkm setiap kategori usaha per kabupaten/kota di Jabar tahun 2021?
SELECT kategori_usaha, AVG(jumlah_umkm) AS rerata_tahun_2021
FROM umkm_jabar
WHERE tahun = 2021
GROUP BY kategori_usaha
ORDER BY rerata_tahun_2021;

-- 5. Nilai minimum dan maksimum dari kolom jumlah_umkm
SELECT MIN(jumlah_umkm), MAX(jumlah_umkm)
FROM umkm_jabar;

-- 6. kabupaten atau kota apa yang memiliki jumlah umkm kurang dari 100.000 pada tahun 2020?
SELECT nama_kabupaten_kota, SUM(jumlah_umkm) AS jumlah_umkm_2020
FROM umkm_jabar
WHERE tahun = 2020
GROUP BY nama_kabupaten_kota
HAVING jumlah_umkm_2020 <100000;