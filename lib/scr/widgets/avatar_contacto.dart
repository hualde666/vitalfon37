import 'package:flutter/material.dart';

import '../models/contactos_modelo.dart';

class AvatarContacto extends StatelessWidget {
  const AvatarContacto(this.contacto);
//final Uint8List avatart = this.contacto.avatar;
  final ContactoDatos contacto;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110,
        width: 110,
        child: Center(
          child: contacto.avatar!.length == 0
              ? CircleAvatar(
                  radius: 100,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: Text(
                    contacto.iniciales.isNotEmpty
                        ? contacto.iniciales
                        : contacto.nombre.substring(0),
                    style: TextStyle(
                        fontSize: 30, color: Theme.of(context).primaryColor),
                  ),
                )
              : CircleAvatar(
                  radius: 100,
                  backgroundImage: MemoryImage(contacto.avatar!, scale: 0.5),
                ),
        ));
  }
}
