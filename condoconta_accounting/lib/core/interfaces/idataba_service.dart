abstract class IDataBaseService {
  void set({required String key, required dynamic value});
  dynamic get({required String key});
  Iterable<dynamic> getAll();
  void delete({required String key});
  void erase();
}
