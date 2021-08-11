import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  InputText({Key key}) : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300]))),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Usuario o email",
                  hintStyle: TextStyle(color: Colors.grey[500])),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300]))),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Contraseña",
                  hintStyle: TextStyle(color: Colors.grey[500])),
            ),
          )
        ],
      ),
    );
  }
}
