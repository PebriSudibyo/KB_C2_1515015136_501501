DOMAINS
Nama = symbol /*Domains Nama = symbol merupakan domains yang menyatakan suatu jenis variabel,
diperkuat dengan fungsi sebagai symbol */

PREDICATES
nondeterm ayah(nama,nama)
kakek(nama,nama)
nondeterm saudara_kandung(nama,nama)
nondeterm cucu(nama,nama)
nondeterm keponakan(nama,nama)
CLAUSES 
ayah(joko,mukmin).
ayah(joko,jhonatan).
ayah(mukmin,iqbal).
ayah(mukmin,aziz).
ayah(jhonathan,riko).
saudara_kandung(mukmin,jhonatan).
saudara_kandung(iqbal,aziz).
cucu(iqbal,joko).
cucu(aziz,joko).
cucu(riko,joko).
keponakan(iqbal,jhonatan).
keponakan(aziz,jhonatan).
keponakan(riko,mukmin).

%ATURANNYA%
kakek(Kakek,Cucu):-ayah(Ayah,Cucu),ayah(Kakek,Ayah).

GOAL
ayah(mukmin,Mukmin_ayah),nl,
ayah(Ayah_riko,riko),nl,
saudara_kandung(Saudara_Kandung_Aziz,aziz),nl,
cucu(Cucu_joko,joko),nl,
keponakan(Keponakan_jhonatan,jhonatan).