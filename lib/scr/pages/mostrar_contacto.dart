import 'package:flutter/material.dart';

import 'package:piproy/scr/models/contactos_modelo.dart';

import 'package:piproy/scr/providers/contactos_provider.dart';
//import 'package:piproy/scr/widgets/avatar_contacto.dart';
import 'package:piproy/scr/widgets/header_app.dart';
import 'package:provider/provider.dart';

import '../providers/provider_pref.dart';

class MostrarContacto extends StatefulWidget {
  @override
  State<MostrarContacto> createState() => _MostrarContactoState();
}

class _MostrarContactoState extends State<MostrarContacto> {
  @override
  Widget build(BuildContext context) {
    final contactosProvider = Provider.of<ContactosProvider>(context);
    final contacto = contactosProvider.contacto;
    return SafeArea(
      child: Scaffold(
        appBar: headerApp(context, '', Text(''), 0.0, true, 'mostrarcontacto'),
        body: fichaContacto(contacto),
      ),
    );
  }

  Widget fichaContacto(ContactoDatos _contact) {
    // List<Widget> listaPhone = creaListaDatos(_contact);
    final pref = Provider.of<Preferencias>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: 160,
            width: 160,
            // padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: pref.backgroundColor,
                borderRadius: BorderRadius.circular(100.0),
                border: Border.all(color: Theme.of(context).primaryColor)),
            child: _contact.avatar!.isEmpty
                ? Center(
                    child: Text(
                      _contact.nombre.substring(0, 1),
                      style: TextStyle(
                          fontSize: 40, color: Theme.of(context).primaryColor),
                    ),
                  )
                : CircleAvatar(
                    // backgroundImage: MemoryImage(_contact.avatar),
                    )),
        dato('Nombre:', _contact.nombre),
        dato('Teléfonos:', _contact.telefono)
      ],
    );
  }

  List<Widget> creaListaDatos(ContactoDatos _contact) {
    final pref = Provider.of<Preferencias>(context);
    List<Widget> lista = [
      SizedBox(
        height: 10,
      ),
    ];
    lista.add(Container(
        margin: EdgeInsets.symmetric(
          horizontal: 160,
        ),
        // height: 160,
        // width: 160,
        // padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: pref.backgroundColor,
            borderRadius: BorderRadius.circular(100.0),
            border: Border.all(color: Theme.of(context).primaryColor)),
        child: // _contact.avatar!.isEmpty
            //?
            Center(
          child: Text(
            _contact.nombre.substring(0, 1),
            style:
                TextStyle(fontSize: 40, color: Theme.of(context).primaryColor),
          ),
        )
        //:Image.memory(_contact.avatar)
        // CircleAvatar(
        //     backgroundImage: MemoryImage(_contact.avatar),
        //     // radius: 160,

        //   )
        ));
    if (_contact.nombre != '') {
      lista.add(dato('Nombre:', _contact.nombre));
    }
    // if (_contact.middleName != null && _contact.middleName != "") {
    //   lista.add(dato('Segundo Nombre:', _contact.middleName));
    // }
    // if (_contact.familyName != null && _contact.familyName != "") {
    //   lista.add(dato('Apellido:', _contact.familyName));
    // }
    // if (_contact.company != null && _contact.company != "") {
    //   lista.add(dato('Primer Nombre:', _contact.company));
    // }
    if (_contact.telefono != '') {
      lista.add(dato('Teléfonos:', _contact.telefono));
    }
    // if (_contact.whatsapptel != '') {
    //   lista.add(dato('Whatsapp:', _contact.whatsapptel));
    // }
    // if (_contact.emails.isNotEmpty) {
    //   for (var i = 0; i < _contact.emails.length; i++) {
    //     String correo = _contact.emails.elementAt(i).value;
    //     if (i == 0) {
    //       lista.add(dato('Correos:', correo));
    //     } else {
    //       lista.add(dato('C', correo));
    //     }
    //   }
    // }

    lista.add(SizedBox(
      height: 70,
    ));
    return lista;
  }

  Widget dato(String titulo, String campo) {
    double altoLetra = 28.0;
    double altoContainer = 50;
    if (titulo == 'Correos:' || titulo == 'C') {
      altoLetra = 20;
      altoContainer = 100;
      if (titulo == 'C') {
        titulo = '';
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 20,
          padding: EdgeInsets.only(left: 10),
          // color: Color.fromRGBO(55, 57, 84, 1.0),
          child: Text('$titulo  ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 20)),
        ),
        Container(
          height: altoContainer,
          //color:Theme.of(context).primaryColor,
          child: campo != ''
              ? Center(
                  child: Text(' $campo',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: altoLetra)),
                )
              : Text('',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: altoLetra)),
        ),
        Divider(
          height: 10,
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
