import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _car = 0;
  String _infoText = "Bem vindo!";

  void _changeCar(int delta) {
    setState(() {
      _car += delta;

      if (_car < 0) {
        _infoText = Null as String;
      } else if (_car <= 30) {
        _infoText = "Há vagas";
      } else {
        _infoText = "Lotado!";
      }

      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/park.jpg",
          fit: BoxFit.cover,
          height: 800,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Carros: $_car",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(16.0),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 30),
                          ),
                          onPressed: () {
                            _changeCar(1);
                          },
                          child: Text('+1'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(16.0),
                            primary: Colors.white,
                            textStyle: TextStyle(fontSize: 30),
                          ),
                          onPressed: () {
                            _changeCar(-1);
                          },
                          child: Text('-1'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(_infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30))
          ],
        )
      ],
    );
  }
}
