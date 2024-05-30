import 'package:flutter/material.dart';
import 'package:piproy/scr/models/api_tipos.dart';
import 'package:piproy/scr/models/contactos_modelo.dart';
import 'package:piproy/scr/providers/aplicaciones_provider.dart';
import 'package:piproy/scr/providers/db_provider.dart';
import 'package:provider/provider.dart';

Future<dynamic> agregarMPA(BuildContext context, ContactoDatos contacto) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(contacto.nombre,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
          )),
      content: Text('¿Agregar este contacto al menu principal cómo ?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          )),
      elevation: 14.0,
      actionsPadding: EdgeInsets.symmetric(horizontal: 30.0),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actionsOverflowDirection: VerticalDirection.down,
      actions: [
        ElevatedButton(
            onPressed: () {
              final grupo = 'MPA';
              final nuevo = new ApiTipos(
                  grupo: grupo, nombre: contacto.nombre, tipo: '1');
              if (Provider.of<AplicacionesProvider>(context, listen: false)
                  .agregarMenu(grupo + contacto.nombre)) {
                DbTiposAplicaciones.db.nuevoTipo(nuevo);
              }
              Navigator.pop(context);
            },
            child: Container(
              width: 300,
              child: Center(
                child: Text(
                  'Discado Rapido',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )),
        ElevatedButton(
            onPressed: () {
              final grupo = 'MPB';
              final nuevo = new ApiTipos(
                  grupo: grupo, nombre: contacto.nombre, tipo: '1');

              if (Provider.of<AplicacionesProvider>(context, listen: false)
                  .agregarMenu(grupo + contacto.nombre)) {
                DbTiposAplicaciones.db.nuevoTipo(nuevo);
              }

              Navigator.pop(context);
            },
            child: Container(
              width: 300,
              child: Center(
                child: Text(
                  'WhatsApp',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )),
        ElevatedButton(
            onPressed: () {
              final grupo = 'MPC';
              final nuevo = new ApiTipos(
                  grupo: grupo, nombre: contacto.nombre, tipo: '1');
              if (Provider.of<AplicacionesProvider>(context, listen: false)
                  .agregarMenu(grupo + contacto.nombre)) {
                DbTiposAplicaciones.db.nuevoTipo(nuevo);
              }
              Navigator.pop(context);
            },
            child: Container(
              width: 300,
              child: Center(
                child: Text(
                  'Todos',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 300,
              child: Center(
                child: Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )),
      ],
    ),
  );
}
