import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:piproy/scr/pages/configuracion_page.dart';
import 'package:piproy/scr/providers/aplicaciones_provider.dart';
import 'package:piproy/scr/sharedpreferences/usuario_pref.dart';

import 'package:piproy/scr/widgets/logo_header.dart';
import 'package:provider/provider.dart';

class InstalacionPage extends StatefulWidget {
  @override
  State<InstalacionPage> createState() => _InstalacionPageState();
}

class _InstalacionPageState extends State<InstalacionPage> {
  bool autorizado = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  logoHeader(),
                  SizedBox(
                    height: 10,
                  ),
                  // Text(
                  //   'Para definir los contactos que recibirán el mensaje de emergencia y facilitar el acceso a los contactos mas importantes para el usuario, vitalfon necesita acceder a tus contactos.',
                  //   textAlign: TextAlign.justify,
                  //   style: TextStyle(
                  //       fontStyle: FontStyle.italic,
                  //       fontSize: 25,
                  //       fontWeight: FontWeight.bold,
                  //       color: Color.fromARGB(255, 155, 185, 182)),
                  // ),

                  Text(
                    'Para facilitar el acceso a los contactos mas importantes para el usuario, vitalfon necesita acceder a tus contactos.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 155, 185, 182)),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Icon(
                  Icons.groups,
                  size: 80,
                  color: Color.fromARGB(255, 155, 185, 182),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              !autorizado
                  ? Container(
                      width: 170,
                      child: ElevatedButton(
                          onPressed: () async {
                            autorizado = true;
                            await Permission.contacts.request();
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              // side: BorderSide() ,
                              backgroundColor: Color.fromRGBO(249, 75, 11, 1)),
                          child: Text(
                            'autorizar ->',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          )),
                    )
                  : Container(),
              autorizado
                  ? Container(
                      width: 170,
                      child: ElevatedButton(
                          onPressed: () async {
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MensajesPermisos()));
                            // sin BOTON ROJO
                            SharedPref().instalado = true;

                            final apiMenu = Provider.of<AplicacionesProvider>(
                                context,
                                listen: false);
                            await apiMenu.cargarCategorias();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ConfiguracionPage()
                                    // PolitcasPrivacidad()
                                    ));
                            // Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              backgroundColor: autorizado
                                  ? Color.fromARGB(255, 4, 135, 211)
                                  : Colors.grey),
                          child: Text(
                            'siguiente ->',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          )),
                    )
                  : Container(),
            ],
          ),
        ),
      )),
    ));
  }
}
