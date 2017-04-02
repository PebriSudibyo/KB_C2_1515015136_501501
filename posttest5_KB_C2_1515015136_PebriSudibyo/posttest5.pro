/*CREATED BY PEBRI SUDIBYO (1515015136) */



PREDICATES

  pengen(symbol,symbol) - nondeterm (i,o)
  merek(symbol,symbol) - nondeterm (i,i)
  handphone(symbol) -  nondeterm (o)
 
 
CLAUSES

pengen(pebri,Hp):- handphone(Hp), merek(Hp,s8).

merek(samsung,s8).
merek(nokia,n70).
merek(advan,s5l).
merek(vivo,s8).
merek(samsung,a5).

handphone(samsung).
handphone(nokia).
handphone(vivo).
handphone(advan).


GOAL

pengen(pebri,Beli_HP).
