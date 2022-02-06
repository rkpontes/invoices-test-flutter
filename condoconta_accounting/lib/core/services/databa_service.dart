import 'package:condoconta_accounting/core/interfaces/service/idataba_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DataBaseService extends GetxService implements IDataBaseService {
  final GetStorage _db = Get.find<GetStorage>();

  @override
  void set({required String key, required dynamic value}) =>
      _db.write(key, value);

  @override
  dynamic get({required String key}) async => await _db.read(key);

  @override
  Iterable<dynamic> getAll() => _db.getValues();

  @override
  void delete({required String key}) => _db.remove(key);

  @override
  void erase() => _db.erase();
}
