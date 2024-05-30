import 'package:flutter/material.dart';
import 'package:piproy/scr/providers/estado_celular.dart';
import 'package:piproy/scr/providers/provider_pref.dart';
import 'package:piproy/scr/widgets/boton_rojo.dart';
import 'package:piproy/scr/widgets/configurar.dart';
import 'package:piproy/scr/widgets/encabezado_icon.dart';
import 'package:piproy/scr/widgets/fecha.dart';
import 'package:piproy/scr/widgets/hora.dart';
import 'package:provider/provider.dart';

encabezadoApp(BuildContext context) {
  final pref = Provider.of<Preferencias>(context);
  final menuHorizontal = pref.menuHorizontal;

  return Container(
    height: pref.menuHorizontal ? 276 : 200,
    //   padding: EdgeInsets.only(left: 5, right: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 4,
        ),
        BotonesEncabezado(),
        SizedBox(
          height: 5,
        ),
        menuHorizontal ? encabezadoIcon(context) : Text(''),
      ],
    ),
  );
}

class BotonesEncabezado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final pref = Provider.of<Preferencias>(context);
    final celProvider = Provider.of<EstadoProvider>(context);

    return Container(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              //   color: Colors.yellow,
              child: Column(
                children: [
                  Container(
                    width: width / 2,
                    // color: Colors.red,
                    // padding: EdgeInsets.only(top: 5),
                    child: Center(child: ConfigWidget()),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  HoraFecha(),
                  FechaReloj(),
                ],
              ),
            ),
            Container(
              //    color: Colors.pink,
              width: width / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                              celProvider.conexionWifi
                                  ? Icons
                                      .wifi //signal_wifi_statusbar_connected_no_internet_4_rounded // Icons.wifi
                                  : Icons.wifi_off,
                              color: celProvider.conexionWifi
                                  ? pref.paleta != '1'
                                      ? Colors.green[900]
                                      : Color.fromARGB(255, 39, 138, 46)
                                  : pref.paleta != '1'
                                      ? Colors.red[900]
                                      : Color.fromARGB(255, 239, 67, 67)),
                          Icon(
                              celProvider.conexionGps
                                  //  ? Icons.location_on
                                  //  : Icons.location_off,
                                  ? Icons.location_on_outlined
                                  : Icons.location_off_outlined,
//? Icons.gps_fixed
                              //                                : Icons.gps_off_sharp,
                              color: celProvider.conexionGps
                                  ? pref.paleta != '1'
                                      ? Colors.green[900]
                                      : Color.fromARGB(255, 39, 138, 46)
                                  : pref.paleta != '1'
                                      ? Colors.red[900]
                                      : Color.fromARGB(255, 239, 67, 67)),

                          ///**** ESTADO BATERIA */

                          Container(
                            // color: Colors.amberAccent,
                            child: Stack(children: [
                              Center(
                                child: Icon(Icons.battery_full,
                                    color: celProvider.bateriaColor),
                              ),
                              Positioned(
                                left: celProvider.nivelBateria == 100 ? 14 : 13,
                                top: celProvider.nivelBateria == 100 ? 6 : 8,
                                child: RotatedBox(
                                  quarterTurns: -1,
                                  child: Text(
                                    celProvider.nivelBateria.toString() + '%',
                                    style: TextStyle(
                                        fontSize:
                                            celProvider.nivelBateria == 100
                                                ? 11
                                                : 13,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          Icon(
                              celProvider.conexionDatos
                                  ? Icons.signal_cellular_alt_rounded
                                  : Icons.signal_cellular_null,
                              color: celProvider.conexionDatos
                                  ? pref.paleta != '1'
                                      ? Colors.green[900]
                                      : Color.fromARGB(255, 39, 138, 46)
                                  : pref.paleta != '1'
                                      ? Colors.red[900]
                                      : Color.fromARGB(255, 239, 67, 67)),
                        ]),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  botonRojoHeader(context, true),
                ],
              ),
            )
          ]),
    );
  }
}
