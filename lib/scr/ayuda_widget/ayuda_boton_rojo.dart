import 'package:flutter/material.dart';
import 'package:piproy/scr/ayuda_widget/ayuda_encabezado.dart';
import 'package:provider/provider.dart';

import '../providers/provider_pref.dart';

class AyudaBotonRojoPage extends StatelessWidget {
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
    final pref = Provider.of<Preferencias>(context);
    List<Widget> lista = [];
    lista.addAll(ayudaEncabezado(context, 'Mandar mensaje de Emergencia'));
    List<Widget> lista2 = [
      SizedBox(
        height: 10,
      ),
      Container(
        margin: EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
                //width: double.infinity,
                height: 120,
                width: 120,
                child: Container(
                  decoration: BoxDecoration(
                      color: pref.paleta == '4' ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 4.0)),
                  child: Center(
                    child: Text(
                      'Enviar',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: pref.paleta == '4'
                            ? Theme.of(context).primaryColor
                            : Colors.black,
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              //width: double.infinity,
              margin: EdgeInsets.only(left: 6, right: 6, top: 3),
              child: Text(
                'Presione aquí para comenzar el envío del mensaje de emergencia a sus contactos.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 25, color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    ];
    lista.addAll(lista2);
    return lista;
  }
}
