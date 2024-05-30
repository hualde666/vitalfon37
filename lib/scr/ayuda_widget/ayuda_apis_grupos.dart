import 'package:flutter/material.dart';

import '../widgets/parrafos_ayuda.dart';

class AyudaApisGrupos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _listaAyudaHome(context);
  }

  Widget _listaAyudaHome(BuildContext context) {
    List<Widget> _listaAyuda = _crearListaAyuda(context);

    return ListView.builder(
        itemCount: _listaAyuda.length,
        itemBuilder: (contest, i) {
          return _listaAyuda[i];
        });
  }

  List<Widget> _crearListaAyuda(BuildContext context) {
    List<Widget> lista = [];
    List<Widget> lista2 = [
      Container(
        margin: EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            AyudaParrafo(
              texto:
                  '     En esta sección puede seleccionar las apps que quiera que aparezcan en la página de inicio, seleccionelas directamente del grupo "TODAS"',
            ),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
              texto:
                  '     Las puede seleccionar individualmente u organizarlas por grupos',
            ),
            SizedBox(
              height: 50,
            ),
            Text('    APP INDIVIDUALES:',
                style: TextStyle(
                    fontSize: 23,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
              texto:
                  '    Pulse la flecha amarilla  para mover un app a la pantalla principal.',
            ),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
              texto:
                  '    Para quitar un app de la pantalla principal presione la "x" roja',
            ),
            SizedBox(
              height: 50,
            ),
            Text('    APPS  EN  GRUPOS:',
                style: TextStyle(
                    fontSize: 23,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
              texto:
                  '    En la pantalla de aplicaciones presione "+agregar"; asigne el nombre al nuevo grupo de apps; y presione "Si" para crear el grupo',
            ),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
              texto:
                  '    Seleccione el nuevo grupo y luego "+agregar"; busque y seleccione las apps que quiere incluir y presione "+agregar"',
            ),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
              texto:
                  '    Pulse la flecha amarilla del nuevo grupo para moverlo a la pantalla principal.',
            ),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
              texto:
                  '    Para quitar el grupo de apps de la pantalla de inicio presione la "x" roja',
            ),
          ],
        ),
      ),
    ];

    lista.addAll(lista2);
    return lista;
  }
}
