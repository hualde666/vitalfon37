import 'package:flutter/material.dart';

ThemeData themaApi(String color) {
  ThemeData tema = ThemeData.dark();
  switch (color) {
    case '1':
      tema = ThemeData(
        primaryColor: Color.fromARGB(
            226, 255, 255, 255), // Color.fromARGB(255, 3, 51, 90),
        //    backgroundColor: Color.fromARGB(255, 3, 51, 90),
        scaffoldBackgroundColor: Color.fromARGB(255, 2, 84, 131),
        textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Color.fromARGB(232, 255, 255, 255))),
        iconTheme: IconThemeData(color: Colors.white, size: 40),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(192, 57, 43, 1),
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        )),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            extendedTextStyle: TextStyle(
              fontSize: 20,
              //  color: Color.fromRGBO(202, 184, 182, 1),
            ),
            backgroundColor: Color.fromRGBO(192, 57, 43, 1),
            foregroundColor: Colors.white),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color.fromRGBO(249, 75, 11, 1),
            selectedIconTheme:
                IconThemeData(color: Colors.green, opacity: 0.6, size: 40.0),
            unselectedIconTheme: IconThemeData(
                color: Colors.green[100], opacity: 0.6, size: 30.0)),

        // style: BorderStyle()
      );
      break;
    case '2':
      {
        tema = ThemeData(
          primaryColor: Colors.black54,
          //     backgroundColor: Color.fromARGB(255, 143, 185, 168),
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white, size: 40),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(249, 75, 11, 1),
            textStyle: TextStyle(fontSize: 25, color: Colors.white),
          )),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              extendedTextStyle: TextStyle(fontSize: 20, color: Colors.white),
              backgroundColor: Color.fromRGBO(249, 75, 11, 1),
              foregroundColor: Colors.white),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Color.fromRGBO(249, 75, 11, 1),
              selectedIconTheme:
                  IconThemeData(color: Colors.green, opacity: 0.6, size: 40.0),
              unselectedIconTheme: IconThemeData(
                  color: Colors.green[100], opacity: 0.6, size: 30.0)),

          // style: BorderStyle()
        );
        break;
      }

    case '3':
      tema = ThemeData(
        primaryColor: Color.fromARGB(255, 245, 247, 245),
        //   backgroundColor: Color.fromARGB(255, 7, 98, 89), //Color.fromARGB(
        // 255, 245, 247, 245),
        scaffoldBackgroundColor: Color.fromARGB(255, 6, 149, 133),
        textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white, size: 40),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(192, 57, 43, 1),
          textStyle: TextStyle(fontSize: 25, color: Colors.white),
        )),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            extendedTextStyle: TextStyle(fontSize: 20, color: Colors.white),
            backgroundColor: Color.fromRGBO(192, 57, 43, 1),
            foregroundColor: Colors.white),

        // style: BorderStyle()
      );
      break;
    case '4':
      tema = ThemeData(
        primaryColor: Color.fromARGB(
            255, 3, 157, 246), // Color.fromRGBO(55, 57, 84, 1.0),
        // backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        //Color.fromRGBO(           39, 174, 96, 1.0), // Color.fromRGBO(220, 118, 51, 1),
        textTheme: TextTheme(
            bodyLarge: TextStyle(color: Color.fromARGB(255, 3, 157, 246)),
            bodyMedium: TextStyle(color: Color.fromARGB(255, 3, 157, 246))),

        iconTheme:
            IconThemeData(color: Color.fromARGB(255, 3, 157, 246), size: 40),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            extendedTextStyle:
                TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            backgroundColor: Color.fromARGB(255, 6, 81, 156),
            foregroundColor: Colors.amber),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 3, 157, 246),
          textStyle: TextStyle(fontSize: 25, color: Colors.white),
        )),
      );
      break;
    case '5':
      tema = ThemeData(
        primaryColor: Colors.black54,
        // backgroundColor: Colors.white,
        textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.black54),
            bodyMedium: TextStyle(color: Colors.black54)),
        iconTheme: IconThemeData(color: Colors.black54, size: 40),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(249, 75, 11, 1),
          textStyle: TextStyle(fontSize: 25, color: Colors.white),
        )),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            extendedTextStyle: TextStyle(fontSize: 20, color: Colors.white),
            backgroundColor: Color.fromRGBO(249, 75, 11, 1),
            foregroundColor: Colors.white),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color.fromRGBO(249, 75, 11, 1),
            selectedIconTheme:
                IconThemeData(color: Colors.green, opacity: 0.6, size: 40.0),
            unselectedIconTheme: IconThemeData(
                color: Colors.green[100], opacity: 0.6, size: 30.0)),

        // style: BorderStyle()
      );
  }
  return tema;
}
