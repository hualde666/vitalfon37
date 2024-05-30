// import 'package:device_apps/device_apps.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/aplicaciones_provider.dart';
// import '../widgets/header_app.dart';

// class ElejirLauncher extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final apiProvider = Provider.of<AplicacionesProvider>(context);
//     Future<List<Widget>> cargarListaGrupo() async {
//       List<Application> lista = await apiProvider.obtenerListaApiGrupo('Todas');

//       if (lista != null) {
//         List<Widget> listaApi =
//             List.generate(lista.length, (i) => Text(lista[i].appName));

//         return listaApi;
//       }
//       return [];
//     }

//     return SafeArea(
//         child: Scaffold(
//       appBar: headerApp(context, 'Launcher', Text(''), 0.0, true, 'Launcher'),
//       body: FutureBuilder(
//           future: cargarListaGrupo(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else {
//               if (snapshot.hasData) {
//                 // snapshot contiene todas las app del grupo

//                 return Container(
//                   child: GridView.count(
//                     children: snapshot.data,
//                     crossAxisCount: 2,
//                   ),
//                 );
//               } else {
//                 return Container();
//               }
//             }
//           }),
//     ));
//   }
// }
