import 'package:flutter/material.dart';

import '../widgets/parrafos_ayuda.dart';

class AyudaDessHabilitar extends StatelessWidget {
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
                  '     Se definen como elementos en vitalfon a: los íconos de teléfono, linterna, mensaje, reloj/alarma, búsqueda con Google; el grupo "Contactos" (Todos los contactos) y el grupo "Aplicaciones" (Todas las aplicaciones).',
            ),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
              texto:
                  '    Seleccione aquellos que quiera que aparezcan en la pantalla de inicio; deseleccione para remover elementos.',
            ),
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
