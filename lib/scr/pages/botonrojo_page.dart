import 'package:flutter/material.dart';

import 'package:piproy/scr/models/contactos_modelo.dart';
import 'package:piproy/scr/pages/contacts_por_grupo.dart';

import 'package:piproy/scr/pages/envio_emergencia.dart';
import 'package:piproy/scr/providers/aplicaciones_provider.dart';
import 'package:piproy/scr/providers/contactos_provider.dart';
import 'package:piproy/scr/providers/provider_pref.dart';

import 'package:piproy/scr/widgets/header_app.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../funciones/url_funciones.dart';
import '../models/api_tipos.dart';
import '../providers/db_provider.dart';

class BotonRojoPage extends StatefulWidget {
  @override
  State<BotonRojoPage> createState() => _BotonRojoPageState();
}

class _BotonRojoPageState extends State<BotonRojoPage> {
  final listaSelectInfo = new ContactosProvider();
  List<ContactoDatos> listaIdContacto = [];

  List<ContactoDatos> listaE = [];
  late String mensaje;

  List<ContactoDatos> listaContactos = [];
  bool hayLista = true;

  @override
  void initState() {
    super.initState();
    cargarPrefs();
  }

  cargarPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    mensaje = prefs.getString('mensajeE') ?? "Necesito ayuda";
  }

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<AplicacionesProvider>(context);

    List<ContactoDatos> listaGrupo = [];
    if (apiProvider.contactgrupos.contains('Emergencia')) {
      if (apiProvider.categoryContact['Emergencia']!.isNotEmpty) {
        //*** con los nombres de la lista de contactos genero lista con los datos de cada contacto */
        listaContactos = [];
        listaContactos.addAll(apiProvider.categoryContact['Emergencia']!);
      }
    }
    Future<List<ContactoDatos>> obtenerListaGrupo() async {
      if (listaContactos.isEmpty) {
        List<ContactoDatos> lista =
            await apiProvider.obtenerListaContactosGrupo(context, 'Emergencia');

        listaContactos.addAll(lista);
      }
      return listaContactos;
    }

    return SafeArea(
      child: Scaffold(
        appBar:
            headerApp(context, 'Emergencia', Text(''), 0.0, false, 'BotonRojo'),
        //appBar: headerEmergencia(context),
        body: FutureBuilder(
            future: obtenerListaGrupo(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  listaGrupo.addAll(snapshot.data);
                }

                if (listaGrupo.isNotEmpty) {
                  // snapshot contiene lista de displayname de los contactos por grupo
                  return conListaEmergenia(context, snapshot.data);
                } else {
                  return sinListaEmergenia(context);
                }
              }
            }),
      ),
    );
  }
}

conListaEmergenia(BuildContext context, List<ContactoDatos> listaE) {
  final pref = Provider.of<Preferencias>(context);
  // double width = MediaQuery.of(context).size.width / 3;
  double height = (MediaQuery.of(context).size.height * 0.60);
  return SingleChildScrollView(
    child: Center(
      child: Container(
        height: height,
        margin: EdgeInsets.only(left: 10.0, bottom: 25, right: 10),
        //   alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Enviar mensaje de emergencia y llamar a  contactos establecidos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 35.0,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () async {
                //******************* */
                // await mandarSMS(listaE);
                // final AudioCache player = new AudioCache();
                //player.play('audio_emergencia.mpeg');

                await mandarSMS(listaE);

                await llamar(pref.telefonoEmergencia);
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResumenEnvioPage()));

                Navigator.pop(context);
              },
              child: Container(
                height: MediaQuery.of(context).size.width <= 320 ? 150 : 180,
                width: MediaQuery.of(context).size.width <= 320 ? 150 : 180,
                decoration: BoxDecoration(
                    color: pref.paleta == '4'
                        ? Colors.black
                        : Colors.red[900], //Colors.white,
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                        color: pref.paleta == '4'
                            ? Theme.of(context).primaryColor
                            : Colors.red[900]!,
                        width: 4.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(2, 5),
                      ),
                    ]),
                child: Center(
                  child: Text('Enviar',
                      style: TextStyle(
                        fontSize: 50.0,
                        color: //pref.paleta == '4'
                            //?
                            Theme.of(context).primaryColor,
                        // : Colors.white //Colors.black,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

sinListaEmergenia(BuildContext context) {
  final pref = Provider.of<Preferencias>(context);
  double height = (MediaQuery.of(context).size.height * 0.70);

  return SingleChildScrollView(
    child: Center(
        child: Container(
      height: height,
      margin: EdgeInsets.only(left: 10.0, bottom: 80, right: 10),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Debe registrar sus contactos de emergencia para poder notificar la emergencia',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: // pref.paleta == '4'
                    //?
                    Theme.of(context).primaryColor,
                //    : Colors.white,
                fontSize: 30.0,
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          pref.modoConfig
              ? ElevatedButton(
                  onPressed: () {
                    final String grupo = 'Emergencia';
                    final apiProvider = new AplicacionesProvider();

                    if (!apiProvider.contactgrupos.contains(grupo)) {
                      Provider.of<AplicacionesProvider>(context, listen: false)
                          .agregarGrupoContact(grupo);
                      final nuevo =
                          new ApiTipos(grupo: grupo, nombre: "", tipo: "2");
                      DbTiposAplicaciones.db.nuevoTipo(nuevo);
                    }
                    Provider.of<AplicacionesProvider>(context, listen: false)
                        .tipoSeleccion = grupo;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactsPorGrupoPage()));
                  },
                  child: Container(
                    width: 100,
                    child: Center(
                      child: Text(
                        'registrar',
                      ),
                    ),
                  ))
              : Container(),
          SizedBox(
            height: 50.0,
          ),
        ],
      ),
    )),
  );
}
