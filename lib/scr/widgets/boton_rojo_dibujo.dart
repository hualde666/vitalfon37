import 'package:flutter/material.dart';

import 'package:piproy/scr/providers/provider_pref.dart';
import 'package:provider/provider.dart';

class BotonRojo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    double ancho = 120;
    double alto = 120;
    double font = 20;
    double icon = 60;
    if (width <= 320) {
      ancho = 100;
      alto = 100;
      font = 15;
      icon = 50;
    }
    final pref = Provider.of<Preferencias>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.call, //Icons.health_and_safety_outlined,
              size: icon, // icon,
              color: pref.paleta == '4'
                  ? Color.fromARGB(255, 255, 230, 7)
                  : Colors.white),
          Text(
            'S O S',
            style: TextStyle(
                fontSize: font, //font,
                fontWeight: FontWeight.bold,
                color: pref.paleta == '4'
                    ? Color.fromARGB(255, 246, 242, 4)
                    : Colors.white),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: pref.paleta == '4' ? Colors.black : Colors.red[900],
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 1,
              spreadRadius: 0.5,
              offset: Offset(0, 3),
            ),
          ],
          border: pref.paleta == '4'
              ? Border.all(color: Theme.of(context).primaryColor)
              : Border.all(color: Colors.red[900]!),
          borderRadius: BorderRadius.all(Radius.circular(100))),
      // border:
      //     Border.all(color: Theme.of(context).primaryColor, width: 0.5)),
      height: alto,
      width: ancho,
    );
  }
}
