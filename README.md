# Soal Shift Modul 1 SISOP
# 1
Hal pertama yang dilakukan adalah extract file nature.zip dengan command “unzip nature.zip”. Kemudian untuk setiap file .jpg yang ada, dilakukan decrypt dengan command base64 -d. Karena hasil decrypt merupakan suatu bilangan Hexadecimal, maka perlu diubah dengan command “xxd -r” (xxd sendiri merupakan kebalikan dari hexdump yang berfungsi untuk mengubah suatu konten file menjadi hexadecimal, octal, ASCII dan decimal. )

Kemudian juga perlu menambahkan schedule baru pada crontab. Format nya yaitu “14 14 14 2 *  bash /home/somi/Documents/SISOP/shift1/nature/soal1.sh”. Hal ini menunjukkan bahwa akan di-bash soal1.sh pada tanggal 14 Februari jam 14.14. Selain itu ditambahkan juga schedule “0 0 * 2 fri bash /home/somi/Documents/SISOP/shift1/nature/soal1.sh”. Ini menunjukkan bahwa selain pada tanggal 14 Februari, soal1.sh juga akan di-bash pada setiap hari Jumat pada bulan Februari.

# 2
Karena pada file setiap kolom dipisahkan oleh koma, maka perlu dipisah dahulu setiap kolomnya menggunakan fungsi split. 
Setelah itu, dicari total quantity dari setiap negara pada tahun 2012 dengan memasukkan setiap quantity dari satu negara ke dalam array “quantity”.Kemudian dari setiap anggota array quantity, dicari nilai yang paling besar dengan membandingkan semua anggota dari array quantity, dan ditampilkan beserta indexnya ( nama negaranya )

Untuk mencari tiga product line dengan quantity terbanyak, maka setiap perlu menambahkan quantity untuk setiap product linenya. Hal ini berlaku untuk setiap product line dengan negara United States dan dijual pada tahun 2012.  Kemudian setiap quantity dari product line dimasukkan ke array “productline”. 

Untuk mencari tiga productline, pertama diinisialisasikan 6 variabel, tiga untuk jumlah quantity (prod1, prod2, prod3) , dan tiga untuk nama productline (maxprod1, maxprod2, maxprod3). Kemudian untuk setiap nilai anggota array productline dibandingkan. 

Sama dengan langkah-langkah sebelumnya, untuk mencari product dengan quantity terbanyak, perlu menambahkan setiap quantity untuk productnya. Kemudian setiap product dimasukkan ke sebuah array yang bernama product. Product yang ditambahkan hanya berlaku untuk product dengan negara dari poin a (“United States”) , product line dari poin b (“Personal accessories, Camping Equipment, Outdoor protection), dan tahun 2012. Kemudian setiap anggota array product dibandingkan sehingga didapat tiga product dengan quantity terbanyak.

# 3
Hal yang dilakukan pertama kali yaitu menghitung sekaligus memasukkan isi file password.txt kedalam array (count). Hal ini berguna untuk menentukan file keberapa ketika sebuah password terbuat. Selain itu juga bisa untuk membandingkan setiap password agar tidak ada yang sama. 

Untuk generate password sendiri menggunakan command ini :
pass=`head /dev/urandom | tr -dc A-Za-z0-9 | head -c 12`

Urandom digunakan untuk meng-generate sembarang karakter. Namun karena output yang dihasilkan berupa pseudorandom number, maka perlu diterjemahkan (translate) ke karakter. Maka diperlukan command tr. Tr akan menerjemahkannya kedalam huruf atau angka. Karena kita hanya memerlukan 12 karakter, maka ditambahkan head -c 12.

Setelah password baru terbentuk, dilakukan looping untuk melihat apakah ada password yang ada sebelumnya. Jika ada, maka dilakukan generate lagi. Jika tidak, maka password akan dimasukkan ke file password[i].txt dengan I adalah indeks yang ada.

# 4
Tahap pertama yaitu kami mengubah isi dari /var/syslog kedalam bentuk ASCII. Hal ini akan mempermudah untuk penamaan pada file backup. Awalnya, konten dari /var/log/syslog diubah ke bentuk plain hexdump. Kemudian dengan fungsi hex2dec, bilangan hexadecimal diubah ke bentuk decimal. Untuk penamaan dengan huruf uppercase (decimal antara 65 sampai 90), pertama mengurangi bilangan decimal dan 65. Kemudian penjumlahan antara bilangan decimal dengan jam dimodulus 26 ( karena alfabet terdiri dari 26 huruf ), dan dijumlahkan kembali dengan 65 untuk menentukan ASCII nya.  Pada Lowercase (decimal antrara 97 dan 122) hampir sama, perbedaanya hanya bilangan decimal dikurangi dan ditambah dengan 97. Backup akan disimpan dengan nama “$date.log” dimana date adalah jam:menit tanggal-bulan-tahun.

Untuk dekripsinya sendiri, hampir sama dengan enkripsinya, hanya berbeda ketika dilakukan mod dengan 26, bilangan decimal akan dikurangi dengan jam. Terjadi kondisi tambahan juga, ketika setelah dilakukan mod hasilnya negatif,, maka bilangan decimal ditambahkan dengan 26. 

Schedule baru juga ditambahkan di crontab dengan format 0 * * * * bash /home/somi/Documents/SISOP/shift1/soal4.sh. Hal ini menunjukkan bahwa soal4.sh ( bash script untuk backup dan enkripsi) akan di-bash setiap jamnya. 

# 5
Input berasal dari isi file /var/log/syslog. Isinya diubah ke dalam bentuk lowercase terlebih dahulu. Jika ada record dengan jumlah field kurang dari 13 ( menggunakan variable NF) , tidak mengandung string “sudo” dan mengandung string “cron” (menggunakan fungsi match), maka record akan diprint ke file log yang berada di direktori /home/somi/modul1/syslog.

Schedule baru juga ditambahkan dengan format 2-30/6 * * * * bash /home/somi/Documents/SISOP/shift1/soal5.sh. Hal ini menunjukkan bahwa file soal 5.sh akan di-bash setiap 6 menit dari menit ke 2 sampai 30. 

