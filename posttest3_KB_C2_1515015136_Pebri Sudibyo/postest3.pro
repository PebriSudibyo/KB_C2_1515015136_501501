domains
 kb,pde,so = symbol

predicates
  nondeterm nilai(kb,pde,so)

clauses
  
  nilai("Irfan","Intelejen Buatan","A").
  nilai("Komeng","Intelejen Buatan","D").
  nilai("Dati","Intelejen Buatan","C").
  nilai("Fatima","Intelejen Buatan","B").
  nilai("Maspion","Intelejen Buatan","C").
  
  nilai("Ricky","PDE","E").
  nilai("Embang","PDE","A").
  nilai("Salmin","PDE","D").
  nilai("Vina","PDE","B").
  nilai("Sondang","PDE","C").
  
  nilai("Pamuji","Sistem Operasi","D").
  nilai("Luki","Sistem Operasi","E").
  nilai("Sadek","Sistem Operasi","B").
  nilai("Yusida","Sistem Operasi","A").
  nilai("Eka","Sistem Operasi","A").
  
goal
  nilai(Nama,"Intelejen Buatan",_);            
  nilai(Tidak_Lulus,_,Nilai), Nilai>"C";      
  nilai(Lulus,_,Nilai), Nilai<"D";             
  nilai(_,Matkul,_);                          
  nilai(Mahasiswa,_,_).                 