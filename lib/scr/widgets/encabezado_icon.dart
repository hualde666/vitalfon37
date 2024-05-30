import 'package:flutter/material.dart';
import 'package:piproy/scr/providers/provider_pref.dart';

import 'package:piproy/scr/widgets/icon_conteiner.dart';
import 'package:provider/provider.dart';

Widget encabezadoIcon(BuildContext context) {
  //final bool isOn = false;
  final pref = Provider.of<Preferencias>(context);
  List<Widget> _listaWidget = [];

  if (pref.iLinterna) {
    _listaWidget.add(widgetHorizontal(
      context,
      Icons.filter_alt,
      'linterna',
    ));
  }

  if (pref.iTelefono) {
    _listaWidget.add(widgetHorizontal(context, Icons.call, 'telefono'));
  }

  if (pref.iMensaje) {
    _listaWidget.add(widgetHorizontal(
      context,
      Icons.chat,
      'mensaje',
    ));
  }

  if (pref.iReloj) {
    _listaWidget.add(widgetHorizontal(
      context,
      Icons.access_alarm,
      'alarma',
    ));
  }

  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    // color: Colors.green,
    height: 91,
    width: _listaWidget.length < 5
        ? 80.0 * _listaWidget.length
        : MediaQuery.of(context).size.width,
    child: Center(
      child: ListView.builder(
        physics: _listaWidget.length < 5
            ? NeverScrollableScrollPhysics()
            : AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _listaWidget.length,
        itemBuilder: (context, i) => _listaWidget[i],
      ),
    ),
  );
}

Widget widgetHorizontal(BuildContext context, IconData icon, String titulo) {
  final pref = Provider.of<Preferencias>(context);
  String paleta = pref.paleta;

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: EdgeInsets.only(left: 5),
        height: 75,
        child: conteinerIcon(
            context,
            Icon(
              icon,
              size: 40.0,
            ),
            titulo,
            70,
            null),
      ),
      Text(
        titulo,
        style: TextStyle(
            color: paleta == '5' || paleta == '2' || paleta == '4'
                ? Theme.of(context).primaryColor
                : Colors.white60),
      )
    ],
  );
}
