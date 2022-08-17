import 'package:contacts_app/addContacts.dart';
import 'package:contacts_app/contacts.dart';
import 'package:contacts_app/databaseInfo/contactsDao.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Contacts>>(
        future: allContactsShow(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            var contactsList=snapshot.data;
            return ListView.builder(
              itemCount: contactsList!.length,
              itemBuilder: (context,index){
                var contact=contactsList[index];
                return GestureDetector(
                  onTap:(){
                    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DetailsContacts(detailsCT: detailsCT)));
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
