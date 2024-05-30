import 'package:flutter/material.dart';

import 'package:piproy/scr/models/contactos_modelo.dart';
import 'package:piproy/scr/providers/aplicaciones_provider.dart';
import 'package:piproy/scr/sharedpreferences/usuario_pref.dart';

import 'package:piproy/scr/widgets/tres_botones_header.dart';
import 'package:provider/provider.dart';

import '../providers/provider_pref.dart';
import '../widgets/header_app.dart';

class ContactLlamadaEmrgencia extends StatefulWidget {
  @override
  State<ContactLlamadaEmrgencia> createState() =>
      _ContactLlamadaEmrgenciaState();
}

class _ContactLlamadaEmrgenciaState extends State<ContactLlamadaEmrgencia> {
  List<ContactoDatos> listaGrupo = [];

  Future<List<ContactoDatos>> obtenerListaGrupo() async {
    final apiProvider = Provider.of<AplicacionesProvider>(context);

    List<ContactoDatos> lista =
        await apiProvider.obtenerListaContactosGrupo(context, 'Emergencia');
    listaGrupo = [];
    listaGrupo.addAll(lista);
    // abilitarBusqueda = true;
    return listaGrupo;
  }

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<AplicacionesProvider>(context);
    final grupo = apiProvider.tipoSeleccion;
    // final listaGrupo = generarLista(
    //     apiProvider.categoryContact[grupo], contactosProvaide.listaContactos);

    // bool hayBusqueda = _searchController.text.isNotEmpty;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: SafeArea(
          child: Scaffold(
              appBar: headerApp(context, 'Contacto Llamada Emergencia',
                  Text(''), 0.0, true, 'ContactoLlamada'),
              resizeToAvoidBottomInset: false,
              body: FutureBuilder(
                  future: obtenerListaGrupo(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.hasData) {
                        List<Widget> listaContact = List.generate(
                            snapshot.data.length,
                            (i) => Contacto(
                                contactoSelec: snapshot.data[i],
                                apiProvider: apiProvider,
                                grupo: grupo));
                        if (listaContact.length == 0) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                                child: Text(
                                    'Debes definir primero tus contactos de envío de mensaje de emergencia',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.red[900]))),
                          );
                        } else {
                          return Container(
                            padding: EdgeInsets.only(bottom: 55),
                            child: ListView.builder(
                                padding: EdgeInsets.only(
                                  bottom: 220,
                                ),
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, i) {
                                  return listaContact[i];
                                }),
                            //),
                          );
                        }

                        // GestureDetector(
                        //   onTap: () {
                        //     FocusScope.of(context)
                        //         .requestFocus(new FocusNode());
                        //   },
                        //   child:
                      } else {
                        return Container(
                          child: Center(
                              child: Text(
                                  'Debes definir primero tus contactos de envío de mensaje de emerggencia',
                                  style: TextStyle(color: Colors.red[900]))),
                        );
                      }
                    }
                  }),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton.extended(
                  heroTag: "guardar",
                  icon: Icon(
                    Icons.save,
                  ),
                  label: Text(
                    'guardar',
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }))),
    );
  }

  Widget busqueda(BuildContext context, bool hayBusqueda) {
    return
        //AppBar(
        // backgroundColor: Color.fromRGBO(55, 57, 84, 1.0),
        // automaticallyImplyLeading: false,
        // flexibleSpace:
        Container(

            // margin: EdgeInsets.only(top: 5, left: 5.0, right: 5.0),
            height: 255.0,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                tresBotonesHeader(context, true, 'ContactoSeleccion'),
              ],
            ));
  }
}

class Contacto extends StatefulWidget {
  const Contacto({
    required this.contactoSelec,
    required this.apiProvider,
    required this.grupo,
  });

  final ContactoDatos contactoSelec;
  final AplicacionesProvider apiProvider;
  final String grupo;

  @override
  State<Contacto> createState() => _ContactoState();
}

class _ContactoState extends State<Contacto> {
  @override
  Widget build(BuildContext context) {
    final pref = Provider.of<Preferencias>(context);

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        width: double.infinity,
        height: 96.0,
        decoration: BoxDecoration(
            color: widget.contactoSelec.telefono == pref.telefonoEmergencia
                ? pref.backgroundColor
                : pref.backgroundColor.withOpacity(0.3), //Colors.grey[700],
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Theme.of(context).primaryColor)),
        child: Center(
            child: Text(widget.contactoSelec.nombre,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color:
                        widget.contactoSelec.telefono == pref.telefonoEmergencia
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColor.withOpacity(0.3),
                    fontSize: 30))),
      ),
      onTap: () {
        if (widget.contactoSelec.telefono != pref.telefonoEmergencia) {
          /// ********* cambio el telefono de emergencia
          pref.telefonoEmergencia = widget.contactoSelec.telefono;
          SharedPref().telefonoEmergencia = widget.contactoSelec.telefono;
        } else {
          pref.eliminarLLamadaEmergencia();
          pref.telefonoEmergencia = "";
          SharedPref().telefonoEmergencia = "";
        }
        setState(() {});
      },
    );
  }
}
