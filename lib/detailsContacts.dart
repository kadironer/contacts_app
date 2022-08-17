import 'package:contacts_app/contacts.dart';
import 'package:contacts_app/databaseInfo/contactsDao.dart';
import 'package:contacts_app/mainContacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailsContacts extends StatefulWidget {

  Contacts contact;
  DetailsContacts({Key? key, required this.contact}) : super(key: key);

  @override
  State<DetailsContacts> createState() => _DetailsContactsState();
}

class _DetailsContactsState extends State<DetailsContacts> {

  var tfContactsName=TextEditingController();
  var tfContactsNumber=TextEditingController();

  Future<void> contactsDelete(int contacts_id) async{
    await Contactsdao().deleteContacts(contacts_id);
    Navigator.pop(context);
  }

  Future<void> contactsUpdate( int contacts_id, String contacts_name, int contacts_number) async{
    await Contactsdao().updateContacts(contacts_id, contacts_name, contacts_number);

  }

  @override
  void initState() {
    var cont=widget.contact;
    tfContactsName.text=cont.contacts_name;
    tfContactsNumber.text=cont.contacts_number.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed:(){
            Navigator.pop(context);
          },
        ),
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
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))],
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


      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: IconButton(
                icon: Icon(CupertinoIcons.square_pencil,size: 40.0,),
                onPressed:(){
                      contactsUpdate(widget.contact.contacts_id, tfContactsName.text, int.parse(tfContactsNumber.text));
                  },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,bottom: 10.0),
              child: IconButton(
                icon: Icon(Icons.delete, size: 40.0,),
                onPressed:(){
                  showDialog(context: context,
                      builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("${widget.contact.contacts_name} adlı kişi silinsin mi?"),
                      actions: [
                        TextButton(
                          child: Text("İptal Et"),
                          onPressed:(){
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: Text("Sil"),
                          onPressed:(){
                            setState((){
                              contactsDelete(widget.contact.contacts_id);
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainContacts()));
                            });

                          },
                        )
                      ],
                    );
                  }
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
