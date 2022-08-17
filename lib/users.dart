import 'package:contacts_app/addContacts.dart';
import 'package:contacts_app/contacts.dart';
import 'package:contacts_app/databaseInfo/contactsDao.dart';
import 'package:contacts_app/detailsContacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {

  Future<List<Contacts>> allContactsShow() async{
    var contactsList= await Contactsdao().allContacts();
    return contactsList;
  }

  bool aramaYap=false;
  var arananKelime='';

  Future<List<Contacts>> contactsSearch(String arananKelime) async{
    var contactsList= await Contactsdao().searchContacts(arananKelime);
    return contactsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: SizedBox(
          height: 50,
          child: TextField(
            onChanged:(searchResult){
              setState(() {
                arananKelime=searchResult;
              });
            },
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z á-ú Á-Ú]"))],
            style: TextStyle(
                fontSize: 20.0
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 2.0),
              hintText: "Kişi Ara",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0)
              )
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Contacts>>(
        future: aramaYap ? contactsSearch(arananKelime) : allContactsShow(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            var contactsList=snapshot.data;
            return ListView.builder(
              itemCount: contactsList!.length,
              itemBuilder: (context,index){
                var contact=contactsList[index];
                return GestureDetector(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsContacts(contact: contact)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: SizedBox(
                      height: 50,
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Image.asset("images/user.png"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(contact.contacts_name, style: TextStyle(fontSize: 20),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white, size: 40.0,),
        backgroundColor: Color(0xFf0178c8),
        tooltip: "Kişi Ekle",
        onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddContacts()));
        },
      ),
    );
  }
}
