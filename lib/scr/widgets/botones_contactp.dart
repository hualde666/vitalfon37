import 'package:flutter/material.dart';
import 'package:piproy/scr/models/contactos_modelo.dart';
import 'package:piproy/scr/widgets/icon_conteiner.dart';

Widget botonesContactos(BuildContext context, ContactoDatos contacto) {
  return Container(
      //  height: 220.0,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(50.0),
      ),
      // border: Border.all(color: Theme.of(context).scaffoldBackgroundColor)),
      // width: 330,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botonContacto(
                context,
                contacto,
                'llamada',
                'Llamar',
                Icons.call,
              ),
              SizedBox(
                width: 10,
              ),
              botonContacto(
                context,
                contacto,
                'whatsapp',
                'Whatsapp',
                Icons.circle_outlined,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botonContacto(
                context,
                contacto,
                'mensajeC',
                'Mensajes',
                Icons.message_rounded,
              ),
              SizedBox(
                width: 10,
              ),
              botonContacto(
                context,
                contacto,
                'editar',
                'Ficha',
                Icons.search,
              ),
            ],
          )
        ],
      ));
}

Column botonContacto(BuildContext context, ContactoDatos contacto,
    String accion, String texto, IconData icon) {
  return Column(
    children: [
      Container(
        height: 100,
        width: 100,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          color: Theme.of(context).primaryColor,
        ),
        child: conteinerIcon(
            context,
            Icon(
              icon,
              size: 50.0,
            ),
            accion,
            100,
            contacto),
      ),
      Text(
        texto,
        style: TextStyle(fontSize: 25, color: Theme.of(context).primaryColor),
      )
    ],
  );
}
