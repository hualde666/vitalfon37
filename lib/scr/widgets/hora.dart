import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:piproy/scr/models/reloj_modelo.dart';
import 'package:piproy/scr/providers/estado_celular.dart';

class HoraFecha extends StatefulWidget {
  @override
  _HoraFechaState createState() => _HoraFechaState();
}

class _HoraFechaState extends State<HoraFecha> {
  Timer startTimeout([int? milliseconds]) {
    final timeout = Duration(seconds: 60);

    return Timer(timeout, _actualizaHora);
  }

  @override
  void initState() {
    super.initState();

    // Set the initial values.
    startTimeout(1);
  }

  void _actualizaHora() {
    if (mounted) {
      setState(() {
        startTimeout();
      });
    }
  }

  // @override
  // void dispose() {
  //   Timer(Duration(microseconds: 1), () {});
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final celProvider = Provider.of<EstadoProvider>(context);
    // SE REVISAN CAMBIOS EN BATERIA, INTERNET...
    celProvider.actulizarDatos();
    return HoraReloj();
  }
}

class HoraReloj extends StatelessWidget {
//************************** */

  @override
  Widget build(BuildContext context) {
    final RelojModel reloj = RelojModel();

    return Container(
      //color: Colors.red,
      // height: 110,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${reloj.shora}:${reloj.sminutos}',
              style:
                  TextStyle(fontSize: 50, color: Theme.of(context).primaryColor
                      // fontWeight: FontWeight.bold,
                      )),
        ],
      ),
    );
  }
}
