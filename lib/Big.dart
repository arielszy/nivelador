Agregar notifylesteners a la clase with changenotifier

Agregar el if al consumer para ver cuando se completa el build



Map<String, String> listMapToMap(List<Generos> listaGeneros){


Map<String, String> mapaGeneros={};
for (var i =0; i>=; i++){
mapaGeneros.addAll({ListaGeneros[i]['id']:ListaGeneros[i]['name']});
}



Mapa = Map.fromIterable(listaGeneros,
            key: (e) => e['id'], value: (e) => e['name']);
       
      }






Print(mapaGeneros);
Return mapaGeneros;

}

