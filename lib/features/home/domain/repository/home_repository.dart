abstract class HomeRepository{
  Future<void> setDataToShared(List<String>? data);

  Future<List<String>?> getDataFromShared();
}