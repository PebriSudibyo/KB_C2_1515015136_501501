DOMAINS
nama,jender,pekerjaan,benda,alasan,zat = symbol
umur=integer

PREDICATES
nondeterm orang(nama, umur, jender, pekerjaan)
nondeterm selingkuh(nama, nama)
terbunuh_dengan(nama, benda)
terbunuh(nama)
nondeterm pembunuh(nama)
motif(alasan)
ternodai(nama, zat)
milik(nama, benda)
nondeterm cara_kerja_mirip(benda, benda)
nondeterm kemungkinan_milik(nama, benda)
nondeterm dicurigai(nama)

/* * * Fakta-fakta tentang pembunuhan * * */

CLAUSES
orang(budi,55,m,tukang_kayu).
orang(aldi,25,m,pemain_sepak_bola).
orang(aldi,25,m,tukang_jagal).
orang(joni,25,m,pencopet).
selingkuh(ina,joni).
selingkuh(ina,budi).
selingkuh(siti,joni).
terbunuh_dengan(siti,pentungan).
terbunuh(siti).
motif(uang).
motif(cemburu).
motif(dendam).
ternodai(budi, darah).
ternodai(siti, darah).
ternodai(aldi, lumpur).
ternodai(joni, coklat).
ternodai(ina, coklat).
milik(budi,kaki_palsu).
milik(joni,pistol).

/* dari fakta-fakta yang ada telah ditentukann bahwa terdapat beberapa orang yaitu budi,aldi, dan joni, dengn pekerjaan budi sebagai tukang kayu , aldi dengan pekerjaan sebagai
pemain sepak bola da tukang jegal, dan jono dengan pekerjaan sebagai pencopet. fakta selingkuh bahwa ini selingkuh dengan joni , ina selingkuh dengan budi , dan siti setingkuh dengan
joni. dari fakta juga di jelaskan bahwa siti terbunuh dengan pentungan dengan beberapa motif pembunuhan yaitu karena uang, cemburu, dan dendam, sedangkan pada fakta ternodai bahwa budi
ternodai dengan darah , siti ternodai darah, aldi ternodai lumpur, joni ternodai coklat, ina ternodai coklat, dan juga disebutkan bahwa budi memiliki kaki palsu, dan joni memiliki pistol.*/


/* * * Basis Pengetahuan * * */

cara_kerja_mirip(kaki_palsu, pentungan).  /* kaki palsu kerjanya mirip pentungan */
cara_kerja_mirip(balok, pentungan). /* balok kerja nya seperti pentungan */
cara_kerja_mirip(gunting, pisau). /* gunting kerjanya seperti pisau */
cara_kerja_mirip(sepatu_bola, pentungan). /*sepatu bola kerjanya seperti pentungn*/
kemungkinan_milik(X,sepatu_bola):-
orang(X,_,_,pemain_sepak_bola). /* kemungkinan jika X memiliki sepatu bola , X adalah pemain sepak bola*/
kemungkinan_milik(X,gunting):-
orang(X,_,_,pekerja_salon). /* kemungkinan jika X memiliki gunting , X adalah orang yang bekerja disalon */
kemungkinan_milik(X,Benda):-
milik(X,Benda).
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai semua orang yang memiliki senjata yang *
* kerjanya mirip dengan senjata penyebab siti terbunuh. *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-
terbunuh_dengan(siti,Senjata) ,
cara_kerja_mirip(Benda,Senjata) ,
kemungkinan_milik(X,Benda). /* dicurigai X jika terbunuhnya siti dengan benda dan benda bekerja seperti senjata dan X memiliki Benda */
/* * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai laki-laki yang selingkuh dengan siti. *
* * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-
motif(cemburu),
orang(X,_,m,_),
selingkuh(siti,X).  /* disurigai X jika motif karena cemburu dan X adalah orang dengan jender m dan siti selingkuh dengan X */
/* * * * * * * * * * * * * * * * * * * * * * *
* dicurigai perempuan yang selingkuh dengan *
* laki-laki yang juga selingkuh dengan siti *
* * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-
motif(cemburu),
orang(X,_,f,_),
selingkuh(X,Lakilaki),
selingkuh(siti,Lakilaki). /* X dicurigai adalah orang berjenis kelamin perempuan
/* * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai pencopet yang mempunyai motif uang. *
* * * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-
motif(uang),
orang(X,_,_,pencopet).
pembunuh(Pembunuh):-
orang(Pembunuh,_,_,_),
terbunuh(Terbunuh),
Terbunuh <> Pembunuh, /* Bukan bunuh diri */
dicurigai(Pembunuh),
ternodai(Pembunuh,Zat),
ternodai(Terbunuh,Zat).
GOAL
pembunuh(X).

/* dari klausa diatas dapat disimpulkan bahwa  yang terbunuh adalah siti dan siti terbunuh dengan sebuah pentungan dimana dengan tanda bahwa siti ternodai darah dan budi juga ternodai darah
dan dari fakta bahwa budi memiliki kaki palsu dimana cara kerjanya seperti pentungan, dan balok juga kerjanya seperti pentungan, sepatu bola juga bekerja seperti pentungan namun dari pekerjaan
dapat disimpulkan bahwa yang memiliki kaki palsu bekerja sebagai tukang kayu ,sedangkan sepatu bola dimiliki oleh pemain sepakbola , jadi inidikasi pemain sepak bola sebagi pembunuhnya
adalah nihil, dan motif pembunuhan siti dikarenakan cemburu siti selingkuh dengan X, di curigai juga bahwa perempuan yang selingkuh dengan laki-laki yang juga selingkiuh dengan siti ,
= siti terbunuh dengan pentungan , siti terbunuh oleh seseoarang yang memiliki kaki palsu, siti ternodai darah , budi ternodai darah jadi pembunuh siti adalah Budi*/