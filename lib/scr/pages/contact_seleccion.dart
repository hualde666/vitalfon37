import 'package:flutter/material.dart';

import 'package:piproy/scr/models/api_tipos.dart';
import 'package:piproy/scr/models/contactos_modelo.dart';
import 'package:piproy/scr/providers/aplicaciones_provider.dart';

import 'package:piproy/scr/providers/db_provider.dart';

import 'package:piproy/scr/widgets/tres_botones_header.dart';
import 'package:provider/provider.dart';

import '../providers/provider_pref.dart';
import '../widgets/avatar_contacto.dart';

class SelectContactsPage extends StatefulWidget {
  @override
  State<SelectContactsPage> createState() => _SelectContactsPageState();
}

class _SelectContactsPageState extends State<SelectContactsPage> {
  List<ContactoDatos> listaGrupo = [];
  bool abilitarBusqueda = false;
  bool hayBusqueda = true;
  bool buscar = false;
  TextEditingController _searchController = TextEditingController();
  List<ContactoDatos> listaContactosFiltro = [];
  @override
  void initState() {
    super.initState();
    //obtenerListaGrupo();
    _searchController.addListener(filtrarContactos);
  }

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  filtrarContactos() {
    if (_searchController.text.isNotEmpty) {
      List<ContactoDatos> _contactos = [];

      _contactos.addAll(listaGrupo);
      _contactos.retainWhere((contacto) {
        String busquedaMinuscula = _searchController.text.toLowerCase();
        String nombreMinuscula = contacto.nombre.toLowerCase();
        return nombreMinuscula.contains(busquedaMinuscula);
      });
      setState(() {
        listaContactosFiltro = [];
        listaContactosFiltro.addAll(_contactos);
      });
    }
  }

  Future<List<ContactoDatos>> obtenerListaGrupo() async {
    final apiProvider = Provider.of<AplicacionesProvider>(context);
    if (_searchController.text.isNotEmpty) {
      return listaContactosFiltro;
    } else {
      List<ContactoDatos> lista =
          await apiProvider.obtenerListaContactosGrupo(context, 'Todos');
      listaGrupo = [];
      listaGrupo.addAll(lista);
      // abilitarBusqueda = true;
      if (listaGrupo.length > 0) hayBusqueda = true;
      return listaGrupo;
    }
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
              appBar: PreferredSize(
                  preferredSize:
                      Size.fromHeight(250.0), // here the desired height
                  child: busqueda(context, hayBusqueda)),
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
                          hayBusqueda = false;

                          return Container(
                            child: Center(
                                child: Text('Debes definir tus contactos',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.red))),
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
                        hayBusqueda = false;
                        return Container(
                          child: Center(
                              child: Text('Debes definir tus contactos',
                                  style: TextStyle(color: Colors.red))),
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
                if (hayBusqueda)
                  Text(
                    'Seleccion de Contactos',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 25),
                  ),
                if (hayBusqueda)
                  GestureDetector(
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                        child: TextField(
                          // enabled: abilitarBusqueda,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Theme.of(context).primaryColor,
                              height: 1.0),
                          keyboardType: TextInputType.name,
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                          // ],
                          controller: _searchController,
                          // autofocus: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0))),
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20),
                            labelText: 'Buscar Contacto :',
                            suffixIcon: _searchController.text.isNotEmpty
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _searchController.clear();
                                        buscar = true;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color: Theme.of(context).primaryColor,
                                      size: 30,
                                    ))
                                : Icon(
                                    Icons.search,
                                    color: Theme.of(context).primaryColor,
                                    size: 30,
                                  ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0))),
                          ),
                        ),
                      )),
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
        padding: EdgeInsets.only(left: 4),
        width: double.infinity,
        height: 140.0,
        decoration: BoxDecoration(
            color: widget.apiProvider.categoryContact[widget.grupo]!
                    .contains(widget.contactoSelec)
                ? pref.backgroundColor
                : pref.backgroundColor.withOpacity(0.3), //Colors.grey[700],
            borderRadius: BorderRadius.circular(60.0),
            border: Border.all(color: Theme.of(context).primaryColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AvatarContacto(widget.contactoSelec),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Text(widget.contactoSelec.nombre,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: widget.apiProvider
                                      .categoryContact[widget.grupo]!
                                      .contains(widget.contactoSelec)
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.3),
                              fontSize: 30))),
                  Center(
                      child: Text(widget.contactoSelec.telefono,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: widget.apiProvider
                                      .categoryContact[widget.grupo]!
                                      .contains(widget.contactoSelec)
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.3),
                              fontSize: 25)))
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        if (widget.apiProvider.categoryContact[widget.grupo]!
            .contains(widget.contactoSelec)) {
          //eliminar
          Provider.of<AplicacionesProvider>(context, listen: false)
              .eliminarContacto(widget.grupo, widget.contactoSelec);

          DbTiposAplicaciones.db
              .deleteApi(widget.grupo, widget.contactoSelec.nombre);
        } else {
          //agregar

          Provider.of<AplicacionesProvider>(context, listen: false)
              .agregarContacto(widget.grupo, widget.contactoSelec);
          final nuevo = new ApiTipos(
              grupo: widget.grupo,
              nombre: widget.contactoSelec.nombre,
              tipo: "2");
          DbTiposAplicaciones.db.nuevoTipo(nuevo);
        }
        setState(() {});
      },
    );
  }
}
