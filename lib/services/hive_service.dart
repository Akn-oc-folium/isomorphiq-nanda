import 'package:hive/hive.dart';

class HiveService {
  // Cache opened boxes to avoid reopening them repeatedly
  final Map<String, Box> _openBoxes = {};

  // Open a box (or return the already opened one)
  Future<Box> _getBox(String boxName) async {
    if (!_openBoxes.containsKey(boxName)) {
      _openBoxes[boxName] = await Hive.openBox(boxName);
    }
    return _openBoxes[boxName]!;
  }

  // Store data in a box
  Future<void> storeData(String boxName, String key, dynamic value) async {
    final box = await _getBox(boxName);
    await box.put(key, value);
  }

  // Retrieve data from a box
  Future<dynamic> retrieveData(String boxName, String key) async {
    final box = await _getBox(boxName);
    return box.get(key);
  }

  // Check if a key exists in a box
  Future<bool> containsKey(String boxName, String key) async {
    final box = await _getBox(boxName);
    return box.containsKey(key);
  }

  // Close all open boxes (call this when the app is closing)
  Future<void> closeAllBoxes() async {
    for (var box in _openBoxes.values) {
      await box.close();
    }
    _openBoxes.clear();
  }
}
