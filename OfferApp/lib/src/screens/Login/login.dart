import 'package:flutter/material.dart';
import 'Widgets/Input_text.dart';
import 'Widgets/Login-Button.dart';
import 'Widgets/TryfferLogo.dart';
import 'Widgets/city-background.dart';
import 'Widgets/google-facebook-button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Positioned(bottom: 0, child: CityBackground()),
            Positioned(
                top: MediaQuery.of(context).size.height / 8,
                left: MediaQuery.of(context).size.width / 3.5,
                child: TryfferLogo(MediaQuery.of(context).size.height / 5,
                    MediaQuery.of(context).size.width / 2.5)),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.8,
              left: MediaQuery.of(context).size.height * 0.07,
              child: ButtonGreen(
                text: "Login",
                onPressed: () {
                  Navigator.pushNamed(context, "home");
                },
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.06,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.5,
              left: MediaQuery.of(context).size.height * 0.07,
              child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            right: (MediaQuery.of(context).size.width * 0.7) *
                                0.09),
                        child: SocialNetworkButtonLogin(
                          colors: Color.fromRGBO(4, 85, 157, 1),
                          image: "assets/img/logos/logofacebook.png",
                          onPressed: () {},
                          width:
                              (MediaQuery.of(context).size.width * 0.7) * 0.45,
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                      ),
                      SocialNetworkButtonLogin(
                        colors: Color.fromRGBO(227, 65, 51, 1),
                        image: "assets/img/logos/logogoogle.png",
                        onPressed: () {},
                        width: (MediaQuery.of(context).size.width * 0.7) * 0.45,
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                    ],
                  )),
            ),
            InputText(),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.75,
                left: MediaQuery.of(context).size.width / 5,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "No tienes cuenta? Registrate aquí",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )))
          ],
        ),
      ),
    );
  }
}
