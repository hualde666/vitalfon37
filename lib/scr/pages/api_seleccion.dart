import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

import 'package:piproy/scr/models/api_tipos.dart';
import 'package:piproy/scr/providers/aplicaciones_provider.dart';
import 'package:piproy/scr/providers/db_provider.dart';
import 'package:piproy/scr/widgets/header_app.dart';
import 'package:provider/provider.dart';

import '../providers/provider_pref.dart';

class ApiSeleccionPage extends StatelessWidget {
  final BuildContext context;
  ApiSeleccionPage({required this.context, required this.grupo});

  final String grupo;

  final List<Application> listaNueva = [];

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<AplicacionesProvider>(context);
    final grupo = apiProvider.tipoSeleccion;
    List<Application> listaNueva = [];
    List<Application>? listaVieja = [];
    List<Application> listaTodas = [];

    Future<List<Widget>> cargarListaGrupo() async {
      List<Application> lista = await apiProvider.obtenerListaApiGrupo(grupo);

      if (lista != []) {
        listaVieja.addAll(lista);

        listaNueva.addAll(listaVieja);
      }
      List<Application> lista2 =
          await apiProvider.obtenerListaApiGrupo('Todas');
      if (lista2 != []) {
        if (listaTodas.isEmpty) {
          listaTodas.addAll(lista2);
        }

        List<Widget> listaApi = List.generate(
            listaTodas.length,
            (i) => WidgetApi(
                listaNueva: listaNueva, context: context, api: listaTodas[i]));

        return listaApi;
      }
      return [];
    }

    return SafeArea(
      child: Scaffold(
        appBar: headerApp(
            context,
            'Seleccion Apps para: ',
            Text(
              '$grupo',
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
            40.0,
            true,
            'ApisSeleccion'),
        resizeToAvoidBottomInset: false,
        body: FutureBuilder(
            future: cargarListaGrupo(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  // snapshot contiene todas las app

                  return Container(
                    // padding: EdgeInsets.only(bottom: 70),
                    padding: EdgeInsets.only(bottom: 60, left: 1, right: 1),
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: snapshot.data,
                    ),
                  );
                } else {
                  return Container();
                }
              }
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:
            //BotonFlotante(pagina: 'selecApi'),
            FloatingActionButton.extended(
          heroTag: "guardar",
          icon: Icon(
            Icons.check,
          ),
          label: Text(
            'guardar',
          ),
          onPressed: () {
            for (var i = 0; i < listaVieja.length; i++) {
              if (!listaNueva.contains(listaVieja[i])) {
                // eliminar
                Provider.of<AplicacionesProvider>(context, listen: false)
                    .modiApiListaPorTipo(listaVieja[i]);
                DbTiposAplicaciones.db
                    .deleteApi(grupo, listaVieja[i].packageName);
              }
            }
            for (var i = 0; i < listaNueva.length; i++) {
              if (!listaVieja.contains(listaNueva[i])) {
                // agregar
                Provider.of<AplicacionesProvider>(context, listen: false)
                    .modiApiListaPorTipo(listaNueva[i]);
                final nuevo = new ApiTipos(
                    grupo: grupo, nombre: listaNueva[i].packageName, tipo: "1");
                DbTiposAplicaciones.db.nuevoTipo(nuevo);
              }
            }
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  // cambiarListas() {
  //   final apiProvider = Provider.of<AplicacionesProvider>(context);
  //   final tipo = apiProvider.tipoSeleccion;
  //   //final listaVieja = apiProvider.categoryApi[tipo];
  //   for (var i = 0; i < listaVieja.length; i++) {
  //     if (!listaNueva.contains(listaVieja[i])) {
  //       // eliminar
  //       Provider.of<AplicacionesProvider>(context, listen: true)
  //           .modiApiListaPorTipo(listaVieja[i]);
  //       DbTiposAplicaciones.db.deleteApi(tipo, listaVieja[i].packageName);
  //     }
  //   }
  //   for (var i = 0; i < listaNueva.length; i++) {
  //     if (!listaVieja.contains(listaNueva[i])) {
  //       // agregar
  //       Provider.of<AplicacionesProvider>(context, listen: true)
  //           .modiApiListaPorTipo(listaNueva[i]);
  //       final nuevo = new ApiTipos(
  //           grupo: grupo, tipo: tipo, nombre: listaNueva[i].packageName);
  //       DbTiposAplicaciones.db.nuevoTipo(nuevo);
  //     }
  //   }
  // }
}

class WidgetApi extends StatefulWidget {
  const WidgetApi({
    required this.listaNueva,
    required this.context,
    required this.api,
  });

  final List<Application> listaNueva;
  final BuildContext context;
  final Application api;

  @override
  State<WidgetApi> createState() => _WidgetApiState();
}

class _WidgetApiState extends State<WidgetApi> {
  @override
  Widget build(BuildContext context) {
    final selecionada = widget.listaNueva.contains(widget.api);
    final pref = Provider.of<Preferencias>(context, listen: false);
    Color color = selecionada ? pref.backgroundColor : Colors.grey[700]!;
    return GestureDetector(
      onTap: () {
        if (widget.api.packageName != "") {
          /// agregar o eliminar api
          ///
          // Provider.of<AplicacionesProvider>(context, listen: false)
          //    .modiApiListaPorTipo(api);

          if (widget.listaNueva.contains(widget.api)) {
            widget.listaNueva.remove(widget.api);
          } else {
            widget.listaNueva.add(widget.api);
          }
          setState(() {});
        }
      },
      child: Container(
        // width: 120,
        // height: 50,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Theme.of(context).primaryColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 5,
            ),
            Image.memory(
              (widget.api as ApplicationWithIcon).icon,
              width: 90,
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 50,
              width: 150,
              child: Text(
                widget.api.appName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  // color: pref.paleta == '2' || pref.paleta == '5'
                  //     ? Colors.black
                  //     : Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
