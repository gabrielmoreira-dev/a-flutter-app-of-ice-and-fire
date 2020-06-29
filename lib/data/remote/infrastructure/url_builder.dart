class UrlBuilder {
  static const _baseURL = 'https://api.got.show/api/show/';
  static const _houseResource = 'houses';
  static const _characterListResource = 'characters/byHouse/';

  static String houseList() => '$_baseURL$_houseResource';

  static String characterList(String houseName) =>
      '$_baseURL$_characterListResource$houseName';
}
