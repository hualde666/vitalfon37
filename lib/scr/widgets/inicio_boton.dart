import 'package:flutter/material.dart';
import 'package:piproy/scr/pages/home2_page.dart';
import 'package:piproy/scr/widgets/boton_inicio_dibujo.dart';

class InicioBoton extends StatelessWidget {
  final String pagina = '';
  InicioBoton({pagina});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (pagina != 'home') {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home2Page()
                  // PolitcasPrivacidad()
                  ));
          //  Navigator.of(context).popUntil(ModalRoute.withName('home'));
        }
      },
      child: inicioBoton(context),
    );
  }
}
