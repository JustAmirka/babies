/*
import 'package:flutter/material.dart';
import 'icons/icons.dart';




Widget getDrawer(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  return (Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        getSeparateDivider(),
        SizedBox(height: screenHeight*0.08,),

        const Icon(Icons.person_pin,
          size: 100,
          color: Colors.lightBlue,),
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.2),
          child: const Text('Имя Фамилия',style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontFamily: 'Roboto',
            fontSize: 18.0,
          ),
          ),
        ),
        SizedBox(height: screenHeight*0.05,),
        MaterialButton(
            highlightColor: Colors.blue[800],
            splashColor: Colors.blue[800],
            child: Row(children: <Widget>[
              const Icon(Icons.home_outlined,
                color: Colors.lightBlue,),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.1),
                child: const Text(
                  'Главное меню',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Roboto',
                    fontSize: 18.0,
                  ),
                ),
              )
            ]),
            onPressed: () {
*/
/*
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
*//*

            }),
        SizedBox(height: screenHeight*0.02,),
        MaterialButton(
            highlightColor: Colors.blue[800],
            splashColor: Colors.blue[800],
            child: Row(children: <Widget>[
              const Icon(Icons.person_2_outlined,
                color: Colors.lightBlue,),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.1),
                child: const Text(
                  'Мой профиль',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Roboto',
                    fontSize: 18.0,
                  ),
                ),
              )
            ]),
            onPressed: () {
*/
/*
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
*//*

            }),
        SizedBox(height: screenHeight*0.02,),
        MaterialButton(
            highlightColor: Colors.blue[800],
            splashColor: Colors.blue[800],
            child: Row(children: <Widget>[
              const Icon(Icons.map_outlined,
                  color: Colors.lightBlue),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.1),
                child: const Text(
                  'Маршруты',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Roboto',
                    fontSize: 18.0,
                  ),
                ),
              )
            ]),
            onPressed: () {
*/
/*
              Navigator.push(context, MaterialPageRoute(builder: (context) => BusPage()));
*//*

            }),
        SizedBox(height: screenHeight*0.02,),
        MaterialButton(
            highlightColor: Colors.blue[800],
            splashColor: Colors.blue[800],
            child: Row(children: <Widget>[
              const Icon(Icons.newspaper_outlined,
                  color: Colors.lightBlue),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.1),
                child: const Text(
                  'Новости',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Roboto',
                    fontSize: 18.0,
                  ),
                ),
              )
            ]),
            onPressed: () {
*/
/*
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage()));
*//*

            }),

        SizedBox(height: screenHeight*0.02,),
        MaterialButton(
            highlightColor: Colors.blue[800],
            splashColor: Colors.blue[800],
            child: Row(children: <Widget>[
              const Icon(Icons.medical_services_outlined,
                  color: Colors.lightBlue),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.1),
                child: const Text(
                  'Мед организации',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Roboto',
                    fontSize: 18.0,
                  ),
                ),
              )
            ]),
            onPressed: () {
*/
/*
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactPage()));
*//*

            }),


        SizedBox(height: screenHeight*0.05,),
        getSeparateDivider(),
        MaterialButton(
            highlightColor: Colors.blue[800],
            splashColor: Colors.blue[800],
            child: Row(children: <Widget>[
              const Icon(Icons.settings_outlined,
                  color: Colors.lightBlue),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.1),
                child: const Text(
                  'Настройки',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Roboto',
                    fontSize: 18.0,
                  ),
                ),
              )
            ]),
            onPressed: () {
              Navigator.of(context).pop();
            }),

      ])));

}
class Drawhorizontalline extends CustomPainter {
  late Paint _paint;
  bool reverse;

  Drawhorizontalline(this.reverse) {
    _paint = Paint()
      ..color = Colors.black26
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(const Offset(-180.0, 0.0), const Offset(150.0, 0.0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


Widget getSeparateDivider() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      CustomPaint(painter: Drawhorizontalline(true)),
    ],
  );
}
*/


import 'package:flutter/material.dart';

class MyHomeBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(
                  blurRadius: 20, color: Colors.blue, spreadRadius: 1)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildContainerBottomNav(Icons.person),
            buildContainerBottomNav(Icons.shopping_bag),
            buildContainerBottomNav(Icons.home, isSelected: true),
            buildContainerBottomNav(Icons.favorite),
            buildContainerBottomNav(Icons.settings),
          ],
        ),
      ),
    );
  }

  Container buildContainerBottomNav(IconData icon, {isSelected = false}) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.white,
        shape: BoxShape.circle,
        boxShadow: isSelected
            ? [BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 1)]
            : [],
      ),
      height: 50,
      width: 50,
      child: Icon(icon, color: isSelected ? Colors.white : Colors.black),
    );
  }
}
