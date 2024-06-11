import 'package:flutter/material.dart';
import 'package:piproy/channel/channel_android.dart';

import 'package:piproy/scr/pages/permisos_llamadas.dart';

import '../widgets/logo_header.dart';

class GeoPermisos extends StatefulWidget {
  @override
  State<GeoPermisos> createState() => _GeoPermisosState();
}

class _GeoPermisosState extends State<GeoPermisos> {
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
                        height: 10,
                      ),
                      Column(
                        children: [
                          logoHeader(),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            ' Para poder enviar la ubicación del usuario, en caso de emergencia, vitalfon necesita acceso a su localización. Vitalfon solo la usará al tocar el botón de emergencia.',
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
                        height: 5,
                      ),
                      Container(
                        child: Icon(Icons.location_on,
                            //Icons.gps_fixed_rounded,
                            size: 80,
                            color: Color.fromARGB(255, 155, 185, 182)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      !autorizado
                          ? Container(
                              width: 170,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    AndroidChannel _androidChannel =
                                        new AndroidChannel();
                                    await _androidChannel.permisoGeo();
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
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LLamadasPermisos()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      // side: BorderSide() ,
                                      backgroundColor: autorizado
                                          ? Color.fromARGB(255, 4, 135, 211)
                                          : Colors.grey),
                                  child: Text(
                                    'siguiente ->',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  )),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            )));
  }
}
