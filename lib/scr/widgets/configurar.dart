import 'package:flutter/material.dart';
import 'package:piproy/scr/pages/configuracion_page.dart';
import 'package:piproy/scr/providers/provider_pref.dart';
import 'package:piproy/scr/widgets/config_dibujo.dart';
import 'package:provider/provider.dart';

class ConfigWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pref = Provider.of<Preferencias>(context);
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, 'ayuda',
        //     arguments: 'home');

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ConfiguracionPage()));
      },
      child: ConfigDibujo(pref: pref),
    );
  }
}



//   Widget build(BuildContext context) {
//     return Container(
//         width: 100,
//         height: 50,
//         decoration: BoxDecoration(
//             color: Colors.black38,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black54,
//                 blurRadius: 1,
//                 spreadRadius: 0.5,
//                 offset: Offset(0, 3),
//               ),
//             ],
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
//             border:
//                 Border.all(width: 0.5, color: Theme.of(context).primaryColor)),
//         // decoration: BoxDecoration(
//         //     color: Colors.black38,
//         //     borderRadius: BorderRadius.circular(20.0),
//         //     border: Border.all(color: Colors.white30)),
//         // margin: EdgeInsets.only(right: 5),
//         child: Center(
//           child: Text(
//             'AYUDA',
//             style:
//                 TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),
//           ),
//         ));
//   }
// }
