abstract class MetaDataModel {
  Future<void> initMetaData({required String theme,required String language});

  Future<Map> getMetaData();
  Future<void> setTheme(String theme);

  Future<void> setLanguage(String lang);

  Future<bool> get isEmpty;
}