import 'package:hive/hive.dart';

class HiveService {
  Future<void> storeData(String boxName, String key, dynamic value) async {
    var box = await Hive.openBox(boxName);
    await box.put(key, value);
    await box.close();
  }

  Future<dynamic> retrieveData(String boxName, String key) async {
    var box = await Hive.openBox(boxName);
    var value = box.get(key);
    await box.close();
    return value;
  }

  // Function to check if the key exists
  Future<bool> containsKey(String boxName, String key) async {
    var box = await Hive.openBox(boxName);
    bool exists = box.containsKey(key);
    await box.close();
    return exists;
  }
}
