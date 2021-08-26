import 'package:OfferApp/src/screens/Login/Widgets/Login-Button.dart';
import 'package:OfferApp/src/screens/register/widgets/datePick.dart';
import 'package:OfferApp/src/services/auth.dart';
import 'package:flutter/material.dart';

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  final String dateob;
  const MyCustomForm({Key key, this.dateob}) : super(key: key);

  @override
  _MyCustomFormState createState() {
    return _MyCustomFormState(dateob);
  }
}

class _MyCustomFormState extends State<MyCustomForm> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String dateob;

  _MyCustomFormState(this.dateob);

  //state of the text field
  String email = '';
  String nombres = '';
  String apellidos = '';
  String usuario = '';
  String telefono = '';
  String password = '';
  String dob = '';
  String error = '';
  var txt = TextEditingController();
  callback(datevar) {
    setState(() {
      dateob = datevar;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return loading
        ? CircularProgressIndicator()
        : Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: new InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.grey[500])),
                      validator: (val) =>
                          val.isEmpty ? 'Ingrese su correo' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      }),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                      decoration: new InputDecoration(
                          hintText: 'Usuario',
                          hintStyle: TextStyle(color: Colors.grey[500])),
                      validator: (val) =>
                          val.isEmpty ? 'Ingrese un usuario' : null,
                      onChanged: (val) {
                        setState(() => usuario = val);
                      }),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: new InputDecoration(
                          hintText: 'Nombres',
                          hintStyle: TextStyle(color: Colors.grey[500])),
                      validator: (val) =>
                          val.isEmpty ? 'Ingrese su o sus nombres' : null,
                      onChanged: (val) {
                        setState(() => nombres = val);
                      }),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: new InputDecoration(
                          hintText: 'Apellidos',
                          hintStyle: TextStyle(color: Colors.grey[500])),
                      validator: (val) =>
                          val.isEmpty ? 'Ingrese su o sus apellidos' : null,
                      onChanged: (val) {
                        setState(() => apellidos = val);
                      }),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: new InputDecoration(
                          hintText: 'Teléfono',
                          hintStyle: TextStyle(color: Colors.grey[500])),
                      validator: (val) =>
                          val.isEmpty ? 'Ingrese su nro de teléfono' : null,
                      onChanged: (val) {
                        setState(() => telefono = val);
                      }),
                  SizedBox(
                    height: 20.0,
                  ),
                  DatePick(
                    callback: callback,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
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
                  SizedBox(
                    height: 10.0,
                  ),
                  ButtonGreen(
                    text: "Continuar",
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() => loading = true);
                        _auth.name = nombres;
                        _auth.lastname = apellidos;
                        _auth.telefono = telefono;
                        _auth.usuario = usuario;
                        _auth.dateob = dateob;
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'El correo ingresado no es valido';
                            loading = false;
                          });
                        } else {}
                      }
                    },
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.06,
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
