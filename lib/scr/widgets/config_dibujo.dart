import 'package:flutter/material.dart';
import 'package:piproy/scr/providers/provider_pref.dart';

class ConfigDibujo extends StatelessWidget {
  const ConfigDibujo({
    super.key,
    required this.pref,
  });

  final Preferencias pref;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        // Text(
        //   'configurar vitalfon',
        //   style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
        // ),
        Center(
          child: Container(
              // padding: EdgeInsets.all(10),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: pref.backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 1,
                    spreadRadius: 0.5,
                    offset: Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(100.0),
                border: pref.paleta == '4'
                    ? Border.all(color: Theme.of(context).primaryColor)
                    : Border.all(color: pref.backgroundColor),
              ),
              // border: Border.all(
              //     width: 0.5, color: Theme.of(context).primaryColor)),
              // margin: EdgeInsets.only(right: 5),
              child: Icon(
                Icons.build,
                size: 25,
                //color: Theme.of(context).primaryColor,
              )),
        ),
      ]),
    );
  }
}
