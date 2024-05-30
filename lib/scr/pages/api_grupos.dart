import 'package:flutter/material.dart';

import 'package:piproy/scr/pages/api_por_grupos.dart';

import 'package:piproy/scr/widgets/crear_grupo_api.dart';
import 'package:piproy/scr/widgets/elementos.dart';
import 'package:piproy/scr/widgets/elimina_grupo_api.dart';
import 'package:piproy/scr/widgets/envia_prupo_api_mp.dart';
import 'package:piproy/scr/widgets/header_app.dart';
import 'package:provider/provider.dart';

import 'package:piproy/scr/providers/aplicaciones_provider.dart';

import '../providers/provider_pref.dart';

class ApiGruposPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<AplicacionesProvider>(context);
    final List<String> listaGrupos = apiProvider.apigrupos;
    final pref = Provider.of<Preferencias>(context);
    return SafeArea(
        child: Scaffold(
      appBar: headerApp(
          context, 'Grupos Aplicaciones', Text(''), 0.0, true, 'ApiGrupos'),
      resizeToAvoidBottomInset: false,
      //  backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        padding: EdgeInsets.only(bottom: 55),
        child: ListView.builder(
            padding: EdgeInsets.only(bottom: 65),
            itemCount: listaGrupos.length,
            itemBuilder: (context, i) {
              return grupo(context, listaGrupos[i]);
            }),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: pref.modoConfig
          ?
          //BotonFlotante(pagina: 'grupoApi'),
          FloatingActionButton.extended(
              heroTag: "agregar",
              icon: Icon(
                Icons.add,
              ),
              label: Text(
                'agregar',
              ),
              onPressed: () {
                // SELECCION DE API POR TIPO
                //_seleccionApi(context, tipo);
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
    double ancho = 250;
    final pref = Provider.of<Preferencias>(context);
    if (width <= 320) {
      ancho = 160;
    }
    return GestureDetector(
      onLongPress: () {
        if (grupo != 'Todas' && pref.modoConfig) {
          editarTipo(context, grupo);
        }
      },
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 3, horizontal: 4.0),
          height: 60,
          decoration: BoxDecoration(
              color: pref.backgroundColor,
              borderRadius: BorderRadius.circular(60.0),
              border: Border.all(color: Theme.of(context).primaryColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  if (grupo != 'Todas') {
                    agregaMPD(context, grupo);
                  }
                },
                child: grupo != 'Todas' && pref.modoConfig
                    ? Container(
                        width: 50,
                        height: 90,
                        child: Center(
                          child: Icon(
                            Icons.arrow_back,
                            size: 40,
                            color: Color.fromARGB(
                                255, 228, 220, 57), // Colors.blue,
                          ),
                        ),
                      )
                    : Container(),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<AplicacionesProvider>(context, listen: false)
                      .tipoSeleccion = grupo;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ApiPorGrupoPage()));
                },
                child: Container(
                  width: ancho,
                  // color: Theme.of(context),
                  child: Center(
                    child: Text(
                      grupo,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (grupo != 'Todas') {
                    eliminarTipo(context, grupo);
                  }
                },
                child: grupo != 'Todas' && pref.modoConfig
                    ? Container(
                        width: 50,
                        height: 90,
                        child: Icon(
                          Icons.close,
                          size: 40,
                          color: Colors.red,
                        ),
                      )
                    : Container(),
              ),
            ],
          )),
    );
  }
}
