import 'package:flutter/material.dart';

import '../widgets/parrafos_ayuda.dart';

class AyudaDesBloquearPage extends StatelessWidget {
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
            Text('    BLOQUEAR:',
                style: TextStyle(
                    fontSize: 23,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
              texto:
                  '     Una vez concluida la configuración del app, deberá bloquear la configuración para evitar que el usuario final la modifique accidentalmente.',
            ),
            SizedBox(
              height: 30,
            ),
            Text('    DESBLOQUEAR:',
                style: TextStyle(
                    fontSize: 23,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
              texto:
                  '    Para desbloquear se le solicitará escriba la palabra:',
            ),
            Text('vitalfon', style: TextStyle(fontWeight: FontWeight.bold)),
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
