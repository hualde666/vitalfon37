import 'package:flutter/material.dart';
import 'package:piproy/scr/models/api_tipos.dart';
import 'package:piproy/scr/providers/aplicaciones_provider.dart';
import 'package:piproy/scr/providers/db_provider.dart';
import 'package:provider/provider.dart';

Future agregaMPD(BuildContext context, String grupo) async {
  // grupo es el nombre de categoria a agregar al menu principal
  return await showDialog(
      context: context,
      builder: (context) {
        return agregaMpdForm(context, grupo);
      });
}

AlertDialog agregaMpdForm(BuildContext context, String grupo) {
  final apiProvider = Provider.of<AplicacionesProvider>(context);
  return AlertDialog(
    title: Text('$grupo',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
        )),
    content: Text('¿Desea copiar este grupo al menu principal?',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25, color: Colors.black)),
    actionsAlignment: MainAxisAlignment.spaceAround,
    actions: [
      Container(
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                //change width and height on your need width = 200 and height = 50
//minimumSize: Size(30, 20),
                backgroundColor: Color.fromRGBO(249, 75, 11, 1)),
            onPressed: () {
              final nuevo =
                  new ApiTipos(grupo: 'MPF', nombre: grupo, tipo: '3');
              if (!apiProvider.listaMenu.contains('MPF' + grupo)) {
                /// actualizar lista MENU
                ///
                Provider.of<AplicacionesProvider>(context, listen: false)
                    .agregarMenu('MPF' + grupo);

                DbTiposAplicaciones.db.nuevoTipo(nuevo);
              }

              Navigator.of(context).pop();
            },
            child: Text(
              'Si',
              style: TextStyle(color: Colors.white),
            )),
      ),
      Container(
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                //change width and height on your need width = 200 and height = 50
                minimumSize: Size(30, 20),
                backgroundColor: Color.fromRGBO(249, 75, 11, 1)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'NO',
              style: TextStyle(color: Colors.white),
            )),
      ),
    ],
  );
}
