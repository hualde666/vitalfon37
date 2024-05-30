import 'package:flutter/services.dart';

class ContactoDatos {
  final String nombre;
  final String telefono;
  final String whatsapptel;
  final Uint8List? avatar;
  final String iniciales;
// foto contacto
  ContactoDatos(this.nombre, this.telefono, this.whatsapptel, this.avatar,
      this.iniciales);
}
