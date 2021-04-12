//molde para el listado de peliculas traido de la api

class Pelicula {
  Pelicula({
    this.titulo,
    this.urlPortada,
    this.urlAvatar,
    this.generos,
    this.descripcion,
    this.fechaDeLanzamiento,
    this.puntaje,
    this.id,
  });

  String titulo;
  String urlPortada;
  String urlAvatar;
  List generos;
  String descripcion;
  String fechaDeLanzamiento;
  String puntaje;
  String id;

  factory Pelicula.armar(Map datos) {
    final titulo = datos['title'];
    final urlPortada = datos['poster_path'];
    final urlAvatar = datos['backdrop_path'];
    final generos = datos['genre_ids'];
    final descripcion = datos['overview'];
    final fechaDeLanzamiento = datos['release_date'].toString();
    final puntaje = datos['vote_average'].toString();
    final id = datos['id'].toString();

    return Pelicula(
      titulo: titulo,
      urlPortada: urlPortada,
      urlAvatar: urlAvatar,
      generos: generos,
      descripcion: descripcion,
      fechaDeLanzamiento: fechaDeLanzamiento,
      puntaje: puntaje,
      id: id,
    );
  }
}
