import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:piproy/scr/providers/aplicaciones_provider.dart';
import 'package:piproy/scr/providers/db_provider.dart';
import 'package:piproy/scr/providers/provider_pref.dart';
import 'package:provider/provider.dart';

Widget elementoApi2(BuildContext context, Application api) {
  final pref = Provider.of<Preferencias>(context, listen: false);

  return GestureDetector(
    onTap: () {
      if (api.packageName != "") {
        api.openApp();
      }
    },
    child: Container(
      // height: 220,
      // color: Colors.white24,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              eliminarApiMP(context, 'MPD' + api.packageName, api.appName);
            },
            child: pref.modoConfig
                ? Container(
                    // pureba tamaño area tactil antes 30x30
                    width: 50,
                    height: 50,
                    // color: Colors.yellow,
                    child: Center(
                      child: Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.red,
                      ),
                    ))
                : Container(),
          ),
          Image.memory(
            (api as ApplicationWithIcon).icon,
            width: pref.modoConfig ? 80 : 120,
          ),
          Container(
            // height: 40,
            width: 130,
            // color: Colors.pink,
            child: Text(
              api.appName,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Future<dynamic> eliminarApiMP(
    BuildContext context, String tipo, String nombre) {
  // final String titulo = tipo.substring(3);
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('$nombre',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
          )),
      content: Text('¿Desea   app  del menú principal?',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, color: Colors.black)),
      // shape: CircleBorder(),
//elevation: 14.0,
//      actionsPadding: EdgeInsets.symmetric(horizontal: 30.0),
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
    ),
  );
}
