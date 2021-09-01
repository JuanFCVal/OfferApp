import 'package:OfferApp/src/provider/categorias_provider.dart';
import 'package:OfferApp/src/screens/Home/home.dart';
import 'package:OfferApp/src/screens/ProfielPage/profile.dart';
import 'package:OfferApp/src/screens/ScreenMap/FullMapScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _pageIndex = 0;

  final Home _home = Home();
  final FullMapScreen _mapa = new FullMapScreen();
  final ProfilePage _perfil = new ProfilePage();
  Widget _showPage = new Home();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _home;
        break;
      case 1:
        return _mapa;
        break;
      case 2:
        return _perfil;
        break;
      default:
        return new Container(
            child: Text("Hay un error para mostrar está página"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CategoriasProvider())],
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: _pageIndex,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          color: Colors.blue[600],
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.map_sharp, size: 30),
            Icon(Icons.person, size: 30),
          ],
          onTap: (index) {
            setState(() {
              print(index);
              _showPage = _pageChooser(index);
            });
          },
        ),
        body: _showPage,
      ),
    );
  }
}
