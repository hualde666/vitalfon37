import 'package:flutter/material.dart';

Container logoHeader() {
  return Container(
    //  color: Colors.green,
    width: double.infinity,
    height: 150,
    child: Container(
      height: 100,
      width: 200,
      child: Image(image: AssetImage('assets/vitalfon.png'), fit: BoxFit.fill),
    ),
  );
}
