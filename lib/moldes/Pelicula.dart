//molde para el listado de peliculas traido de la api
class Pelicula {
  Pelicula({
    this.titulo,
    this.tituloOriginal,
    this.urlPortada,
    this.urlAvatar,
    this.generos,
    this.descripcion,
    this.fechaDeLanzamiento,
    this.puntaje,
    this.id,
    this.isFav,
  });

  String titulo;
  String tituloOriginal;
  String urlPortada;
  String urlAvatar;
  String generos;
  String descripcion;
  String fechaDeLanzamiento;
  String puntaje;
  String id;
  bool isFav;

  factory Pelicula.armar({Map datos, Map generosId}) {
    //recibe los datos traidos de la api y crea el objeto.
    String base =
        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2'; // url base donde estan las imagenes
    final titulo = datos['title'] ?? 'sin datos';
    final urlPortada =
        datos['poster_path'] != null ? base + datos['poster_path'] : '';
    final urlAvatar =
        datos['backdrop_path'] != null ? base + datos['backdrop_path'] : '';
    final generos = generosPorId(datos['genre_ids'], generosId);
    final descripcion = datos['overview'] != null && datos['overview'] != ''
        ? datos['overview']
        : 'sin datos';
    final fechaDeLanzamiento = datos['release_date'].toString().length > 1
        ? datos['release_date'].toString().substring(0, 4)
        : 'sin datos'; //corta el texto y manda solo los primeros 4 caracteres
    final puntaje = datos['vote_average'].toString() ?? 'sin datos';
    final id = datos['id'].toString() ?? 'sin datos';
    final tituloOriginal = datos['original_title'] ?? 'sin datos';
    bool isFav = false;

    // si datos en la key indicada es null ?? le asigna ''

    return Pelicula(
      titulo: titulo,
      urlPortada: urlPortada,
      urlAvatar: urlAvatar,
      generos: generos,
      descripcion: descripcion,
      fechaDeLanzamiento: fechaDeLanzamiento,
      puntaje: puntaje,
      id: id,
      tituloOriginal: tituloOriginal,
      isFav: isFav,
    );
  }
}

String generosPorId(List ids, Map generosId) {
  var generos;
  String result;
  if (ids.isNotEmpty) {
    generos = ids
        .map((id) => generosId[id])
        .toList(); //crea la lista de generos reeplazando el id por el nombre
    result = generos
        .map((val) => val.trim())
        .join(', '); //convierte la lista de strings en un solo string
    return result;
  } else {
    return 'sin datos';
  }
}
