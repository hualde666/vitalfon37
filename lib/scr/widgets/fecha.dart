import 'dart:async';

import 'package:flutter/material.dart';
import 'package:piproy/scr/models/reloj_modelo.dart';
import 'package:piproy/scr/providers/estado_celular.dart';

import 'package:provider/provider.dart';

class Fecha extends StatefulWidget {
  @override
  _FechaState createState() => _FechaState();
}

class _FechaState extends State<Fecha> {
  Timer startTimeout([int? milliseconds]) {
    final timeout = Duration(seconds: 2);
    //final ms = Duration(milliseconds: 1000);
    //var duration = milliseconds == null ? timeout : ms * milliseconds;
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
    celProvider.actulizarDatos();
    return FechaReloj();
  }
}

class FechaReloj extends StatelessWidget {
//************************** */

  @override
  Widget build(BuildContext context) {
    final RelojModel reloj = RelojModel();

    return Container(
      // color: Colors.red,
      //height: 110,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${reloj.meses[reloj.mes - 1]} ${reloj.dia}',
            style:
                TextStyle(fontSize: 22, color: Theme.of(context).primaryColor),
          ),
          Text('${reloj.dias[reloj.diaweek - 1]}',
              style: TextStyle(
                fontSize: 25,
                color: Theme.of(context).primaryColor,
              )),
        ],
      ),
    );
  }
}
