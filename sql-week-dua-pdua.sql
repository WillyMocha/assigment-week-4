CREATE TABLE orders
(order_id varchar(20) NOT NULL PRIMARY KEY,
tanggal_order date NOT NULL,
total_bayar int(12) NOT NULL);


CREATE TABLE users
(user_id int(11) NOT NULL PRIMARY KEY,
nama_user varchar(50) NOT NULL);

CREATE TABLE drivers
(driver_id int(11) NOT NULL PRIMARY KEY,
nama_driver varchar(50) NOT NULL,
kendaraan varchar(50) NOT NULL,
no_polisi varchar(8) NOT NULL);

CREATE TABLE order_details
(order_id varchar(20) NOT NULL, 
user_id int(11) NOT NULL,
driver_id int(11) NOT NULL,
jemput text NOT NULL,
tujuan text NOT NULL,
alamat_jemput text NOT NULL,
alamat_tujuan text NOT NULL,
tanggal_jemput datetime NOT NULL,
tanggal_sampai datetime,
jarak decimal(10,2) NOT NULL,
waktu_perjalanan int(11),
PRIMARY KEY (order_id, user_id, driver_id),
CONSTRAINT orderdetails_ibfk_1 FOREIGN KEY (order_id) REFERENCES orders(order_id),
CONSTRAINT orderdetails_ibfk_2 FOREIGN KEY (user_id) REFERENCES users(user_id),
CONSTRAINT orderdetails_ibfk_3 FOREIGN KEY (driver_id) REFERENCES drivers(driver_id));

CREATE TABLE biaya_details
(order_id varchar(20) NOT NULL,
biaya_perjalanan int(12) NOT null, 
jasa_aplikasi int(12) NOT NULL,
media varchar(20) NOT NULL,
dibayar int(12) NOT NULL,
PRIMARY KEY (order_id),
CONSTRAINT biaya_details_ibfk_1 FOREIGN KEY (order_id) REFERENCES orders(order_id));

insert  into orders(order_id,tanggal_order,total_bayar) values ("RB-191274-3068613","2022-12-21","30000");

insert  into users(user_id,nama_user) values (1234,"Balqis Rizki Permata");

insert  into drivers(driver_id,nama_driver,kendaraan,no_polisi) values (5678,"Heryawan","Daihatsu Sigra","Z1830TD");

insert  into order_details(order_id, user_id, driver_id, jemput, tujuan, alamat_jemput, alamat_tujuan, tanggal_jemput, tanggal_sampai, jarak, waktu_perjalanan)
values ("RB-191274-3068613", 1234, 5678, "STIKES MUHAMMADIYAH CIAMIS", "Toko Ujang Haji Jana", "Jl. K. H. Ahmad Dahlan No. 20, Ciamis, Kec. Ciamis, Kabupaten Ciamis, Jawa Barat, 46216, Indonesia"
, "Jl. Otista No. 46, Pawindan, Kec. Ciamis, Kabupaten Ciamis, Jawa Barat, 46218, Indonesia", "2022-12-21 17:09:00", "2022-12-21 17:25:00", "3.0", "16");

insert  into biaya_details(order_id,biaya_perjalanan,jasa_aplikasi,media,dibayar) values ("RB-191274-3068613",26000,4000,"Tunai","30000");
