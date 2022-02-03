import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DataBaseService extends GetxService {
  final GetStorage _db = Get.find<GetStorage>();

  void set({required String key, required dynamic value}) =>
      _db.write(key, value);

  dynamic get({required String key}) async => await _db.read(key);

  Iterable<dynamic> getAll() => _db.getValues();

  void delete({required String key}) => _db.remove(key);

  void erase() => _db.erase();
}
