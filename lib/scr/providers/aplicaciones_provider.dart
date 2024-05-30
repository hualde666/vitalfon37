import 'package:contacts_service/contacts_service.dart';
import 'package:device_apps/device_apps.dart';

import 'package:flutter/material.dart';

import 'package:piproy/scr/models/contactos_modelo.dart';
//import 'package:piproy/scr/pages/contact_seleccion.dart';
import 'package:piproy/scr/providers/contactos_provider.dart';

import 'package:piproy/scr/providers/db_provider.dart';
import 'package:piproy/scr/models/api_tipos.dart';
import 'package:provider/provider.dart';

class AplicacionesProvider with ChangeNotifier {
  static final AplicacionesProvider _aplicacionesProvider =
      AplicacionesProvider._internal();
  factory AplicacionesProvider() {
    return _aplicacionesProvider;
  }

  bool _cargando = true;
  String _tipoSeleccion = '';

 
  // guarda nombres de grupos de api
  List<String> _apigrupos = [
    'Todas',
  ];
  // guarda apis por grupo
  Map<String, List<Application>> categoryApi = {};
  
  // guarda nombres de grupos de contactos
  List<String> _contactgrupos = [
    'Todos',
  ];
  // guarda contactos por grupos
  Map<String, List<ContactoDatos>> categoryContact = {};

  List<String> listaMenu = [];

  AplicacionesProvider._internal() {
    categoryApi['Todas'] = [];
    categoryContact['Todos'] = [];
    categoryContact['Emergencia'] = [];

    /// cargarCategorias();
  }
  inicializar() {
    _apigrupos = [
      'Todas',
    ];
    _contactgrupos = [
      'Todos',
    ];
    categoryApi = {};
    categoryContact = {};
    listaMenu = [];

    categoryApi['Todas'] = [];
    categoryContact['Todos'] = [];
    // categoryContact['Emergencia'] = [];
    notifyListeners();
  }
//***********************************Widgets del menu principal */

  agregarApiGrupo(String grupo) {
    _apigrupos.add(grupo);
    categoryApi[grupo] = [];

    // _tipoSeleccion = tipo;
    _apigrupos.sort((a, b) {
      return a.toLowerCase().compareTo(b.toLowerCase());
    });

    notifyListeners();
  }

  bool get cargando => _cargando;
  String get tipoSeleccion => _tipoSeleccion;

  List<String> get apigrupos {
    final lista = _apigrupos;
    //*** devuelvo todos los grupos de apis que no estan en el menu principal, menos MPD */
    // revisar
    lista.remove('MPD');
    return lista;
  }

  List<String> get contactgrupos {
    final lista = _contactgrupos;
    //*** devuelvo todos los grupos de contactos menos MPD */
    lista.remove('MPD');
    return lista;
  }

  /// *************************************************************
  List<String> get listaCategoria {
    // cargarCategorias();
    final lista = listaMenu;

    return lista;
  }

  ///********************************** */
  List<String> get apitiposMenu {
// lista

    final List<String> lista = [];
    lista.addAll(_apigrupos.where((element) => element == 'MPD'));
    lista.sort((a, b) {
      return a.toLowerCase().compareTo(b.toLowerCase());
    });
    return lista;
  }

  set tipoSeleccion(String valor) {
    _tipoSeleccion = valor;

    notifyListeners();
  }

  // get listaApp {
  //   return _listaApp;
  // }

  // get listaSeleccion {
  //   return _listaSeleccion;
  // }

  obtenerListaSeleccion() async {
    String tipo = _tipoSeleccion;

    return categoryApi[tipo];
    // _listaSeleccion = categoryApi[tipo];
  }

//*************************************** CONTACTOS */
//************************************************* */
  obtenerListaContactos() {
    String tipo = _tipoSeleccion;

    return categoryContact[tipo];
    // _listaSeleccion = categoryApi[tipo];
  }

  //******************************* */
  // agrega grupo contacto
  agregarGrupoContact(String grupo) {
    _contactgrupos.add(grupo);
    categoryContact[grupo] = [];

    // _tipoSeleccion = tipo;
    _contactgrupos.sort((a, b) {
      return a.toLowerCase().compareTo(b.toLowerCase());
    });

    notifyListeners();
  }

  //******************************* */
  // agrega grupo contacto
  cambiarGrupoContact(String grupo, String grupoNuevo) {
    _contactgrupos.add(grupoNuevo);
    categoryContact[grupoNuevo] = [];
    categoryContact[grupoNuevo]?.addAll(categoryContact[grupo]!);
    categoryContact.remove(grupo);
    _contactgrupos.remove(grupo);
    _contactgrupos.sort((a, b) {
      return a.toLowerCase().compareTo(b.toLowerCase());
    });
    // _tipoSeleccion = tipo;

    notifyListeners();
  }

  //******************************* */
  // agrega contacto a grupo
  agregarContacto(String grupo, ContactoDatos contacto) {
    categoryContact[grupo]?.add(contacto);
    categoryContact[grupo]?.sort((a, b) {
      return a.nombre.toLowerCase().compareTo(b.nombre.toLowerCase());
    });
    notifyListeners();
  }

  //******************************* */
  // elimina contacto de grupo
  eliminarContacto(String grupo, ContactoDatos contacto) {
    categoryContact[grupo]?.remove(contacto);

    notifyListeners();
  }

  ordenerGrupoContacto(String grupo) {
    if (categoryContact[grupo]!.isNotEmpty) {
      categoryContact[grupo]?.sort((a, b) {
        return a.nombre.toLowerCase().compareTo(b.nombre.toLowerCase());
      });
    }
  }

  //******************************* */
  // elimina de grupo contacto
  eliminarContactTipos(String grupo) {
    _contactgrupos.removeWhere((element) => element == grupo);
    categoryContact.remove(grupo = grupo);
    notifyListeners();
  }

  //*************************************** APLICACIONES ***************/
  //****************************************************************** */

  //******************************* */
  // agrega  y elimina app en grupo
  modiApiListaPorTipo(Application api) {
    if (!categoryApi[_tipoSeleccion]!.contains(api)) {
      categoryApi[_tipoSeleccion]?.add(api);
      categoryApi[_tipoSeleccion]?.sort((a, b) {
        return a.appName.toLowerCase().compareTo(b.appName.toLowerCase());
      });
    } else {
      categoryApi[_tipoSeleccion]?.remove(api);
    }

    notifyListeners();
  }

  //******************************* */
  // elimina de grupo app
  eliminarTipos(String tipo) {
    _apigrupos.removeWhere((element) => element == tipo);
    categoryApi.remove(tipo = tipo);
    notifyListeners();
  }

  cambiarGrupoApi(String grupo, String grupoNuevo) {
    _apigrupos.add(grupoNuevo);
    categoryApi[grupoNuevo] = [];
    categoryApi[grupoNuevo]?.addAll(categoryApi[grupo]!);
    categoryApi.remove(grupo);
    _apigrupos.remove(grupo);
    _apigrupos.sort((a, b) {
      return a.toLowerCase().compareTo(b.toLowerCase());
    });
    // _tipoSeleccion = tipo;

    notifyListeners();
  }

  Future<Application?> obtenerApi(String nombre) async {
    // Application api;
    if (nombre != '') {
      Application? api = await DeviceApps.getApp(nombre, true);
      if (api != null) {
        return api;
      }
    }
    return null;
  }

  // obetnerLauncher() async {
  //   final resp1 = await DeviceApps.getInstalledApplications(
  //       includeAppIcons: true,
  //       includeSystemApps: true,
  //       onlyAppsWithLaunchIntent: true);
  //   return resp1;
  // }

  obtenerListaApiGrupo(String grupo) async {
    // final resp = await Permission.requestInstallPackages.request();
    // if (resp != PermissionStatus.granted) return;
    if (grupo == 'Todas') {
      // ******* obtengo Todas las app del celular */
      if (categoryApi['Todas']!.isEmpty) {
        final resp1 = await DeviceApps.getInstalledApplications(
            includeAppIcons: true,
            includeSystemApps: true,
            onlyAppsWithLaunchIntent: true);

        categoryApi['Todas']?.addAll(resp1);
      }
    } else {
      if (categoryApi[grupo] != []) {
        //*** obtengo lista de la BD tosas las apps del grupo */
        List<ApiTipos> lista =
            await DbTiposAplicaciones.db.obtenerAppsGrupo(grupo);
        for (var i = 0; i < lista.length; i++) {
          if (lista[i].nombre != '') {
            final api = await DeviceApps.getApp(lista[i].nombre, true);

            if (api != null) {
              if (!categoryApi[grupo]!.contains(api)) {
                categoryApi[grupo]?.add(api);
              }
            }
          }
        }
      }
    }

    if (categoryApi[grupo] != null) {
      categoryApi[grupo]?.sort((a, b) {
        return a.appName.toLowerCase().compareTo(b.appName.toLowerCase());
      });
      return categoryApi[grupo];
    }
  }
//******************** lista de contactos por gupos */

  obtenerListaContactosGrupo(BuildContext context, String grupo) async {
    final contactosProvaide = Provider.of<ContactosProvider>(context);

    if (categoryContact[grupo]!.isEmpty) {
      //*** obtengo lista de la BD todos los contactos del grupo */
      if (grupo == 'Todos') {
        List<Contact> lista = await contactosProvaide.getcontactos();
        // print('lista de contactos:     $lista');
        List<ContactoDatos> lista2 = [];
        // validar que contacto no esta eliminado
        for (var i = 0; i < lista.length; i++) {
          //print('$lista[i].displayName');
          String _nombre = lista[i].displayName ?? 'no hay nombre';
          String? _telefono = "";
          String _whatsapp = "";
          if (lista[i].phones!.length != 0) {
            _telefono = lista[i].phones?.elementAt(0).value ?? '';
            _whatsapp = lista[i].phones?.elementAt(0).value ?? '';
            // Item item = lista[i]
            //     .phones
            //    .firstWhere((element) => element.value!.substring(0, 1) == '+',
            //   orElse: () => null);
            // if (item != null) {
            // _whatsapp =item.value;
            //  }
          }
          if (_telefono != '') {
            final _contacto = new ContactoDatos(
              _nombre,
              _telefono,
              _whatsapp,
              lista[i].avatar,
              lista[i].initials(),
            );
            // categoryContact['Todos'].add((_contacto));
            lista2.add(_contacto);
          }
        }
        categoryContact['Todos'] = [];
        categoryContact['Todos']!.addAll(lista2);
      } else {
        List<ApiTipos> lista =
            await DbTiposAplicaciones.db.obtenerAppsGrupo(grupo);
        if (lista != []) {
          for (var i = 0; i < lista.length; i++) {
            if (lista[i].nombre != '') {
              final contacto =
                  await contactosProvaide.obtenerContacto(lista[i].nombre);

              //  if (contacto != null) {
              if (!categoryContact[grupo]!.contains(contacto)) {
                categoryContact[grupo]?.add(contacto);
                //        }
              }
            }
          }
        }
      }
    }

    if (categoryContact[grupo] != null) {
      categoryContact[grupo]?.sort((a, b) {
        return a.nombre.toLowerCase().compareTo(b.nombre.toLowerCase());
      });
      return categoryContact[grupo];
    }
    notifyListeners();
  }

  //******************************* */
  // agrega elemnto al menu principal
  agregarMenu(String tipo) {
    if (listaMenu.contains(tipo)) {
      return false;
    } else {
      listaMenu.add(tipo);
      listaMenu.sort((a, b) {
        return a.toLowerCase().compareTo(b.toLowerCase());
      });
      notifyListeners();
      return true;
    }
  }

  //******************************* */
  // elimina de elemento de menu principal

  eliminarTipoMP(String tipo) {
    listaMenu.remove(tipo);
    notifyListeners();
  }

  //******************************* */
  // elimina elemnto al menu principal
  eliminar(Application api) {
    categoryApi[_tipoSeleccion]!.remove(api);
    notifyListeners();
  }

  cargarCategorias() async {
    // obtengo lista de api por categorias

    if (_cargando) {
      final resp = await DbTiposAplicaciones.db.getAllRegistros();

      if (resp.isNotEmpty) {
        final resp2 = resp.map((s) => ApiTipos.fromJson(s)).toList();
        _cargando = false;
        //  print('********* listado  :$resp2');
        ordenarListasMenu(resp2);
      }
    }
    return;
  }

  ordenarListasMenu(List<ApiTipos> resp2) async {
    for (var i = 0; i < resp2.length; i++) {
      switch (resp2[i].grupo) {
        case 'MPA':
          {
            //contacto disado rapido
            listaMenu.add('MPA' + resp2[i].nombre);
            break;
          }
        case 'MPB':
          {
            //contacto directo a whatsapp
            listaMenu.add('MPB' + resp2[i].nombre);
            break;
          }
        case 'MPC':
          {
            //contacto con opcion a llamada y whatsapp
            listaMenu.add('MPC' + resp2[i].nombre);
            break;
          }
        case 'MPD':
          {
            // app
            listaMenu.add('MPD' + resp2[i].nombre);
            break;
          }
        case 'MPE':
          {
            //grupo contacto
            listaMenu.add('MPE' + resp2[i].nombre);
            break;
          }
        case 'MPF':
          {
            // grupo app
            listaMenu.add('MPF' + resp2[i].nombre);
            break;
          }

        default:
          {
            // grupo de api
            if (resp2[i].tipo == "1") {
              if (!_apigrupos.contains(resp2[i].grupo)) {
                _apigrupos.add(resp2[i].grupo);
                categoryApi[resp2[i].grupo] = [];
              }
            }

            /// grupo de contactos
            if (resp2[i].tipo == "2") {
              if (!_contactgrupos.contains(resp2[i].grupo)) {
                _contactgrupos.add(resp2[i].grupo);
                categoryContact[resp2[i].grupo] = [];
              }
            }

            break;
          }
      }
      //ordenar el menu alfabeticament
      //

      listaMenu.sort((a, b) {
        return a.toLowerCase().compareTo(b.toLowerCase());
      });
      // ordenor tipos de categoria alfabeticamente
      //
      _apigrupos.sort((a, b) {
        return a.toLowerCase().compareTo(b.toLowerCase());
      });
      _contactgrupos.sort((a, b) {
        return a.toLowerCase().compareTo(b.toLowerCase());
      });

      //**** ordenar los los grupos de contacto */
      for (var i = 0; i < _contactgrupos.length; i++) {
        String grupo = _contactgrupos[i];
        if (grupo != 'Todos') {
          if (categoryContact[grupo]!.isNotEmpty) {
            categoryContact[grupo]?.sort((a, b) {
              return a.nombre.toLowerCase().compareTo(b.nombre.toLowerCase());
            });
          }
        }
      }
    }
  }
}
