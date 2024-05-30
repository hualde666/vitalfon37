import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piproy/scr/pages/ayuda.dart';
import 'package:piproy/scr/providers/aplicaciones_provider.dart';

import 'package:piproy/scr/widgets/header_app.dart';
// import 'package:provider/provider.dart';

// import '../providers/provider_pref.dart';

class AyudaNuevaPage extends StatelessWidget {
  final apiProvider = new AplicacionesProvider();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: headerApp(context, 'A Y U D A', Text(''), 0.0, true, ''),
        backgroundColor: Colors.white,

        // title: Text('Configuración'),

        body: ListView(children: [
          // SizedBox(
          //   height: 20,
          // ),
          Divider(
            height: 10,
            color: Colors.black54,
          ),
          ItemConfig(
            icon: Icons.text_snippet_outlined,
            texto: 'Introducción',
            onPress: Ayuda(pagina: 'Introducción'),
          ),
          Divider(
            height: 10,
            color: Colors.black54,
          ),
          ItemConfig(
              icon: Icons.build,
              texto: 'Configuración',
              onPress: Ayuda(pagina: 'Configuración')),
          Divider(
            height: 10,
            color: Colors.black54,
          ),
          ItemConfig(
            icon: Icons.message,
            texto: 'Redactar mensaje de emergencia',
            onPress: Ayuda(pagina: 'Mensaje de emergencia'),
          ),
          Divider(
            height: 10,
            color: Colors.black54,
          ),
          ItemConfig(
            icon: Icons.contact_phone,
            texto: 'Establecer destinatarios del mensaje de emergencia',
            onPress: Ayuda(pagina: 'Contactos SMS de SOS'),
          ),
          Divider(
            height: 10,
            color: Colors.black54,
          ),
          ItemConfig(
            icon: Icons.phone_forwarded,
            texto: 'Establecer destinatario de la llamada de emergencia',
            onPress: (Ayuda(pagina: 'Llamada de emergencia')),
          ),
          Divider(
            height: 10,
            color: Colors.black54,
          ),
          ItemConfig(
            icon: Icons.groups,
            texto: 'Establecer contactos en la pantalla principal',
            onPress: Ayuda(pagina: 'Contactos'),
          ),
          Divider(
            height: 10,
            color: Colors.black54,
          ),
          ItemConfig(
            icon: Icons.app_registration,
            texto: 'Establecer aplicaciones en la pantalla principal',
            onPress: Ayuda(pagina: 'Aplicaciones'),
          ),
          Divider(
            height: 10,
            color: Colors.black54,
          ),
          ItemConfig(
            icon: Icons.engineering,
            texto:
                'Habilitar o deshabilitar elementos en la pantalla principal',
            onPress: Ayuda(pagina: 'Habilitar o Deshabilitar Elementos'),
          ),
          Divider(
            height: 10,
            color: Colors.black54,
          ),
          ItemConfig(
            icon: Icons.palette,
            texto: 'Color de vitalfon',
            onPress: Ayuda(pagina: 'Color de vitalfon'),
          ),
          Divider(
            height: 10,
            color: Colors.black54,
          ),
          ItemConfig(
            icon: Icons.email,
            texto: 'Contactenos',
            onPress: Ayuda(pagina: 'Contactenos'),
          ),
          Divider(
            height: 10,
            color: Colors.black54,
          ),
          ItemConfig(
            icon: Icons.web_sharp,
            texto: 'www.vitalfon.com',
            onPress: Ayuda(pagina: 'Página Web'),
          ),
          Divider(
            height: 10,
            color: Colors.black54,
          ),
          ItemConfig(
            icon: Icons.lock_open,
            texto: 'Bloquear / Desbloquear Configuración',
            onPress: Ayuda(pagina: 'Des/Bloquear Configuración'),
          ),
          Divider(
            height: 10,
            color: Colors.black54,
          ),
          ItemConfig(
            icon: Icons.delete_forever_outlined,
            texto: 'Inicializar vitalfon',
            onPress: Ayuda(pagina: 'Inicializar'),
          ),
          Divider(
            height: 10,
            color: Colors.black54,
          ),
          ItemConfig(
            icon: Icons.logout,
            texto: 'Salir de vitalfon',
            onPress: Ayuda(pagina: 'Salir de vitalfon'),
          ),
        ]),
      ),
    );
  }
}

class ItemConfig extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Widget onPress;
  const ItemConfig(
      {required this.icon, required this.texto, required this.onPress});

  @override
  Widget build(BuildContext context) {
    //  final pref = Provider.of<Preferencias>(context);

    return ListTile(
      leading: Icon(icon,
          size: 40.0, color: Colors.black54 //Theme.of(context).primaryColor,
          ),
      title: Text(texto,
          style: TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.italic,
            color: Colors.black54,
          )), //Theme.of(context).primaryColor)),
      onTap: () {
        ///  if (pref.modoConfig) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => onPress));
        // onPress();
        //  }
      },
    );
  }
}

salida(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            //backgroundColor: Colors.red[900],
            title: Container(
              width: 100,
              height: 100,
              child: Center(
                child: Text('¿ Desea salir de vitalfon ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: Colors.red)),
              ),
            ),

            //shape: CircleBorder(),
            elevation: 14.0,
            //actionsPadding: EdgeInsets.symmetric(horizontal: 15.0),
            actionsAlignment: MainAxisAlignment.spaceAround,
            actions: [
              ElevatedButton(
                onPressed: () {
                  // se sale con flecha menu inferior
                  SystemNavigator.pop();

                  exit(0);
                  //Navigator.pop(context);
                },
                child: Text('Si',
                    style: TextStyle(fontSize: 25.0, color: Colors.white)),
              ),
              ElevatedButton(
                  autofocus: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('No',
                      style: TextStyle(fontSize: 25.0, color: Colors.white)))
            ],
          ));
}
