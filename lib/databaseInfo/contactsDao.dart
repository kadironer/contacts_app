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
}