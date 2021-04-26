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
    this.director,
  });

  String titulo;
  String tituloOriginal;
  String urlPortada;
  String urlAvatar;
  List generos;
  String descripcion;
  String fechaDeLanzamiento;
  String puntaje;
  String id;
  String director;

  factory Pelicula.armar(Map datos) {
    final titulo = datos['title'];
    final urlPortada = 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2' +
        datos[
            'poster_path']; // url base donde estan las imagenes + el nombre del archivo
    final urlAvatar = 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2' +
        datos['backdrop_path'];
    final generos = datos['genre_ids'];
    final descripcion = datos['overview'];
    final fechaDeLanzamiento = datos['release_date'].toString();
    final puntaje = datos['vote_average'].toString();
    final id = datos['id'].toString();
    final tituloOriginal = datos['original_title'];
    final director = '';

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
      director: director,
    );
  }
}
