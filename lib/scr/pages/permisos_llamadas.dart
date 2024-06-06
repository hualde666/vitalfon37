import 'package:flutter/material.dart';

import 'package:piproy/scr/pages/configuracion_page.dart';
import 'package:piproy/scr/providers/aplicaciones_provider.dart';
import 'package:provider/provider.dart';

import 'package:permission_handler/permission_handler.dart';
import '../sharedpreferences/usuario_pref.dart';
import '../widgets/logo_header.dart';

class LLamadasPermisos extends StatefulWidget {
  @override
  State<LLamadasPermisos> createState() => _LLamadasPermisosState();
}

class _LLamadasPermisosState extends State<LLamadasPermisos> {
  bool autorizado = false;
  @override
  Widget build(BuildContext context) {
////final pref = Provider.of<Preferencias>(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
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
                            height: 20,
                          ),
                          Text(
                            ' Para facilitar las llamadas directas , vitalfon necesita que autorices  a realizar las llamadas que solicite el usuario.		',
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
                          Icons.phone,
                          size: 80,
                          color: Color.fromARGB(255, 155, 185, 182),
                        ),
                      ),
                      !autorizado
                          ? Container(
                              width: 170,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await Permission.phone.request();
                                    // AndroidChannel _androidChannel =
                                    //     AndroidChannel();
                                    // // await FlutterPhoneDirectCaller.callNumber('');
                                    // await _androidChannel.permisoCall();
                                    autorizado = true;
                                    setState(() {});
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      // side: BorderSide() ,
                                      backgroundColor:
                                          Color.fromRGBO(249, 75, 11, 1)),
                                  child: Text(
                                    'autorizar ->',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  )),
                            )
                          : Container(),
                      autorizado
                          ? Container(
                              width: 170,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    SharedPref().instalado = true;
                                    //  SharedPref().instalado = true;
                                    final apiMenu =
                                        Provider.of<AplicacionesProvider>(
                                            context,
                                            listen: false);
                                    await apiMenu.cargarCategorias();
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ConfiguracionPage()
                                            // PolitcasPrivacidad()
                                            ));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      // side: BorderSide() ,
                                      backgroundColor:
                                          Color.fromARGB(255, 4, 135, 211)),
                                  child: Text(
                                    'siguiente ->',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  )))
                          : Container(),
                    ],
                  ),
                ),
              ),
            )));
  }
}
