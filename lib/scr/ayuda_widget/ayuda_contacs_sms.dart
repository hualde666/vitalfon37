import 'package:flutter/material.dart';

import '../widgets/parrafos_ayuda.dart';

class AyudaContactosSms extends StatelessWidget {
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
                  '     Elija aquí los destinatarios que recibirán el mensaje de emergencia; deberán ser seleccionados de los contactos incluídos en el teléfono.',
            ),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
              texto:
                  '    Seleccione "+agregar" y aparecerá la lista de todos los contactos que estén en su teléfono; seleccione los contactos que necesite y presione guardar.',
            ),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
              texto:
                  '    El app vitalfon creará un grupo de  "Emergencia" con estos contactos. Este grupo podrá ser enviado a la pantalla de inicio pulsando la flecha azul.',
            ),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
              texto:
                  '    El mensaje solo será enviado a teléfonos móviles. El 112 o el 911 no pueden recibir mensajes SMS.',
            ),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
              texto:
                  '    Los números de teléfono (móvil / celular) deberán estar guardados en su teléfono de la forma:',
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Text(
                '     +CódigoPaisNumerodeteléfono',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 25),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
              texto: '    No usar 00 para reemplazar el +.',
            ),
          ],
        ),
      ),
    ];
    lista.addAll(lista2);
    return lista;
  }
}
