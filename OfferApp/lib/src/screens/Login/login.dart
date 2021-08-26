import 'package:OfferApp/src/services/auth.dart';
import 'package:flutter/material.dart';
import 'Widgets/Input_text.dart';
import 'Widgets/TryfferLogo.dart';
import 'Widgets/google-facebook-button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            TryfferLogo(MediaQuery.of(context).size.height / 5,
                MediaQuery.of(context).size.width / 2.5),
            SizedBox(
              height: 30,
            ),
            InputText(),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.06,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          right:
                              (MediaQuery.of(context).size.width * 0.7) * 0.09),
                      child: SocialNetworkButtonLogin(
                        colors: Color.fromRGBO(4, 85, 157, 1),
                        image: "assets/img/logos/logofacebook.png",
                        onPressed: () {},
                        width: (MediaQuery.of(context).size.width * 0.7) * 0.45,
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                    ),
                    SocialNetworkButtonLogin(
                      colors: Color.fromRGBO(227, 65, 51, 1),
                      image: "assets/img/logos/logogoogle.png",
                      onPressed: () {
                        _auth.signInWithGoogle();
                      },
                      width: (MediaQuery.of(context).size.width * 0.7) * 0.45,
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "register");
                },
                child: Text(
                  "¿No tienes cuenta? Registrate aquí",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
