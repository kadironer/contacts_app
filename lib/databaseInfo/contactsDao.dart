import 'package:contacts_app/contacts.dart';
import 'package:contacts_app/databaseInfo/databaseInformation.dart';

class Contactsdao{

  Future<List<Contacts>> allContacts() async{
    var db= await DatabaseInformation.databaseAccess();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM contacts ORDER BY contacts_name COLLATE NOCASE ASC");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Contacts(
          satir["contacts_id"], satir["contacts_name"], satir["contacts_number"]);
    });
}

  Future<void> addContacts(String contacts_name, int contacts_number) async {
    var db = await DatabaseInformation.databaseAccess();

    var information = Map<String, dynamic>();
    information["contacts_name"] = contacts_name;
    information["contacts_number"] = contacts_number;

    await db.insert("contacts", information);
  }

  Future<void> updateContacts(int contacts_id, String contacts_name, int contacts_number) async {
    var db = await DatabaseInformation.databaseAccess();

    var information = Map<String, dynamic>();
    information["contacts_name"] = contacts_name;
    information["contacts_number"] = contacts_number;

    await db.update("contacts", information, where: "contacts_id=?", whereArgs: [contacts_id]);
  }


  Future<void> deleteContacts(int contacts_id) async {
    var db = await DatabaseInformation.databaseAccess();
    await db.delete("contacts", where: "contacts_id=?", whereArgs: [contacts_id]);
  }


  Future<List<Contacts>> searchContacts(String arananKelime) async{
    var db = await DatabaseInformation.databaseAccess();
    List<Map<String,dynamic>> maps= await db.rawQuery("SELECT * FROM contacts WHERE contacts_name like '%$arananKelime%'");
    return List.generate(maps.length, (index){
      var information=maps[index];

      return Contacts(information["contacts_id"], information["contacts_name"], information["contacts_number"]);

    });
  }
}