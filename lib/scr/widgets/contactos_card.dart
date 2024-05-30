import 'package:flutter/material.dart';

import 'package:piproy/scr/models/contactos_modelo.dart';
import 'package:piproy/scr/providers/aplicaciones_provider.dart';
import 'package:piproy/scr/providers/contactos_provider.dart';

import 'package:piproy/scr/widgets/agrega_contacto_mp.dart';
import 'package:piproy/scr/widgets/botones_contactp.dart';
import 'package:piproy/scr/widgets/elimina_cotacto_grupo.dart';
import 'package:piproy/scr/widgets/eliminar_cotact_mp.dart';

import 'package:piproy/scr/widgets/nombre_contacto.dart';
import 'package:provider/provider.dart';

import '../funciones/url_funciones.dart';
import '../providers/estado_celular.dart';
import '../providers/provider_pref.dart';
import 'avatar_contacto.dart';

class TarjetaContacto2 extends StatefulWidget {
  TarjetaContacto2(
      this.context, this.contacto, this.envio, this.eliminar, this.tipo);
  final BuildContext context;
  final ContactoDatos contacto;
  //**** boleana envio true el contacto tiene la opcion de enviar al menu principal */
  final bool envio;
  final bool eliminar;
  final String
      tipo; //  MPA DISCADO DIRECTO; MPB WHATSAPP;  MPC  TODAS LAS OPCIONES

  @override
  _TarjetaContacto2 createState() => _TarjetaContacto2();
}

class _TarjetaContacto2 extends State<TarjetaContacto2> {
  late bool oneTap;

  @override
  void initState() {
    super.initState();
    oneTap = false;
  }

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<AplicacionesProvider>(context);
    final contactosProvaider = Provider.of<ContactosProvider>(context);
    final grupo = apiProvider.tipoSeleccion;
    final celProvider = Provider.of<EstadoProvider>(context, listen: false);
    final pref = Provider.of<Preferencias>(context);
    bool activoDatos = celProvider.conexionDatos;
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
              color: pref.backgroundColor,
              borderRadius: BorderRadius.circular(60.0),
              border: Border.all(color: Theme.of(context).primaryColor)),
          //color: Colors.black,
          height: oneTap ? 420 : 120,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          padding: EdgeInsets.only(left: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AvatarContacto(widget.contacto),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      //  color: Colors.amber,
                      margin: EdgeInsets.only(right: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          pref.modoConfig
                              ? _configurarContacto(
                                  context,
                                  widget.contacto,
                                  grupo,
                                  widget.envio,
                                  widget.eliminar,
                                  widget.tipo)
                              : Container(),
                          nombreContacto(context, widget.contacto, widget.tipo),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              oneTap
                  ? botonesContactos(
                      context,
                      widget.contacto,
                    )
                  : Container(),
            ],
          )),
      onTap: () async {
        if (widget.tipo != 'MPA' && widget.tipo != 'MPB') {
          oneTap = !oneTap;
          setState(() {});
        } else {
          if (widget.tipo == 'MPA') {
            if (activoDatos) {
              final ContactoDatos _contacto = await contactosProvaider
                  .obtenerContacto(widget.contacto.nombre);

              /// *** llamada desde el contacto
              if (_contacto.telefono != '') {
                llamar(_contacto.telefono);
              }
            }
            /* llamar por telefono*/
          } else if (widget.tipo == 'MPB') {
            // ** ir a contacto Whastappp
            final ContactoDatos _contacto = await contactosProvaider
                .obtenerContacto(widget.contacto.nombre);
            if (_contacto.telefono != "") {
              abrirWhatsapp(_contacto.telefono, '');
            }
          }
        }
      },
    );
  }
}

Widget _configurarContacto(BuildContext context, ContactoDatos contacto,
    String grupo, bool envio, bool eliminar, String tipo) {
  final pref = Provider.of<Preferencias>(context);

  return Container(
    padding: EdgeInsets.only(left: 10, right: 10),
    height: 42,
    // color: Colors.amber,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        envio
            ? GestureDetector(
                onTap: () {
                  agregarMPA(context, contacto);
                },
                child: Container(
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Color.fromARGB(255, 228, 220, 57),
                  ),
                ))
            : Container(),
        envio && eliminar
            ? SizedBox(
                width: 50,
              )
            : Container(),
        GestureDetector(
            onTap: () {
              if (envio) {
                if (grupo != 'Todos') {
                  eliminarContactoGrupo(context, grupo, contacto);
                }
                // eliminar contacto del grupo
              } else {
                // eliminar contacto menu principal
                eliminarContactoMP(context, tipo + contacto.nombre);
              }
            },
            child: eliminar && pref.modoConfig
                ? Container(
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.close,
                      size: 40,
                      color: Color.fromARGB(255, 246, 20, 4),
                    ),
                  )
                : Container(
                    height: 50,
                    width: 50,
                  ))
      ],
    ),
  );
}
