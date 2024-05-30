import 'package:flutter/material.dart';

import '../widgets/parrafos_ayuda.dart';

class AyudaConfigurarPage extends StatelessWidget {
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
    // lista.addAll(ayudaEncabezado(context, 'Configuración de vitalfon'));
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
                  '     En esta sección están disponibles todas las opciones para configurar el app de acuerdo a las necesidades del usuario final.',
            ),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
              texto:
                  '    Comience configurando el mensaje de emergencia y luego siga el orden de las secciones que aparecen en Configuración.',
            ),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
              texto:
                  '    Una vez concluída la configuración del app, deberá bloquear la configuración para evitar que el usuario final la modifique accidentalmente.',
              fontweigth: FontWeight.w900,
              fontsize: 30,
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.lock_outline,
                size: 40.0,
                color: Theme.of(context).primaryColor,
              ),
              title: Text('Bloquear Configuración',
                  style: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).primaryColor,
                  )),

              // onTap: () {
              //   if (pref.modoConfig) {
              //     final pref = Provider.of<Preferencias>(context, listen: false);
              //     pref.modoConfig = !pref.modoConfig;
              //     SharedPref().modoConfig = pref.modoConfig;
              //     // onPress();
              //   } else {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => Desbloqueo()));
              //   }
              // },
            ),
            SizedBox(
              height: 13,
            ),
          ],
        ),
      ),
    ];

    lista.addAll(lista2);
    return lista;
  }
}
