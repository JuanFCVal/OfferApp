import 'package:OfferApp/src/services/auth.dart';
import 'package:flutter/material.dart';

import 'Login-Button.dart';

class InputText extends StatefulWidget {
  InputText({Key key}) : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String error = '';

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? CircularProgressIndicator()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: new InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey[500])),
                        validator: (val) =>
                            val.isEmpty ? 'Ingrese su correo' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: new InputDecoration(
                          hintText: 'Contraseña',
                          hintStyle: TextStyle(color: Colors.grey[500]),
                        ),
                        validator: (val) => val.length < 6
                            ? 'La contraseña debe tener al menos 6 caracteres'
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        }),
                  ),
                  Container(
                    child: ButtonGreen(
                      text: "Ingresar",
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              loading = false;
                              error =
                                  'El email y/o la contraseña son incorrectos';
                            });
                          } else {
                            Navigator.pushNamed(context, "bottom");
                          }
                        }
                      },
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              ),
            ),
          );
  }
}
