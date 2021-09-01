import 'package:OfferApp/src/model/categoria.dart';
import 'package:OfferApp/src/provider/categorias_provider.dart';
import 'package:OfferApp/src/screens/Home/widgets/CategoryCard.dart';
import 'package:OfferApp/src/services/FirebaseStorage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Categoria> categoriasDisp = [];
  final String email =
      "userejemplo"; //valor con el que se va a buscar la info del usuario
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProv = Provider.of<CategoriasProvider>(context);
    final _size = MediaQuery.of(context).size;
    // Show error message if initialization failed
    CollectionReference users = firestore.collection('users');

    return FutureBuilder(
      future: users.doc(email).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data.data() as Map<String, dynamic>;

          return SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                          height: _size.height * 0.45, color: Colors.red[100]),
                      Positioned(
                        right: 0,
                        child: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                            onPressed: () {}),
                      ),
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            FutureBuilder(
                              future: _getImage(context, "asdbl1kmds.jpg"),
                              builder: (BuildContext context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                if (snapshot.hasError) {
                                  return Text("Something went wrong");
                                }
                                return Container(
                                  height: _size.height * 0.25,
                                  width: _size.width * 0.5,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(snapshot.data),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("${data['nombres']} ${data['apellidos']}",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Text("${data['correo']}",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Text("${data['usuario']}",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Mis categorias favoritas",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: _size.height * 0.25,
                    child: _getCategoryData(
                        data['categorias'], categoryProv.categoriasDisponbles),
                  ),
                  Container(
                    height: _size.height * 0.25,
                    child: CategoryCards(categorias: this.categoriasDisp),
                  )

                  /*Container(
                    color: Colors.amber,
                    height: _size.height * 0.5,
                    child: ListView.builder(
                      itemCount: data['categoriasPreferidas'].length,
                      itemBuilder: (BuildContext context, int index) {
                        return CategoryCards(
                            categorias: _getCategoryData(
                                data['categoriasPreferidas'],
                                categoryProv.categoriasDisponbles));
                      },
                    ),
                 ), */
                ],
              ),
            ),
          );
        }

        return Text("loading");
      },
    );
  }

  Future _getImage(BuildContext context, String imgName) async {
    Image image;
    String link;
    await FirebaseStorageService.loadImage(context, imgName).then((value) {
      link = value.toString();
      image = Image.network(
        value.toString(),
      );
    });
    return link;
  }

  Widget _getCategoryData(
      categoriasPreferidas, List<Categoria> categoriasDisponibles) {
    List<Categoria> categoriasPrefe = [];
    for (var item in categoriasPreferidas) {
      for (var catdisp in categoriasDisponibles) {
        if (item == catdisp.idcategoria.toString()) {
          categoriasPrefe.add(catdisp);
        }
      }
    }
    categoriasDisponibles.forEach((element) {
      if (!categoriasPrefe.contains(element)) {
        this.categoriasDisp.add(element);
      }
    });
    this.categoriasDisp = this.categoriasDisp.toSet().toList();
    return CategoryCards(categorias: categoriasPrefe);
  }
}
