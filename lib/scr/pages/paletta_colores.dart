import 'package:flutter/material.dart';

import 'package:piproy/scr/providers/provider_pref.dart';
import 'package:piproy/scr/sharedpreferences/usuario_pref.dart';
import 'package:piproy/scr/widgets/header_app.dart';
import 'package:provider/provider.dart';

class PaletaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> paleta = [
      colores(context, Colors.white, Colors.white, Colors.black, 5),
      SizedBox(
        height: 5,
      ),
      colores(context, Colors.white, Color.fromARGB(255, 117, 149, 133),
          Colors.white, 2),
      SizedBox(
        height: 5,
      ),
      colores(context, Color.fromARGB(255, 4, 173, 154),
          Color.fromARGB(255, 7, 98, 89), Colors.white, 3),
      SizedBox(
        height: 5,
      ),
      colores(context, Color.fromARGB(255, 2, 84, 131),
          Color.fromARGB(255, 3, 51, 90), Colors.white, 1),
      SizedBox(
        height: 5,
      ),
      colores(context, Colors.black, Colors.black,
          Color.fromARGB(255, 8, 194, 240), 4),
      SizedBox(
        height: 5,
      ),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: headerApp(
            context, 'Paleta de Colores', Text(''), 0.0, true, 'Paleta'),
        //    backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(bottom: 40),
          child: ListView.builder(
              padding: EdgeInsets.only(bottom: 100),
              itemCount: paleta.length,
              itemBuilder: (context, i) {
                return paleta[i];
              }),
        ),
      ),
    );
  }

  Widget colores(BuildContext context, Color fondo, Color elemento,
      Color letras, int paleta) {
    final usuarioProvider = Provider.of<Preferencias>(context);

    return GestureDetector(
      onTap: () {
        usuarioProvider.paleta = paleta.toString();
        SharedPref().paleta = paleta.toString();
      },
      child: Container(
        decoration: BoxDecoration(
            color: fondo,
            // borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
                color: usuarioProvider.paleta == paleta.toString()
                    ? Colors.amber
                    : Colors.black12,
                width:
                    usuarioProvider.paleta == paleta.toString() ? 3.0 : 1.0)),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        height: 80,
        // color: fondo,
        child: Center(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              decoration: BoxDecoration(
                  color: elemento,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: letras, width: 1.0)),
              child: Center(
                  child: Text(
                'ABC',
                style: TextStyle(color: letras, fontSize: 25),
              ))),
        ),
      ),
    );
  }
}
