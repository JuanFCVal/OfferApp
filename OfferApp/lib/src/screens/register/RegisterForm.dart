import 'package:OfferApp/src/screens/Login/Widgets/TryfferLogo.dart';
import 'package:OfferApp/src/screens/register/widgets/Input-Register.dart';
import 'package:OfferApp/src/screens/register/widgets/datePick.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Container(
                child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                if (!isKeyboard)
                  TryfferLogo(MediaQuery.of(context).size.height / 5,
                      MediaQuery.of(context).size.width / 2.5),
                SizedBox(height: 15),
                const MyCustomForm(),
                SizedBox(
                  height: 30,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
