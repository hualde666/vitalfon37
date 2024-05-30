import 'package:flutter/material.dart';

import 'package:piproy/channel/channel_android.dart';
import 'package:piproy/scr/pages/botonrojo_page.dart';
import 'package:piproy/scr/pages/home2_page.dart';

class AutorizarSms extends StatefulWidget {
  @override
  State<AutorizarSms> createState() => _AutorizarSmsState();
}

class _AutorizarSmsState extends State<AutorizarSms> {
  // bool autorizado = false;
  // GpsPage({@required context});
  @override
  Widget build(BuildContext context) {
    AndroidChannel _androidChannel = AndroidChannel();

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text('AVISO',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 45,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '    Debe suministrar permisos a vitalfon para enviar mensaje de texto (SMS).',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Para habilitar esta opción, dirijase a la configuración de aplicaciones del celular y seguir los siguientes instrucciones: ',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Configuración -> Aplicaciones-> Permisos -> SMS -> vitalfon -> Permitir',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () async {
                        final bool autorizado =
                            await _androidChannel.permisoSms();

                        if (autorizado) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BotonRojoPage()));
                        } else {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home2Page()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          // side: BorderSide() ,
                          backgroundColor: Color.fromRGBO(249, 75, 11, 1)),
                      child: Text(
                        'OK',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
