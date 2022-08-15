import 'package:contacts_app/contacts.dart';
import 'package:contacts_app/databaseInfo/databaseInformation.dart';

class Contactsdao{

  Future<List<Contacts>> allContacts() async{
    var db= await DatabaseInformation.databaseAccess();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM contacts ORDER BY contacts_name ASC");
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

}