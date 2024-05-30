import 'package:device_apps/device_apps.dart';

import 'package:flutter/material.dart';
import 'package:piproy/channel/channel_android.dart';

import 'package:piproy/scr/funciones/url_funciones.dart';
import 'package:piproy/scr/models/contactos_modelo.dart';

import 'package:piproy/scr/pages/telefono_discado.dart';

import 'package:piproy/scr/providers/aplicaciones_provider.dart';
import 'package:piproy/scr/providers/contactos_provider.dart';

import 'package:piproy/scr/providers/estado_celular.dart';
import 'package:provider/provider.dart';

import '../providers/provider_pref.dart';

Widget conteinerIcon(BuildContext context, Icon icon, String tarea,
    double ancho, ContactoDatos? contacto) {
  final celProvider = Provider.of<EstadoProvider>(context);
  final pref = Provider.of<Preferencias>(context);
  bool activoGps = celProvider.conexionGps;
  bool activoDatos = celProvider.conexionDatos;
  bool activoWifi = celProvider.conexionWifi;

  bool prendida = false;
  IconData nuevoIcon;
  Widget widget;

  switch (tarea) {
    case 'bateria':
      widget = Pila();
      break;
    case 'wifi':
      nuevoIcon = activoWifi ? Icons.wifi_rounded : Icons.wifi_off_rounded;

      widget = dispositivo(context, activoWifi, nuevoIcon, 70);
      break;

    case 'gps':
      nuevoIcon = activoGps ? Icons.gps_fixed : Icons.gps_off_rounded;

      widget = dispositivo(context, activoGps, nuevoIcon, 70);
      break;
    case 'linea':
      nuevoIcon = activoDatos
          ? Icons.signal_cellular_alt_rounded
          : Icons.signal_cellular_off_outlined;

      widget = dispositivo(context, activoDatos, nuevoIcon, 70);
      break;
    case 'linterna':
      prendida = celProvider.linterna;
      nuevoIcon =
          prendida ? Icons.filter_alt_rounded : Icons.filter_alt_outlined;

      widget = dispLinterna(context, prendida, nuevoIcon);
      break;
    case 'whatsapp':
      widget = Container(
          height: ancho,
          width: ancho,
          decoration: BoxDecoration(
            color: pref.backgroundColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                spreadRadius: 0.5,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(80),
            border: pref.paleta == '4'
                ? Border.all(color: Theme.of(context).primaryColor)
                : Border.all(color: pref.backgroundColor),
          ),
          child: Image(
              image: AssetImage('assets/what.png'),
              height: 60,
              width: 60,
              fit: BoxFit.fill));

      break;

    default:
      {
        widget = Center(
            child: Container(
          width: ancho,
          height: ancho,
          decoration: BoxDecoration(
            color: pref.backgroundColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                spreadRadius: 0.5,
                offset: Offset(0, 3),
              ),
            ],
            border: Border.all(
                color: pref.paleta == '4'
                    ? Theme.of(context).primaryColor
                    : pref.backgroundColor),
            borderRadius: BorderRadius.circular(80),
          ),
          child: icon,
        ));
        break;
      }
  }

  return GestureDetector(
      child: widget,
      onTap: () => funcionIcon(context, tarea, prendida, contacto));
}

funcionIcon(BuildContext context, String tarea, bool prendida,
    ContactoDatos? contacto) async {
  final celProvider = Provider.of<EstadoProvider>(context, listen: false);
  final contactosProvaide =
      Provider.of<ContactosProvider>(context, listen: false);

  bool activoDatos = celProvider.conexionDatos;

  switch (tarea) {
    case 'telefono':
      if (activoDatos) {
        ///  *** llamada desde menu horizontal
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Discado()),
        );
        // llamar("");
      }

      break;
    case 'llamada':
      if (activoDatos) {
        final ContactoDatos _contacto =
            await contactosProvaide.obtenerContacto(contacto!.nombre);

        /// *** llamada desde el contacto
        llamar(_contacto.telefono);
      }
      break;
    case 'mensaje':
      if (activoDatos) {
        mensaje("");
      }
      break;
    case 'mensajeC':

      /// envia mensaje desde el contacto
      if (activoDatos) {
        final ContactoDatos _contacto =
            await contactosProvaide.obtenerContacto(contacto!.nombre);
        mensaje(_contacto.telefono);
      }
      break;
    case 'bateria':
      break;
    case 'wifi':
      // prender y apagar)
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => WifiPage()));
      break;
    case 'gps':
      // prender y apagar
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => GpsPage()));
      break;
    case 'linterna':
      AndroidChannel _androidChannel = AndroidChannel();

      // if (prendida) {

      _androidChannel.onoffLinterna(!prendida);
      Provider.of<EstadoProvider>(context, listen: false).swichLinterna =
          !prendida;
      // } else {
      //   Provider.of<EstadoProvider>(context, listen: false).swichLinterna =
      //       true;
      //   _androidChannel.onoffLinterna(true);
      // }

      break;
    case 'whatsapp':
      final ContactoDatos _contacto =
          await contactosProvaide.obtenerContacto(contacto!.nombre);
      if (_contacto.telefono != "") {
        abrirWhatsapp(_contacto.telefono, '');
      }

//      break;
    case 'configurar':
      Navigator.pushNamed(context, 'configurar');
      break;
    // case 'editar':
    //   Provider.of<ContactosProvider>(context, listen: false).contacto =
    //       contacto;
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => MostrarContacto()));

    //   break;
    case 'alarma':
      final apiProvider =
          Provider.of<AplicacionesProvider>(context, listen: false);
      //  final listaApi = apiProvider.categoryApi['Todas'];
      final Application? api =
          await apiProvider.obtenerApi('com.android.deskclock');

      if (api != null) {
        api.openApp();
      } else {
        final Application? api2 =
            await apiProvider.obtenerApi('com.sec.android.app.clockpackage');
        // ignore: unnecessary_null_comparison
        if (api2 != null) {
          api2.openApp();
        }
      }
      break;
  }
}

Widget dispositivo(
    BuildContext context, bool activo, IconData icon, double ancho) {
  final pref = Provider.of<Preferencias>(context);
  final Color color = activo ? pref.backgroundColor : Colors.red[900]!;

  return Center(
      child: Container(
    width: ancho,
    height: ancho,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(80),
        border: pref.paleta == '4'
            ? Border.all(color: Theme.of(context).primaryColor)
            : Border.all(color: pref.backgroundColor)),
    // border: Border.all(color: Theme.of(context).primaryColor, width: 0.5)),
    child: Center(
        child: Icon(
      icon,
      size: 40.0,
    )),
  ));
}

Widget dispLinterna(BuildContext context, bool activo, IconData icon) {
  final pref = Provider.of<Preferencias>(context);
  final Color color = activo ? Colors.yellow : pref.backgroundColor;
  return Center(
      child: Container(
    width: 70.0,
    height: 70.0,
    decoration: BoxDecoration(
      color: color,
      boxShadow: [
        BoxShadow(
          //  color: Colors.black,
          blurRadius: 1,
          spreadRadius: 0.5,
          offset: Offset(0, 3),
        ),
      ],
      borderRadius: BorderRadius.circular(80),
      border: pref.paleta == '4'
          ? Border.all(color: Theme.of(context).primaryColor)
          : Border.all(color: pref.backgroundColor),
    ),
    //    border: Border.all(color: Theme.of(context).primaryColor, width: 0.5)),
    child: Center(
        child: Icon(
      icon,
      size: 40.0,
    )),
  ));
}

class Pila extends StatefulWidget {
  Pila();
  @override
  _PilaState createState() => _PilaState();
}

class _PilaState extends State<Pila> {
  late Color color;
  late int nivelBateria;
  late bool cargando;
  late Icon icon;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final celProvider = Provider.of<EstadoProvider>(context);
    final pref = Provider.of<Preferencias>(context);
    nivelBateria = celProvider.nivelBateria;
    color = nivelBateria > 49 ? pref.backgroundColor : celProvider.bateriaColor;
    cargando = celProvider.cargandoBateria;

    return Center(
        child: Container(
            // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
                color: cargando ? Color.fromARGB(255, 5, 68, 161) : color,
                borderRadius: BorderRadius.circular(80),
                border: Border.all(
                    color: Theme.of(context).primaryColor, width: 0.5)),
            child: Center(
              child: Stack(children: [
                Center(
                    child: Icon(
                  Icons.battery_std_outlined,
                  color: Colors.white24,
                )),
                Center(
                  child: Text(
                    '$nivelBateria%',
                    style: TextStyle(
                        fontSize: nivelBateria < 100 ? 30 : 25,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ) // Icon(Icons.battery_std, size: 40.0, color: Colors.white),
            ));
  }
}
