import 'package:flutter/material.dart';
import 'package:piproy/scr/providers/aplicaciones_provider.dart';
import 'package:piproy/scr/providers/db_provider.dart';
import 'package:provider/provider.dart';

//******************** EDITA NOMBRE DEL GRUPO  apis*****************************/

Future editarTipo(BuildContext context, String grupo) async {
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
        height: height <= 500 ? 80 : 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height <= 500 ? 19 : 60,
              child: Text('Editar nombre de grupo de Aplicación',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: height <= 500 ? 10 : 25, color: Colors.black)),
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
        height: 50, //height <= 500 ? 20 : 30,
        child: ElevatedButton(
            onPressed: () {
              // no puede estar en blanco ni ya definido
              String grupoNuevo;
              if (_tipoControle.value.text.isNotEmpty) {
                grupoNuevo = _tipoControle.value.text[0].toUpperCase() +
                    _tipoControle.value.text.substring(1);

                if (!apiProvider.apigrupos.contains(grupoNuevo)) {
                  // agregar a BD

                  apiProvider.cambiarGrupoApi(grupo, grupoNuevo);
                  if (apiProvider.listaMenu.contains('MPF' + grupo)) {
                    Provider.of<AplicacionesProvider>(context, listen: false)
                        .agregarMenu('MPF' + grupoNuevo);
                    Provider.of<AplicacionesProvider>(context, listen: false)
                        .eliminarTipoMP('MPF' + grupo);

                    DbTiposAplicaciones.db
                        .modificarNombre(grupo, grupoNuevo, 'MPF');
                  }
                  DbTiposAplicaciones.db.modificarGrupo(grupo, grupoNuevo);
                }

                Navigator.of(context).pop();
              }
            },
            style: ElevatedButton.styleFrom(
//minimumSize: Size(30, 20),
                backgroundColor: Color.fromRGBO(249, 75, 11, 1)),
            child: Text(
              'Si',
              style: TextStyle(
                  fontSize: height <= 500 ? 15 : 25, color: Colors.white),
            )),
      ),
      Container(
        height: 50,
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
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
