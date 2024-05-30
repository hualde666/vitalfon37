import 'package:flutter/material.dart';
import 'package:piproy/scr/providers/aplicaciones_provider.dart';
import 'package:piproy/scr/providers/db_provider.dart';
import 'package:provider/provider.dart';

Future<dynamic> eliminarContactoMP(BuildContext context, String tipo) {
  final String titulo = tipo.substring(3);
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(' $titulo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                )),
            content: Text(
              '¿Desea eliminar este  contacto del menú principal?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            actionsAlignment: MainAxisAlignment.spaceAround,
            actions: [
              Container(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      /// elina api de pantalla
                      Provider.of<AplicacionesProvider>(context, listen: false)
                          .eliminarTipoMP(tipo);

                      DbTiposAplicaciones.db
                          .deleteApi(tipo.substring(0, 3), tipo.substring(3));

                      //elimina api de BD

                      Navigator.pop(context);
                    },
                    child: Text(
                      'Si',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'NO',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ));
}
