import 'package:flutter/material.dart';
import 'package:piproy/scr/sharedpreferences/usuario_pref.dart';
import 'package:provider/provider.dart';

import '../providers/aplicaciones_provider.dart';
import '../providers/db_provider.dart';
import '../providers/provider_pref.dart';
import '../widgets/header_app.dart';

class Inicializar extends StatelessWidget {
  const Inicializar();

  @override
  Widget build(BuildContext context) {
    final pref = Provider.of<Preferencias>(context);
    return SafeArea(
      child: Scaffold(
          appBar: headerApp(context, 'Inicializar vitalfon', Text(''), 0.0,
              true, 'Inicializa'),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 200,
                color: Colors.red[900],
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Center(
                  child: Text(
                    'DESEA CONFIGURAR vitalfon A SU ESTADO INICIAL ? ',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // eliminar  a BD
                      },
                      child: Text(
                        'NO',
                        style: TextStyle(fontSize: 40),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        DbTiposAplicaciones.db.inicializar();
                        pref.inicializar();
                        Provider.of<AplicacionesProvider>(context,
                                listen: false)
                            .inicializar();
                        SharedPref().inicializar();
                        Navigator.pop(context);
                        // eliminar  a BD
                      },
                      child: Text('SI', style: TextStyle(fontSize: 40))),
                ],
              ),
            ],
          )),
    );
  }
}
