import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_sms/flutter_sms.dart';
import 'package:geolocator/geolocator.dart';

//import 'package:flutter_sms/flutter_sms.dart';
import 'package:background_sms/background_sms.dart';
import 'package:piproy/channel/channel_android.dart';
import 'package:piproy/scr/models/contactos_modelo.dart';
// import 'package:location/location.dart';
import 'package:piproy/scr/widgets/tres_botones_header.dart';

class ResumenEnvioPage extends StatefulWidget {
  @override
  State<ResumenEnvioPage> createState() => _ResumenEnvioPageState();
}

class _ResumenEnvioPageState extends State<ResumenEnvioPage> {
  int _remainingTime = 5; //initial time in seconds
  late Timer _timer;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();

          Navigator.pop(context);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
//appBar: headerResumen(context),
            body: Container(
                height: 500,
                // color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "E N V I A N D O: $_remainingTime ",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 35.0),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CircularProgressIndicator(),
                  ],
                )))));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

Widget headerResumen(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(160.0),
    // here the desired height
    child: Container(
      padding: EdgeInsets.only(top: 5),
      height: 160,
      child: Column(
        children: [
          tresBotonesHeader(context, true, 'ResumenEnvio'),
          Text('Resumen de Envío', style: TextStyle(fontSize: 25)),
        ],
      ),
    ),
  );
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}

mandarSMS(List<ContactoDatos> listaE) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? mensaje = prefs.getString('mensajeE');
  String pos2 = "";
  if (mensaje == null) {
    mensaje = "Necesito ayuda !!";
  }
  AndroidChannel _androidChannel = AndroidChannel();

  ///  preguntar si GPS prendido
  bool gpson = await _androidChannel.conectadoGps();

  if (gpson) {
    final Position pos = await _determinePosition();

    final lat = pos.latitude;
    final lng = pos.longitude;
    // pos2 =
    //     ' https://www.google.com/maps/dir/?api=1&?destination_place_id=$lat+$lng';
    pos2 = ' https://maps.google.com/?q=$lat,$lng';
    //  print(pos2);

    ///pos2 = ' ';
  }

  // final List<String> _phone = [];
  for (int i = 0; i < listaE.length; i++) {
    try {
      await BackgroundSms.sendMessage(
          phoneNumber: listaE[i].telefono, message: mensaje);
      print('envie mensaje 1');
    } catch (error) {
      print('error mensaje 1');
//******* que hago si no se manda el mensje ???? */
    }
    try {
      await BackgroundSms.sendMessage(
          phoneNumber: listaE[i].telefono, message: pos2);
      print('envie mensaje 2');
    } catch (error) {
      print('error mensaje 2');
//******* que hago si no se manda el mensje ???? */
    }

    //   _phone.add(listaE[i].telefono);
  }

  /*************   envia el mensaje a cada telefono************ */
  // try {
  // await SmsMms.send(
  //   recipients: _phone,
  //   message: mensaje,
  // );
  // await sendSMS(message: mensaje, recipients: _phone, sendDirect: true);
  // } catch (error) {
//******* que hago si no se manda el mensje ???? */
  // }
//  try {
  // await SmsMms.send(
  //   recipients: _phone,
  //   message: pos2,
  // );
  // print(pos2);
  // await sendSMS(message: pos2, recipients: _phone, sendDirect: true);
  //} catch (error) {
//******* que hago si no se manda el mensje ???? */
  // }
}
