//molde para el listado de generos traido de la api
//los traigo por las dudas que haya algun cambio

class Generos {
  Generos({
    this.nombre,
    this.id,
  });

  String nombre;
  String id;

  factory Generos.armar(Map datos) {
    final nombre = datos['name'];
    final id = datos['id'].toString();

    return Generos(
      nombre: nombre,
      id: id,
    );
  }
}
