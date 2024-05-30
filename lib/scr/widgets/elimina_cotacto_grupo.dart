import 'package:flutter/material.dart';
import 'package:piproy/scr/models/contactos_modelo.dart';
import 'package:piproy/scr/providers/aplicaciones_provider.dart';
import 'package:piproy/scr/providers/db_provider.dart';
import 'package:piproy/scr/providers/provider_pref.dart';
import 'package:provider/provider.dart';

Future<dynamic> eliminarContactoGrupo(
        BuildContext context, String grupo, ContactoDatos contacto) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(contacto.nombre,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
            )),
        content: Text('¿Desea eliminar este contacto del grupo $grupo ?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            )),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          Container(
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  final pref =
                      Provider.of<Preferencias>(context, listen: false);
                  if (grupo == 'Emergencia' &&
                      pref.telefonoEmergencia == contacto.nombre) {
                    pref.eliminarLLamadaEmergencia();
                  }
                  DbTiposAplicaciones.db
                      .deleteApi(grupo, contacto.nombre); //elimina api de BD
                  /// elina contacto de pantalla
                  Provider.of<AplicacionesProvider>(context, listen: false)
                      .eliminarContacto(grupo, contacto);

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
      ),
    );
