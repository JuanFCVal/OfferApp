import 'package:OfferApp/src/screens/Login/Widgets/TryfferLogo.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = PageController(initialPage: 0);
    return PageView(
      controller: _controller,
      children: [ContainerTest1(), ContainerTest2()],
    );
  }
}

class ContainerTest1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              onPressed: () {}, child: Text("Registro con correo electrónico")),
          TextButton(onPressed: () {}, child: Text("Registro con Google")),
        ],
      ),
    );
  }
}

class ContainerTest2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.red,
    );
  }
}
