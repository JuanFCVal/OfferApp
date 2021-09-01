import 'package:OfferApp/src/model/Users.dart';
import 'package:OfferApp/src/screens/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      return LoginScreen();
    } else {
      return Home();
    }
  }
}
