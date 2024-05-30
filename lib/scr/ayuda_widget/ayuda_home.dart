import 'package:flutter/material.dart';

import 'package:piproy/scr/widgets/boton_rojo_dibujo.dart';
import 'package:piproy/scr/widgets/encabezado_icon.dart';
import 'package:provider/provider.dart';

import '../providers/provider_pref.dart';

class AyudaHome extends StatelessWidget {
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
    List<Widget> lista = [
      SizedBox(
        height: 10,
      ),
      Container(
        child: Center(
            child: Text('Pantalla Inicial',
                style: TextStyle(
                    fontSize: 30, color: Theme.of(context).primaryColor))),
      ),
      SizedBox(
        height: 10,
      ),

      Divider(
        height: 10,
        color: Theme.of(context).primaryColor,
      ),
      SizedBox(
        height: 10,
      ),
      //********************************** CONFIGURACION ******** */
      Container(
        // height: 150,
        margin: EdgeInsets.only(left: 5),
        child: Column(
          children: [
            Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black38,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 1,
                        spreadRadius: 0.5,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(
                        width: 0.5, color: Theme.of(context).primaryColor)),
                margin: EdgeInsets.only(right: 5),
                child: Center(
                  child: Icon(
                    Icons.build,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  //  Text(
                  //   'CONFIGURAR',
                  //   style: TextStyle(fontSize: 18, color: Colors.white),
                  // ),
                )),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 70,
              // width: 250,
              child: Center(
                child: Text(
                  'Configuración:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 25, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 6, right: 6, top: 3),
              child: Text(
                'Permite: selección de contactos de emergencia, el mensaje de emergencia, color de Vitalfon y hablitar o deshablita elmentos  en pantalla principal',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 25, color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Divider(
        height: 10,
        color: Theme.of(context).primaryColor,
      ),
      SizedBox(
        height: 10,
      ),
      //**********************************AYUDA******** */
      SizedBox(
        height: 10,
      ),
      //**********************************BOTON ROJO******** */
      Container(
        //height: 150,
        margin: EdgeInsets.only(left: 5),
        child: Column(
          children: [
            BotonRojo(),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 70,
              // width: 250,
              child: Center(
                child: Text(
                  'Boton de Emergencia:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 25, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 6, right: 5, top: 5),
              child: Column(
                children: [
                  Text(
                    'Inicia el proceso de envio de menaje de emergencia (Deberá haber seleccionado sus contactos de emergencia previamente y tener activo el GPS para que funcione el envio de su geolocalización).',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 25, color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    'Se enviará un mensaje genérico a sus contactos advirtiendo que se encuentra en una situación de emergencia y necesita ayuda. También se enviará su geolocalización.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 25, color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    'El 112 no puede recibir este tipo de mensaje.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 25, color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Divider(
        height: 10,
        color: Theme.of(context).primaryColor,
      ),
      //********************************** MENU HORIZONTAL******** */
      SizedBox(
        height: 10,
      ),

      SizedBox(
        height: 10,
      ),

      Container(
        // height: 150,
        margin: EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: widgetHorizontal(
                context,
                Icons.filter_alt,
                'linterna',
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 6, right: 6, top: 3),
              child: Text(
                'Prende o apaga la linterna. En amarillo está prendida.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 25, color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Divider(
        height: 10,
        color: Theme.of(context).primaryColor,
      ),
      SizedBox(
        height: 10,
      ),

      Container(
        // height: 150,
        margin: EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: widgetHorizontal(context, Icons.call, 'telefono')),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 6, right: 6, top: 3),
              child: Text(
                'Permite realizar llamadas.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 25, color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),

      Divider(
        height: 10,
        color: Theme.of(context).primaryColor,
      ),
      SizedBox(
        height: 10,
      ),

      Container(
        // height: 150,
        margin: EdgeInsets.only(left: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: widgetHorizontal(
                context,
                Icons.chat,
                'mensaje',
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 6, right: 6, top: 3),
              child: Text(
                'Permite mandar mensajes de texto SMS.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 25, color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Divider(
        height: 10,
        color: Theme.of(context).primaryColor,
      ),
      SizedBox(
        height: 10,
      ),

      Container(
        // height: 150,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //color: Colors.green,
              child: widgetHorizontal(
                context,
                Icons.access_alarm,
                'alarma',
              ),
            ),
            Container(
              //width: double.infinity,
              margin: EdgeInsets.only(left: 6, right: 6, top: 3),
              child: Text(
                'Configuración de alarmas: despertador, recordatorios y otras.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 25, color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Divider(
        height: 10,
        color: Theme.of(context).primaryColor,
      ),
      SizedBox(
        height: 10,
      ),

      Container(
        // height: 150,

        margin: EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // height: 90,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,

                // borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                          color:
                              Colors.white38, // Theme.of(context).primaryColor,
                          width: 0.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: Center(
                            child: Image(
                                image: AssetImage('assets/google.png'),
                                fit: BoxFit.fill)),
                        height: 40,
                        width: 200,
                        //color: Colors.red),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              //width: double.infinity,
              margin: EdgeInsets.only(left: 6, right: 6, top: 3),
              child: Text(
                'Permite realizar busqueda por internet',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 25, color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Divider(
        height: 10,
        color: Theme.of(context).primaryColor,
      ),
      SizedBox(
        height: 10,
      ),

      Container(
        // height: 150,

        margin: EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.green,
                  /** es un contacto o grupo de contacto */
                  // Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  )),
              child: Center(
                child: Text(
                  'Contactos',
                  style: TextStyle(
                    fontSize: 30,
                    color: pref.backgroundColor,
                  ),
                ),
              ),
            ),
            Container(
              //width: double.infinity,
              margin: EdgeInsets.only(left: 6, right: 6, top: 3),
              child: Text(
                'Permite accesar los contactos telefónicos y crear grupos de ellos. Para cada contacto permite realizar llamadas, ir al Whatsapp y enviar mensajes de texto',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 25, color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Divider(
        height: 10,
        color: Theme.of(context).primaryColor,
      ),
      SizedBox(
        height: 10,
      ),

      Container(
        // height: 150,

        margin: EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                  color:
                      /** es un contacto o grupo de contacto */
                      pref.backgroundColor,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  )),
              child: Center(
                child: Text(
                  'Aplicaciones',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Container(
              //width: double.infinity,
              margin: EdgeInsets.only(left: 6, right: 6, top: 3),
              child: Text(
                'Permite accesar las aplicaciones instaladas en el celular y crear grupos de ellas para mejor organización',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 25, color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Divider(
        height: 10,
        color: Theme.of(context).primaryColor,
      ),
      SizedBox(
        height: 10,
      ),

      Container(
        // height: 150,

        margin: EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              child: Icon(
                Icons.close,
                size: 50,
                color: Colors.red,
              ),
            ),
            Container(
              //width: double.infinity,
              margin: EdgeInsets.only(left: 6, right: 6, top: 3),
              child: Text(
                'Este símbolo elimina al elemento que lo contiene del menu principal.  ',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 25, color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Divider(
        height: 10,
        color: Theme.of(context).primaryColor,
      ),
    ];
    return lista;
  }
}
