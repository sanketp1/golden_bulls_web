
import 'package:get_storage/get_storage.dart';
import 'package:golden_bulls_web_production/app/data/models/userModel.dart';

class Storage {
  static final storage = GetStorage();

  static saveUser(UserModel user) async {
    await storage.write("user", user.toMap());
    await storage.save();
  }

  static UserModel? getUser() {
    if (storage.hasData("user")) {
      final data = storage.read("user") as Map<String, dynamic>;
      return UserModel.fromMap(data);
    }
  }
}
