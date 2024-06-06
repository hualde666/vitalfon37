import 'package:flutter/material.dart';
import 'package:piproy/channel/channel_android.dart';
import 'package:piproy/scr/pages/permisos_geoloc.dart';

import '../widgets/logo_header.dart';

class MensajesPermisos extends StatefulWidget {
  @override
  State<MensajesPermisos> createState() => _MensajesPermisosState();
}

class _MensajesPermisosState extends State<MensajesPermisos> {
  bool autorizado = false;
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
                    Text(
                      'Para que el usuario pueda enviar el mensaje SOS en caso de emergencia, vitalfon necesita autorización para enviar mensaje de texto (SMS).',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 155, 185, 182)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Icon(
                        Icons.message,
                        size: 80,
                        color: Color.fromARGB(255, 155, 185, 182),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                !autorizado
                    ? Container(
                        width: 170,
                        child: ElevatedButton(
                            onPressed: () async {
                              autorizado = await _androidChannel.permisoSms();

                              /// para que pase a la siguiente pantalla no importa
                              /// si está o no autorizado
                              autorizado = true;
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                // side: BorderSide() ,
                                backgroundColor:
                                    Color.fromRGBO(249, 75, 11, 1)),
                            child: Text(
                              'autorizar ->',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            )),
                      )
                    : Container(),
                autorizado
                    ? Container(
                        width: 170,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GeoPermisos()));
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                // side: BorderSide() ,
                                backgroundColor: autorizado
                                    ? Color.fromARGB(255, 4, 135, 211)
                                    : Colors.grey),
                            child: Text(
                              'siguiente ->',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            )),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
