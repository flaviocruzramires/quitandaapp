abstract class StorageKeys {
  static const String user = 'user';
  static const String token = 'token';
  static const String contentType = 'Content-type';
  static const String xParseApplicationId = 'X-Parse-Application-Id';
  static const String xParseRestApiKey = 'X-Parse-REST-API-Key';
  static const String xParseSessionToken = 'X-Parse-Session-Token';

  static Map<String, dynamic> obterheaders(bool withKeyToken) {
    if (withKeyToken) {
      return {
        StorageKeys.contentType: 'application/json',
        StorageKeys.xParseApplicationId:
            'wK7GcEjr2V4br5q5mlR1kybQ5dvxMFDX0qtE1d6Y',
        StorageKeys.xParseRestApiKey:
            '2kahi62fkWePLWAwC7k8aMrtQkobogcgkruMxbeB',
        StorageKeys.xParseSessionToken: 'r:8a815e8dd637f3a966f50ec60fccc9c4',
      };
    } else {
      return {
        StorageKeys.contentType: 'application/json',
        StorageKeys.xParseApplicationId:
            'wK7GcEjr2V4br5q5mlR1kybQ5dvxMFDX0qtE1d6Y',
        StorageKeys.xParseRestApiKey:
            '2kahi62fkWePLWAwC7k8aMrtQkobogcgkruMxbeB',
      };
    }
  }
}
