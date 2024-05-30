import 'package:flutter/material.dart';

import 'package:piproy/scr/models/api_tipos.dart';

import 'package:piproy/scr/pages/contacts_por_grupo.dart';

import 'package:piproy/scr/providers/db_provider.dart';
import 'package:piproy/scr/widgets/header_app.dart';
import 'package:provider/provider.dart';

import 'package:piproy/scr/providers/aplicaciones_provider.dart';

import '../providers/provider_pref.dart';

class ContactsGruposPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<AplicacionesProvider>(context);
    final List<String> listaGrupos = apiProvider.contactgrupos;
    final pref = Provider.of<Preferencias>(context);
    return SafeArea(
        child: Scaffold(
      appBar: headerApp(context, 'Grupos de Contactos', Text(''), 0.0, true,
          'ContactoGrupos'),
      resizeToAvoidBottomInset: false,
      // backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        padding: EdgeInsets.only(bottom: 50),
        child: ListView.builder(
            padding: EdgeInsets.only(bottom: 100),
            itemCount: listaGrupos.length,
            itemBuilder: (context, i) {
              return grupo(context, listaGrupos[i]);
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: pref.modoConfig
          ? FloatingActionButton.extended(
              heroTag: "agregar",
              icon: Icon(
                Icons.add,
              ),
              label: Text(
                'agregar',
              ),
              onPressed: () {
                //Definir nuevo grupo
                crearTipo(context);
              })
          : Container(),
    ));
  }

  Widget grupo(
    BuildContext context,
    String grupo,
  ) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    double ancho = 240;
    final pref = Provider.of<Preferencias>(context);

    if (width <= 320) {
      ancho = 200;
    }
    return GestureDetector(
        onLongPress: () {
          /// Cambiar nombre de grupo de contacto
          ///
          if (grupo != 'Todos' && pref.modoConfig) {
            editarTipo(context, grupo);
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 3, horizontal: 4.0),
          height: 70,
          decoration: BoxDecoration(
              color: pref.backgroundColor,
              borderRadius: BorderRadius.circular(60.0),
              border: Border.all(color: Theme.of(context).primaryColor)),
          child: grupo != 'Todos' && pref.modoConfig
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      GestureDetector(
                          onTap: () {
                            // if (grupo != 'Todos') {
                            //**  agrega grupo de contacto al menu principal */
                            agregaMPC(context, grupo);
                            // }
                          },
                          child: Container(
                            width: 50,
                            height: 90,
                            child: Center(
                              child: Icon(
                                Icons.arrow_back,
                                size: 40,
                                color: Color.fromARGB(255, 228, 220, 57),
                              ),
                            ),
                          )),
                      GestureDetector(
                        onTap: () {
                          Provider.of<AplicacionesProvider>(context,
                                  listen: false)
                              .tipoSeleccion = grupo;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactsPorGrupoPage()),
                          );
                        },
                        child: Container(
                          width: ancho,
                          child: Center(
                            child: Text(
                              grupo,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 40,
                              ), // fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            eliminarTipo(context, grupo);
                          },
                          child: grupo != 'Emergencia'
                              ? Container(
                                  width: 50,
                                  height: 90,
                                  child: Icon(
                                    Icons.close,
                                    size: 40,
                                    color: Colors.red,
                                  ),
                                )
                              : Container())
                    ])
              : GestureDetector(
                  onTap: () {
                    Provider.of<AplicacionesProvider>(context, listen: false)
                        .tipoSeleccion = grupo;
                    // pref.modoConfig
                    //     ?
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactsPorGrupoPage()),
                    );
                    // : Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ContactsGrupoPage()),
                    //   );
                  },
                  child: Container(
                    // width:,
                    child: Center(
                      child: Text(
                        grupo,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 40,
                        ), // fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
        ));
  }

  ///
  ///************** CREA  CATEGORIA ************/
  ///

  Future crearTipo(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return crearGrupoForm(context);
        });
  }

  AlertDialog crearGrupoForm(BuildContext context) {
    final apiProvider = Provider.of<AplicacionesProvider>(context);
    final TextEditingController _tipoControle = TextEditingController();
    double height = (MediaQuery.of(context).size.height);
    return AlertDialog(
      content: Form(
        child: Container(
          height: height <= 500 ? 70 : 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height <= 500 ? 10 : 90,
                child: Text('Crear grupo de Contacto',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: height <= 500 ? 10 : 30,
                    )),
              ),
              SizedBox(
                height: height <= 500 ? 2 : 10,
              ),
              Container(
                height: 40, // height <= 500 ? 24 : 30,
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: height <= 500 ? 15 : 25,
                  ),
                  controller: _tipoControle,
                  validator: (valor) {
                    // validar que no exite ya

                    return valor != '' ? null : "dato invalido";
                  },
                  decoration: InputDecoration(hintText: "nombre del grupo"),
                ),
              )
            ],
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        Container(
          height: 50, // height <= 500 ? 20 : 30,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  //change width and height on your need width = 200 and height = 50
                  // minimumSize: Size(30, 20),
                  backgroundColor: Color.fromRGBO(249, 75, 11, 1)),
              onPressed: () {
                String grupo = '';
                if (_tipoControle.value.text.isNotEmpty) {
                  //   grupo = grupo.trim(_tipoControle.value.text);
                  grupo = _tipoControle.value.text[0].toUpperCase() +
                      _tipoControle.value.text.substring(1);

                  // no puede estar en blanco ni ya definido
                  if (!apiProvider.contactgrupos.contains(grupo)) {
                    // agregar a BD

                    apiProvider.agregarGrupoContact(grupo);
                    final nuevo =
                        new ApiTipos(grupo: grupo, nombre: "", tipo: "2");
                    DbTiposAplicaciones.db.nuevoTipo(nuevo);
                  }

                  Navigator.of(context).pop();
                }
              },
              child: Text(
                'Si',
                style: TextStyle(
                    fontSize: height <= 500 ? 15 : 25, color: Colors.white),
              )),
        ),
        Container(
          height: 50, //height <= 500 ? 20 : 30,
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  //change width and height on your need width = 200 and height = 50
                  //minimumSize: Size(30, 20),
                  backgroundColor: Color.fromRGBO(249, 75, 11, 1)),
              child: Text(
                'No',
                style: TextStyle(
                    fontSize: height <= 500 ? 15 : 25, color: Colors.white),
              )),
        ),
      ],
    );
  }

  ///
  ///************** ELIMINA CATEGORIA ************/
  ///
  Future eliminarTipo(BuildContext context, String grupo) async {
    if (grupo == 'Todos' || grupo == 'Emergencia') {
      return;
    }

    return await showDialog(
        context: context,
        builder: (context) {
          return eliminarGrupoForm(context, grupo);
        });
  }

  AlertDialog eliminarGrupoForm(BuildContext context, String grupo) {
    final apiProvider = Provider.of<AplicacionesProvider>(context);
    return AlertDialog(
      title: Text(
        '$grupo',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
      content: Text('¿Desea elimiar este grupo de contacto  ?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          )),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        Container(
          height: 50,
          child: ElevatedButton(
              onPressed: () {
                // Eliminar de categoria

                Provider.of<AplicacionesProvider>(context, listen: false)
                    .eliminarContactTipos(grupo);
                // eliminar  en la  BD
                DbTiposAplicaciones.db.eliminarGrupo(grupo);

                ///
                ///         ELIMNAR DEL MENU PRINCIPAL

                if (apiProvider.listaMenu.contains('MPC' + grupo)) {
                  Provider.of<AplicacionesProvider>(context, listen: false)
                      .eliminarTipoMP('MPG' + grupo);
                  DbTiposAplicaciones.db.eliminarGrupoMP(grupo);
                }

                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  //change width and height on your need width = 200 and height = 50
                  // minimumSize: Size(30, 20),
                  backgroundColor: Color.fromRGBO(249, 75, 11, 1)),
              child: Text(
                'Si',
                style: TextStyle(fontSize: 25, color: Colors.white),
              )),
        ),
        Container(
          height: 50,
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  //change width and height on your need width = 200 and height = 50
                  //: Size(30, 20),
                  backgroundColor: Color.fromRGBO(249, 75, 11, 1)),
              child: Text(
                'No',
                style: TextStyle(fontSize: 25, color: Colors.white),
              )),
        ),
      ],
    );
  }

  Future agregaMPC(BuildContext context, String grupo) async {
    // grupo es el nombre de categoria a agregar al menu principal
    return await showDialog(
        context: context,
        builder: (context) {
          return agregaMpcForm(context, grupo);
        });
  }

  AlertDialog agregaMpcForm(BuildContext context, String grupo) {
    final apiProvider = Provider.of<AplicacionesProvider>(context);
    return AlertDialog(
      content:
          Text('¿Desea crear  acceso directo de $grupo  en menu principal?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              )),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        Container(
          height: 50,
          child: ElevatedButton(
              onPressed: () {
                final nuevo =
                    new ApiTipos(grupo: 'MPE', nombre: grupo, tipo: "3");
                if (!apiProvider.listaMenu.contains('MPE' + grupo)) {
                  /// actualizar lista MENU
                  ///
                  Provider.of<AplicacionesProvider>(context, listen: false)
                      .agregarMenu('MPE' + grupo);

                  DbTiposAplicaciones.db.nuevoTipo(nuevo);
                }

                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  //change width and height on your need width = 200 and height = 50
                  // minimumSize: Size(30, 20),
                  backgroundColor: Color.fromRGBO(249, 75, 11, 1)),
              child: Text(
                'Si',
                style: TextStyle(fontSize: 25, color: Colors.white),
              )),
        ),
        Container(
          height: 50,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  //change width and height on your need width = 200 and height = 50
                  minimumSize: Size(30, 20),
                  backgroundColor: Color.fromRGBO(249, 75, 11, 1)),
              child: const Text('NO',
                  style: TextStyle(fontSize: 25, color: Colors.white))),
        ),
      ],
    );
  }
//******************** EDITA NOMBRE DEL GRUPO*****************************/

  Future editarTipo(BuildContext context, String grupo) async {
    if (grupo == 'Todos') {
      return;
    }
    if (grupo == 'Emergencia') {
      return;
    }
    return await showDialog(
        context: context,
        builder: (context) {
          return editarGrupoForm(context, grupo);
        });
  }

  AlertDialog editarGrupoForm(BuildContext context, String grupo) {
    final apiProvider = Provider.of<AplicacionesProvider>(context);
    final TextEditingController _tipoControle =
        TextEditingController(text: grupo);
    double height = (MediaQuery.of(context).size.height);
    return AlertDialog(
      content: Form(
        child: Container(
          height: height <= 500 ? 80 : 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height <= 500 ? 19 : 60,
                child: Text('Editar nombre de grupo de Contacto',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: height <= 500 ? 10 : 25,
                    )),
              ),
              SizedBox(
                height: height <= 500 ? 2 : 10,
              ),
              Container(
                height: height <= 500 ? 15 : 50,
                child: TextFormField(
                  // initialValue: grupo,
                  textCapitalization: TextCapitalization.words,

                  style: TextStyle(
                      fontSize: height <= 500 ? 15 : 25, color: Colors.black),
                  controller: _tipoControle,
                  validator: (valor) {
                    // validar que no exite ya

                    return valor != '' ? null : "dato invalido";
                  },
                  decoration: InputDecoration(hintText: "nombre del grupo"),
                ),
              )
            ],
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        Container(
          height: 50, // height <= 500 ? 20 : 30,
          child: ElevatedButton(
              onPressed: () {
                String grupoNuevo = "";
                if (_tipoControle.value.text.isNotEmpty) {
                  grupoNuevo = _tipoControle.value.text[0].toUpperCase() +
                      _tipoControle.value.text.substring(1);
                  // grupo = grupo.trim();

                  // no puede estar en blanco ni ya definido
                  if (!apiProvider.contactgrupos.contains(grupoNuevo)) {
                    // agregar a BD

                    apiProvider.cambiarGrupoContact(grupo, grupoNuevo);
                    if (apiProvider.listaMenu.contains('MPE' + grupo)) {
                      Provider.of<AplicacionesProvider>(context, listen: false)
                          .agregarMenu('MPE' + grupoNuevo);
                      Provider.of<AplicacionesProvider>(context, listen: false)
                          .eliminarTipoMP('MPE' + grupo);

                      DbTiposAplicaciones.db
                          .modificarNombre(grupo, grupoNuevo, 'MPE');
                    }
                    DbTiposAplicaciones.db.modificarGrupo(grupo, grupoNuevo);
                  }

                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                  //change width and height on your need width = 200 and height = 50
                  //minimumSize: Size(30, 20),
                  backgroundColor: Color.fromRGBO(249, 75, 11, 1)),
              child: Text(
                'Si',
                style: TextStyle(
                    fontSize: height <= 500 ? 15 : 25, color: Colors.white),
              )),
        ),
        Container(
          height: 50, // height <= 500 ? 20 : 30,
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  //change width and height on your need width = 200 and height = 50
                  // minimumSize: Size(30, 20),
                  backgroundColor: Color.fromRGBO(249, 75, 11, 1)),
              child: Text(
                'No',
                style: TextStyle(
                    fontSize: height <= 500 ? 15 : 25, color: Colors.white),
              )),
        ),
      ],
    );
  }
}
