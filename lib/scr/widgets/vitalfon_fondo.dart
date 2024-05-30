import 'package:flutter/material.dart';

class FondoVitalfon extends StatelessWidget {
  const FondoVitalfon();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).scaffoldBackgroundColor,
                  Colors.white,
                ],
              )),
              // padding: EdgeInsets.only(top: 50),
              height: 100,
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  opacity: 0.2,
                  image: AssetImage('assets/vitalfon.png'),
                )),
              ),
            ),
          ],
        ));
  }
}
