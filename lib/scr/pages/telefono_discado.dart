import 'package:flutter/material.dart';

import 'package:piproy/scr/funciones/url_funciones.dart';
import 'package:piproy/scr/widgets/header_app.dart';
import 'package:provider/provider.dart';

import '../providers/provider_pref.dart';

class Discado extends StatefulWidget {
  @override
  State<Discado> createState() => _DiscadoState();
}

class _DiscadoState extends State<Discado> {
  final myController = TextEditingController();
  String telefono = '';
  @override
  void initState() {
    myController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 3;
    double height = (MediaQuery.of(context).size.height - 290) / 6;
    // print(width * 3);

    // print(height * 6);

    if (MediaQuery.of(context).size.height <= 480) {
      height = 50;
    }

    //final altura = (MediaQuery.of(context).size.height - 190) / 5.0;

    return SafeArea(
        child: Scaffold(
      appBar: headerApp(context, 'Teléfono', Text(''), 0.0, true, 'Discado'),
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                //SystemChannels.textInput.invokeMethod('TextInput.hide');
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 1)),
                // height: 80,
                child: Center(
                  child: Text(
                    myController.text,
                    style: TextStyle(
                        fontSize:
                            MediaQuery.of(context).size.width <= 320 ? 35 : 45,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              tecla(context, '1', myController),
              tecla(context, '2', myController),
              tecla(context, '3', myController)
            ]),
            SizedBox(
              height: 8,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              tecla(context, '4', myController),
              tecla(context, '5', myController),
              tecla(context, '6', myController)
            ]),
            SizedBox(
              height: 8,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              tecla(context, '7', myController),
              tecla(context, '8', myController),
              tecla(context, '9', myController)
            ]),
            SizedBox(
              height: 8,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              tecla(context, '*', myController),
              tecla(context, '0', myController),
              tecla(context, '#', myController)
            ]),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (() => {
                          setState(() {
                            telefono = '';
                            myController.clear();
                          })
                        }),
                    child: Container(
                      height: height,
                      width: width - 20,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(color: Colors.white38, width: 1)),
                      child: Center(
                        child: Icon(
                          Icons.clear,
                          color: Colors.black,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (myController.text.length > 8) {
                        llamar(myController.text);
                      }
                    },
                    child: Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 10, 185, 98),
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(color: Colors.white38, width: 1)),
                      child: Center(
                          child: Text(
                        'llamar',
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        final String numero = myController.text;
                        telefono = myController.text;
                        if (numero.length > 1) {
                          myController.text =
                              numero.substring(0, numero.length - 1);
                          //   final x = formatoNumero(numero);
                        } else {
                          myController.text = '';
                          telefono = '';
                        }
                      });
                    },
                    child: Container(
                      height: height,
                      width: width - 20,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(color: Colors.white38, width: 1)),
                      child: Center(
                        child: Icon(
                          Icons.backspace_outlined,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    ));
  }

  Widget tecla(
      BuildContext context, String tecla, TextEditingController myController) {
    final pref = Provider.of<Preferencias>(context);
    //final altura = (MediaQuery.of(context).size.height - 190) / 5.0;
    double width = MediaQuery.of(context).size.width / 3;
    double height = (MediaQuery.of(context).size.height - 290) / 6;
    // if (MediaQuery.of(context).size.height <= 480) {
    //   height = 55;
    // }
    double font = 40;
    if (MediaQuery.of(context).size.width <= 320) {
      font = 30;
    }
    return GestureDetector(
        onTap: () {
          if (myController.text.length < 12) {
            myController.text = myController.text + tecla;
          }

          setState(() {});
          // print(myController.text);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.symmetric(vertical: 0.1),
          height: height,
          width: width - 10,
          child: Center(
            child: Text(
              tecla,
              // textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: font,
              ),
            ),
          ),
          decoration: BoxDecoration(
              color: pref.backgroundColor,
              borderRadius: BorderRadius.circular(20.0),
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 1)),
        ));
  }
}
