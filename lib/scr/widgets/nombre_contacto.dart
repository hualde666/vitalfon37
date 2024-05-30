import 'package:flutter/material.dart';
import 'package:piproy/scr/models/contactos_modelo.dart';

Widget nombreContacto(
    BuildContext context, ContactoDatos contacto, String tipo) {
  //final ancho = MediaQuery.
  return Container(
    //color: Colors.blue,
    // height: 64,
    // width: ancho,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          contacto.nombre,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 35.0,
          ),
        ),
        tipo == 'MPA'
            ? Text(
                'Llamar',
                style: TextStyle(fontSize: 25),
              )
            : tipo == 'MPB'
                ? Text(
                    'Whatsapp',
                    style: TextStyle(fontSize: 25),
                  )
                : Text(
                    '',
                  ),
      ],
    ),
  );
}
