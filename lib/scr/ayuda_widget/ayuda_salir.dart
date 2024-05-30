import 'package:flutter/material.dart';

import '../widgets/parrafos_ayuda.dart';

class AyudaSalirPage extends StatelessWidget {
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
              height: 50,
            ),
            AyudaParrafo(
              texto:
                  '     Cierra la aplicación vitalfon y da acceso al menu del teléfono.',
            ),
            SizedBox(
              height: 30,
            ),
            AyudaParrafo(
              texto:
                  '     Debe entrar a la configración del teléfono y seleccionar que launcher quiere.',
            ),
            SizedBox(
              height: 30,
            ),
            AyudaParrafo(
              texto:
                  '     Pasos:  Configuración -> Pantalla Inicio -> Launcher por Defecto.',
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ];
    lista.addAll(lista2);
    return lista;
  }
}
