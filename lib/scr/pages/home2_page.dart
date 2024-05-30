import 'package:flutter/material.dart';

import 'package:piproy/scr/providers/provider_pref.dart';

import 'package:piproy/scr/widgets/detalle_menup.dart';

import 'package:piproy/scr/widgets/header_botones.dart';
import 'package:piproy/scr/widgets/vitalfon_fondo.dart';

import 'package:provider/provider.dart';

class Home2Page extends StatefulWidget {
  @override
  State<Home2Page> createState() => _Home2PageState();
}

class _Home2PageState extends State<Home2Page> {
  @override
  Widget build(BuildContext context) {
    final pref = Provider.of<Preferencias>(context);

    double altoConMenuHorizontal = 275;
    double altoSinMenuHorizontal = 200;

    // final lista = apiProvider.listaMenu;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(pref.menuHorizontal
              ? altoConMenuHorizontal
              : altoSinMenuHorizontal),
          child: encabezadoApp(context),
        ),
        body: FutureBuilder(
            future: detalle(context),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  return Stack(
                    children: [
                      FondoVitalfon(),
                      ListView.builder(
                          padding: EdgeInsets.only(bottom: 100),
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, i) {
                            return snapshot.data[i];
                          }),
                    ],
                  );
                } else {
                  return Container();
                }
              }
            }),
      ),
    );
  }
}
