import 'package:flutter/material.dart';
import 'package:piproy/scr/ayuda_widget/ayuda_encabezado.dart';

class AyudaContactosSeleccion extends StatelessWidget {
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
    List<Widget> lista = [];
    lista.addAll(ayudaEncabezado(context, 'Selección de Contactos'));
    List<Widget> lista2 = [
      Container(
        margin: EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    // width: 150,
                    // margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),

                    child: Center(
                      child: Text(
                        'Selección de Contacto',
                        style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    //width: double.infinity,
                    margin: EdgeInsets.only(left: 6, right: 6, top: 3),
                    child: Text(
                      'Se listarán  todos los contactos disponibles en su telefono. Podrá buscar deslizando hacia abajo y arriba la pantalla o usando la función de búsqueda.Toque sobre el nombre del contacto que desea en el grupo. El contacto cambiara de color para indicar que fue seleccionado. Toque de nuevo si no era el contacto deseado.',
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
              margin: EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // width: 150,
                    // margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),

                    child: Center(child: Icon(Icons.search)),
                  ),
                  Container(
                    // width: 150,
                    // margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),

                    child: Center(
                      child: Text(
                        'Busqueda de Contacto',
                        style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    //width: double.infinity,
                    margin: EdgeInsets.only(left: 6, right: 6, top: 3),
                    child: Text(
                      'Escriba aquí parte o todo el nombre del contacto que quiere buscar. La lista se reducirá a los nombres que contengan la busqueda. Puede seleccionar de esta lista el contacto que desee. ',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 25, color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Container(
                    // width: 150,
                    // margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),

                    child: Center(child: Icon(Icons.close)),
                  ),
                  Container(
                    //width: double.infinity,
                    margin: EdgeInsets.only(left: 6, right: 6, top: 3),
                    child: Text(
                      'Presionando X en el campo de busqueda, reinicia el proceso de busqueda.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 25, color: Theme.of(context).primaryColor),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      'Para cerrar el teclado una de estas opciones:',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Container(
                    child: Text(
                      '1.- Presione la tecla "done" del teclado.',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Container(
                      child: Row(
                    children: [
                      Text(
                        '2.- Presione la tecla ',
                        style: TextStyle(fontSize: 25),
                      ),
                      Icon(Icons.check),
                    ],
                  )),
                  Container(
                    child: Text(
                        '3.- Toque cualquier espacio fuera del campo de busqueda y de los contactos. ',
                        style: TextStyle(fontSize: 25)),
                  )
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
                  'guardar',
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
                'Guarda en el grupo los contactos seleccionados y regresa a la pantalla del grupo.',
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
    ];
    lista.addAll(lista2);
    return lista;
  }
}
