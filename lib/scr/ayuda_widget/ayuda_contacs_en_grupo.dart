import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/provider_pref.dart';

class AyudaContactosPorGrupos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _listaAyudaHome(context);
  }

  Widget _listaAyudaHome(BuildContext context) {
    List<Widget> _listaAyuda = _crearListaAyuda(context);

    return ListView.builder(
        itemCount: _listaAyuda.length,
        itemBuilder: (contest, i) {
          return _listaAyuda[i];
        });
  }

  List<Widget> _crearListaAyuda(BuildContext context) {
    final pref = Provider.of<Preferencias>(context);
    List<Widget> lista = [];
    //  lista.addAll(ayudaEncabezado(context, 'Contactos por grupo'));
    List<Widget> lista2 = [
      SizedBox(
        height: 10,
      ),
      Container(
        margin: EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                  color:
                      /** es un contacto o grupo de contacto */
                      Color.fromRGBO(192, 57, 43, 1),
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Color.fromRGBO(192, 57, 43, 1),
                  )),
              child: Center(
                child: Text(
                  '+ agregar',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Container(
              //width: double.infinity,
              margin: EdgeInsets.only(left: 6, right: 6, top: 3),
              child: Text(
                'Permite agregar contactos al grupo. Muestra todos los contactos en el celular y usted selecciona los deseados para el grupo',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 25, color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Divider(
        height: 10,
        color: Theme.of(context).primaryColor,
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        // height: 150,

        margin: EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              child: Icon(
                Icons.arrow_back,
                size: 50,
                color: Colors.blue,
              ),
            ),
            Container(
              //width: double.infinity,
              margin: EdgeInsets.only(left: 6, right: 6, top: 3),
              child: Text(
                'Permite copiar el contacto al menu principal, para un acceso mas directo.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 25, color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Divider(
        height: 10,
        color: Theme.of(context).primaryColor,
      ),
      Container(
        // height: 150,

        margin: EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              child: Icon(
                Icons.close,
                size: 50,
                color: Colors.red,
              ),
            ),
            Container(
              //width: double.infinity,
              margin: EdgeInsets.only(left: 6, right: 6, top: 3),
              child: Text(
                'Elimina contacto del grupo',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 25, color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Divider(
        height: 10,
        color: Theme.of(context).primaryColor,
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
            color: pref.backgroundColor,
            /** es un contacto o grupo de contacto */
            // Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: Theme.of(context).primaryColor,
            )),
        child: Center(
          child: Text(
            'Nombre Contacto',
            style:
                TextStyle(fontSize: 30, color: Theme.of(context).primaryColor),
          ),
        ),
      ),
      Container(
        //width: double.infinity,
        margin: EdgeInsets.only(left: 6, right: 6, top: 3),
        child: Text(
          'Tocando sobre el nombre del contacto, apareceran cuatro opciones:',
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 25, color: Theme.of(context).primaryColor),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 10, right: 6, top: 3),
        child: Text(
          '   1.- Llamar a  contacto',
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 25, color: Theme.of(context).primaryColor),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 10, right: 6, top: 3),
        child: Text(
          '   2.- Whatsapp del contacto',
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 25, color: Theme.of(context).primaryColor),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 10, right: 6, top: 3),
        child: Text(
          '   3.-  Mensaje a este contacto',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 25, color: Theme.of(context).primaryColor),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 10, right: 6, top: 3),
        child: Text(
          '   4.- Consulta número de teléfono.',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 25, color: Theme.of(context).primaryColor),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        //width: double.infinity,
        margin: EdgeInsets.only(left: 6, right: 6, top: 3),
        child: Text(
          'IMPORTANTE: incluya el signo "+" y el  código de país al número de teléfono del contacto (+XX) para poder ir directamente al Whatsapp del contacto.',
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 25, color: Theme.of(context).primaryColor),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Divider(
        height: 10,
        color: Theme.of(context).primaryColor,
      ),
      SizedBox(
        height: 10,
      ),
    ];
    lista.addAll(lista2);
    return lista;
  }
}
