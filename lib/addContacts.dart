import 'package:contacts_app/databaseInfo/contactsDao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddContacts extends StatefulWidget {
  const AddContacts({Key? key}) : super(key: key);

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {

  var tfContactsName=TextEditingController();
  var tfContactsNumber=TextEditingController();


  Future<void> regContacts(String contacts_name, int contacts_number) async{
    await Contactsdao().addContacts(contacts_name, contacts_number);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.xmark),
          onPressed:(){
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check,size: 28,),
            onPressed:(){
              regContacts(tfContactsName.text, int.parse(tfContactsNumber.text));
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

            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
              child: SizedBox(
                height: 60,
                child: TextField(
                  keyboardType: TextInputType.name,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z á-ú Á-Ú]"))],
                  controller: tfContactsName,
                  style: TextStyle(
                    fontSize: 20.0
                  ),
                  decoration: InputDecoration(
                    labelText: "Ad Soyad",
                    hintText: "Adınız Soyadınız",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
              child: SizedBox(
                height: 60,
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: tfContactsNumber,
                  style: TextStyle(
                      fontSize: 20.0
                  ),
                  decoration: InputDecoration(
                      labelText: "Telefon",
                      counterText: '',
                      hintText: "Telefon Numarası",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
