import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddContacts extends StatefulWidget {
  const AddContacts({Key? key}) : super(key: key);

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.xmark),
          onPressed:(){
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check,size: 28,),
            onPressed:(){
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Image.asset("images/user.png", width: 100),
            ),

          ],
        ),
      ),
    );
  }
}
