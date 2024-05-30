import 'dart:async';

import 'package:flutter/material.dart';
import 'package:piproy/scr/providers/estado_celular.dart';

import 'package:piproy/scr/widgets/reloj_viejo.dart';
import 'package:provider/provider.dart';

class PilaTimpoClima extends StatefulWidget {
  @override
  _PilaTimpoClimaState createState() => _PilaTimpoClimaState();
}

class _PilaTimpoClimaState extends State<PilaTimpoClima> {
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
    return Reloj();
  }
}
