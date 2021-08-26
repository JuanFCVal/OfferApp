import 'package:OfferApp/src/screens/Login/Widgets/TryfferLogo.dart';
import 'package:OfferApp/src/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AuthService auth = new AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text("Crear una cuenta"),
            Text(
                "Al registrate a nuestros servicios \n aceptas nuestros terminos y condiciones."),
            TryfferLogo(MediaQuery.of(context).size.height / 5,
                MediaQuery.of(context).size.width / 2.5),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "regForm");
                },
                child: Text("Registro con correo electrónico")),
            TextButton(
                onPressed: () {
                  auth.signInWithGoogle();
                },
                child: Text("Registro con Google")),
          ],
        ),
      ),
    );
  }
}
