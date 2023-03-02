class Denuncia {
  //DENUNCIANTE
  var curp1;
  var nombre1;
  var sexo1;
  var calle1;
  var nointerior1;
  var noexterior1;
  var colonia1;
  var municipio1;
  var estado1;
  //DENUNCIADO
  var nombre2;
  var sexo2;
  var calle2;
  var nointerior2;
  var noexterior2;
  var colonia2;
  var municipio2;
  var estado2;

//DATOS DE LA DENUNCIA
  var tipo;
  var descripciontipo;
  var fecha;
  var hora;

  var calle_hechos;
  var entre_calle_hechos1;
  var entre_calle_hechos2;
  var ubicacion_actual_hechos;
  var narrativa_denuncia;
  List<String>? testigos = [];
  List<String>? imagepath = [];
  bool anonima;
  String? telefono_denunciante;
  String? correo_denunciante;
  Denuncia(
      //datos denunciante
      {this.curp1,
      this.nombre1,
      this.sexo1,
      this.calle1,
      this.nointerior1,
      this.noexterior1,
      this.colonia1,
      this.municipio1,
      this.estado1,
      //datos denunciado
      this.nombre2,
      this.sexo2,
      this.calle2,
      this.nointerior2,
      this.noexterior2,
      this.colonia2,
      this.municipio2,
      this.estado2,
      //datos denuncia
      this.tipo,
      this.descripciontipo,
      this.fecha,
      this.hora,
      this.calle_hechos,
      this.entre_calle_hechos1,
      this.entre_calle_hechos2,
      this.ubicacion_actual_hechos,
      this.narrativa_denuncia,
      this.testigos,
      this.imagepath,
      required this.anonima,
      this.telefono_denunciante,
      this.correo_denunciante});
  void setSecondDatas(
      String? tipo,
      descripciontipo,
      fecha,
      hora,
      calle_hechos,
      entre_calle_hechos1,
      entre_calle_hechos2,
      ubicacion_actual_hechos,
      narrativa_denuncia,
      testigos,
      imagepath,
      anonima,
      telefono_denunciante,
      correo_denunciante) {
    this.tipo = tipo;
    this.descripciontipo = descripciontipo;
    this.fecha = fecha;
    this.hora = hora;
    this.calle_hechos = calle_hechos;
    this.entre_calle_hechos1 = entre_calle_hechos1;
    this.entre_calle_hechos2 = entre_calle_hechos2;
    this.ubicacion_actual_hechos = ubicacion_actual_hechos;
    this.narrativa_denuncia = narrativa_denuncia;
    this.testigos = testigos;
    this.imagepath = imagepath;
    this.anonima = anonima;
    this.telefono_denunciante = telefono_denunciante;
    this.correo_denunciante = correo_denunciante;
  }
}
