import 'package:flutter/material.dart';
import 'package:piproy/scr/models/api_tipos.dart';
import 'package:piproy/scr/providers/aplicaciones_provider.dart';
import 'package:piproy/scr/providers/db_provider.dart';
import 'package:provider/provider.dart';

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
    content: SingleChildScrollView(
      child: Form(
        child: Container(
          height: height <= 500 ? 70 : 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40, // height <= 500 ? 10 : 60,
                child: Text('Crear grupo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: height <= 500 ? 10 : 30,
                        color: Colors.black)),
              ),
              SizedBox(
                height: 2, //height <= 500 ? 2 : 10,
              ),
              Container(
                height: 50, //height <= 500 ? 25 : 30,
                child: TextFormField(
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
              String grupo;
              if (_tipoControle.value.text.isNotEmpty) {
                grupo = _tipoControle.value.text[0].toUpperCase() +
                    _tipoControle.value.text.substring(1);

                if (!apiProvider.apigrupos.contains(grupo)) {
                  // agregar a BD

                  apiProvider.agregarApiGrupo(grupo);
                  final nuevo =
                      new ApiTipos(grupo: grupo, nombre: "", tipo: "1");
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
            style: ElevatedButton.styleFrom(
                //change width and height on your need width = 200 and height = 50
//minimumSize: Size(30, 20),
                backgroundColor: Color.fromRGBO(249, 75, 11, 1)),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'No',
              style: TextStyle(
                  fontSize: height <= 500 ? 15 : 25, color: Colors.white),
            )),
      ),
    ],
  );
}
