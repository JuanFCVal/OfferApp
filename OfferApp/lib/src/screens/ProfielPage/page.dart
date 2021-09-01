   /* 
    final _size = MediaQuery.of(context).size;
    final userPhoto = Container(
      height: _size.height * 0.3,
      margin: EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white, width: 2.0, style: BorderStyle.solid),
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://laboratoriosniam.com/wp-content/uploads/2018/07/michael-dam-258165-unsplash_WEB2.jpg"))),
    );

    final userInfo = Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: Text("Ejemplo de Nombre",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ))),
        Text("cevallosjuanfrancisco@gmail.com",
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white60,
            )),
      ],
    );
    
    
    
        CollectionReference users = firestore.collection('users');
    final userData = FutureBuilder(
      future: users.doc(email).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return Text("loading");
      },
    );*/