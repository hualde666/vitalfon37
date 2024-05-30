import 'package:flutter/material.dart';
import 'package:piproy/scr/providers/estado_celular.dart';
import 'package:piproy/scr/widgets/header_app.dart';
import 'package:provider/provider.dart';

class PilaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final celProvider = Provider.of<EstadoProvider>(context);
    final nivelBateria = celProvider.nivelBateria;
    final color = celProvider.bateriaColor;
    return SafeArea(
      child: Scaffold(
        appBar:
            headerApp(context, 'Nivel Bateria', Text(''), 0.0, true, 'pila'),
        backgroundColor: color,
        body: _mostrarPila(nivelBateria),
      ),
    );
  }

  Widget _mostrarPila(int nivelBateria) {
    return Center(
      child: Container(
        child: Text(
          '$nivelBateria %',
          style: TextStyle(
            fontSize: 100,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
