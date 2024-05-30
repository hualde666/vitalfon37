import 'dart:typed_data';

class ItemListaEmergencia {
  final String idcontacto;
  final String nombre;
  final Uint8List avatar;
  // int iListaContacto;
  final String initials;
  final String phone;
  final bool check;
  ItemListaEmergencia(
      {required this.idcontacto,
      required this.nombre,
      required this.avatar,
      required this.initials,
      required this.phone,
      required this.check});
}
