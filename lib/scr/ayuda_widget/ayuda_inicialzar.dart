import 'package:flutter/material.dart';

import '../widgets/parrafos_ayuda.dart';

class AyudaInicializarPage extends StatelessWidget {
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
    // lista.addAll(ayudaEncabezado(context, 'Mensaje de Emergencia'));
    List<Widget> lista2 = [
      Container(
        margin: EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            AyudaParrafo(
              texto:
                  '     Aquí se elimina la última configuración hecha y vitalfon regresa al diseño original de instalación.',
            ),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
              texto:
                  '    Se eliminarán las definciones de contactos de emergencía y el mesanje de emergencía redactado.',
            ),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
                texto:
                    '    Se eliminarán los grupos de contactos y aplicaciones definidas.'),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(texto: '    Tomará el color inicial de vitalfon'),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(texto: '    Podrá definir sus nuevos requerimientos.'),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ];
    lista.addAll(lista2);
    return lista;
  }
}
