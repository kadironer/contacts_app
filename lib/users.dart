import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white, size: 40.0,),
        backgroundColor: Colors.blueAccent,
        tooltip: "Kişi Ekle",
        onPressed:(){
        },
      ),
    );
  }
}
