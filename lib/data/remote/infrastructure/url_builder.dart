class UrlBuilder {
  static const _baseURL = 'https://api.got.show/api/';
  static const _houseResource = 'book/houses';

  static String get houseList => '$_baseURL$_houseResource';
}
