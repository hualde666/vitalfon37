import 'package:flutter/material.dart';
import 'package:piproy/scr/providers/aplicaciones_provider.dart';
import 'package:piproy/scr/providers/db_provider.dart';
import 'package:provider/provider.dart';

///
///************** ELIMINA GRUP API************/
///
Future eliminarTipo(BuildContext context, String tipo) async {
  if (tipo == 'Todas') {
    return;
  }
  return await showDialog(
      context: context,
      builder: (context) {
        return eliminarTipoForm(context, tipo);
      });
}

AlertDialog eliminarTipoForm(BuildContext context, String grupo) {
  final apiProvider = Provider.of<AplicacionesProvider>(context);
  return AlertDialog(
    title: Text(
      '$grupo',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30,
      ),
    ),
    content: Text(
      '¿Desea eliminar este  grupo ?',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25, color: Colors.black),
    ),
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
              // Eliminar de categoria

              Provider.of<AplicacionesProvider>(context, listen: false)
                  .eliminarTipos(grupo);
              // eliminar  a BD
              DbTiposAplicaciones.db.eliminarGrupo(grupo);

              ///
              ///         ELIMNAR DEL MENU PRINCIPAL

              if (apiProvider.listaMenu.contains('MPF' + grupo)) {
                Provider.of<AplicacionesProvider>(context, listen: false)
                    .eliminarTipoMP('MPF' + grupo);
                DbTiposAplicaciones.db.eliminarGrupoMP(grupo);
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
//minimumSize: Size(30, 20),
                backgroundColor: Color.fromRGBO(249, 75, 11, 1)),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'No',
              style: TextStyle(color: Colors.white),
            )),
      ),
    ],
  );
}
