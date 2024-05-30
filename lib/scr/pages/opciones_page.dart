import 'package:flutter/material.dart';

import 'package:piproy/scr/providers/provider_pref.dart';
import 'package:piproy/scr/sharedpreferences/usuario_pref.dart';

import 'package:piproy/scr/widgets/header_app.dart';
import 'package:provider/provider.dart';

class OpcionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pref = Provider.of<Preferencias>(context);

    double padding = (MediaQuery.of(context).size.width - 280) / 2 > 0
        ? (MediaQuery.of(context).size.width - 320) / 2
        : 0;

    List<Widget> opciones = [
      Divider(
        height: 2,
        color: Theme.of(context).primaryColor,
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: padding),
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          children: [
            GestureDetector(
              onTap: () {
                SharedPref().iTelefono = !pref.iTelefono;
                pref.iTelefono = !pref.iTelefono;
              },
              child: IconOpcion(
                  iconop: Icons.call,
                  icontext: 'telefono',
                  activo: pref.iTelefono),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
                onTap: () {
                  SharedPref().iLinterna = !pref.iLinterna;
                  pref.iLinterna = !pref.iLinterna;
                },
                child: IconOpcion(
                    iconop: Icons.filter_alt,
                    icontext: 'linterna',
                    activo: pref.iLinterna)),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
                onTap: () {
                  SharedPref().iMensaje = !pref.iMensaje;
                  pref.iMensaje = !pref.iMensaje;
                },
                child: IconOpcion(
                    iconop: Icons.chat,
                    icontext: 'mensaje',
                    activo: pref.iMensaje)),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
                onTap: () {
                  SharedPref().iReloj = !pref.iReloj;
                  pref.iReloj = !pref.iReloj;
                },
                child: IconOpcion(
                    iconop: Icons.access_alarm,
                    icontext: 'reloj',
                    activo: pref.iReloj)),
          ],
        ),
      ),
      Divider(
        height: 2,
        color: Theme.of(context).primaryColor,
      ),
      GestureDetector(
        onTap: () {
          SharedPref().iGoogle = !pref.iGoogle;
          pref.iGoogle = !pref.iGoogle;
        },
        child: GoogleOpcion(
          onoff: pref.iGoogle,
        ),
      ),
      Divider(
        height: 2,
        color: Theme.of(context).primaryColor,
      ),
      GestureDetector(
          onTap: () {
            SharedPref().iContactos = !pref.iContactos;
            pref.iContactos = !pref.iContactos;
          },
          child: OpcionOnOff(texto: 'Contactos', onoff: pref.iContactos)),
      //   ),
      Divider(
        height: 2,
        color: Theme.of(context).primaryColor,
      ),
      GestureDetector(
          onTap: () {
            SharedPref().iAplicaciones = !pref.iAplicaciones;
            pref.iAplicaciones = !pref.iAplicaciones;
          },
          child: OpcionOnOff(
            texto: 'Aplicaciones',
            onoff: pref.iAplicaciones,
          )),

      Divider(
        height: 2,
        color: Theme.of(context).primaryColor,
      ),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: headerApp(context, 'Opciones Menu Principal', Text(''), 0.0,
            true, 'Opciones'),
        //    backgroundColor: Colors.white,
        body: Container(
          // padding: EdgeInsets.only(bottom: 40),
          child: ListView.builder(
              padding: EdgeInsets.only(bottom: 100),
              itemCount: opciones.length,
              itemBuilder: (context, i) {
                return opciones[i];
              }),
        ),
      ),
    );
  }
}

class OpcionOnOff extends StatelessWidget {
  const OpcionOnOff({
    super.key,
    required this.texto,
    required this.onoff,
  });

  final String texto;
  final onoff;
  @override
  Widget build(BuildContext context) {
    final pref = Provider.of<Preferencias>(context);
    return Container(
      height: 90,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
          color: onoff
              ? pref.backgroundColor
              : pref.backgroundColor.withOpacity(0.5),
          // color:
          //     /** es un contacto o grupo de contacto */
          //     Colors.green,
          borderRadius: BorderRadius.circular(60.0),
          border: Border.all(
            color: onoff
                ? Theme.of(context).primaryColor
                : Theme.of(context).primaryColor.withOpacity(0.4),
          )),
      child: Center(
        child: Text(
          texto,
          style: TextStyle(
            color: onoff
                ? Theme.of(context).primaryColor
                : Theme.of(context).primaryColor.withOpacity(0.4),
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

class GoogleOpcion extends StatelessWidget {
  GoogleOpcion({
    super.key,
    required this.onoff,
  });
  final bool onoff;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
          color: onoff
              ? Colors.white
              : Theme.of(context).primaryColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(60.0),
          border: Border.all(
              color: Colors.black26, // Theme.of(context).primaryColor,
              width: 0.5)),
      child: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: 20,
          ),
          Container(
            child: Center(
                child: onoff
                    ? Image(
                        image: AssetImage('assets/google.png'),
                        fit: BoxFit.fill)
                    : Text(
                        'Google',
                        style: TextStyle(
                            fontSize: 35,
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.4)),
                      )),
            height: 40,
            width: 195,
            //color: Colors.red),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.search,
            color: Colors.blue,
            size: 35,
          ),
        ]),
      ),
    );
    // Stack(children: [
    //   Container(
    //     height: 90,
    //     child: Container(
    //       height: 40,
    //       margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    //       // alignment: Alignment.center,
    //       child: Container(
    //         height: 40,
    //         margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
    //         decoration: BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.circular(20.0),
    //             border: Border.all(
    //                 color: Colors.black, // Theme.of(context).primaryColor,
    //                 width: 0.5)),
    //         child: Center(
    //           child: Stack(children: [
    //             Text(
    //               'activar o desactivar busqueda en google',
    //               style: TextStyle(color: Colors.white),
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 SizedBox(
    //                   width: 20,
    //                 ),
    //                 Container(
    //                   child: Center(
    //                       child: Image(
    //                           image: AssetImage('assets/google.png'),
    //                           fit: BoxFit.fill)),
    //                   height: 40,
    //                   width: 195,
    //                   //color: Colors.red),
    //                 ),
    //                 SizedBox(
    //                   width: 10,
    //                 ),
    //                 Icon(
    //                   Icons.search,
    //                   color: Colors.blue,
    //                   size: 35,
    //                 ),
    //               ],
    //             ),
    //           ]),
    //         ),
    //       ),
    //     ),
    //   ),
    //   pref.iGoogle
    //       ? Container()
    //       : Container(
    //           height: 60,
    //           // color: Colors.yellow,
    //           margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    //           // alignment: Alignment.center,
    //           child: Container(
    //               height: 40,
    //               margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
    //               decoration: BoxDecoration(
    //                   color: Colors.white.withOpacity(0.7),
    //                   borderRadius: BorderRadius.circular(20.0),
    //                   border: Border.all(
    //                       color: Colors
    //                           .black, // Theme.of(context).primaryColor,
    //                       width: 0.5)))),
    // ]);
  }
}

class IconOpcion extends StatelessWidget {
  const IconOpcion(
      {required this.iconop, required this.icontext, required this.activo});

  final bool activo;
  final IconData iconop;
  final String icontext;

  @override
  Widget build(BuildContext context) {
    final pref = Provider.of<Preferencias>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
                color: activo
                    ? pref.backgroundColor
                    : pref.backgroundColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(80),
                border: Border.all(
                    color: activo
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColor.withOpacity(0.4),
                    width: 2.0)),
            child: Icon(
              iconop,
              size: 40.0,
              color: activo
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColor.withOpacity(0.4),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Text(icontext,
                style: TextStyle(
                  color: activo
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColor.withOpacity(0.1),
                ) //,Colors.white60),
                ),
          ),
        ],
      ),
    );
  }
}
