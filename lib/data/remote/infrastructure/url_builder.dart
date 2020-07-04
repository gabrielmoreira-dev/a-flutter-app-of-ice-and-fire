class UrlBuilder {
  static const _baseURL = 'https://api.got.show/api/show/';
  static const _houseResource = 'houses';
  static const _characterListResource = 'characters/byHouse/';
  static const _characterResource = 'characters/';

  static String houseList() => '$_baseURL$_houseResource';

  static String characterList(String houseName) =>
      '$_baseURL$_characterListResource$houseName';

  static String character(String name) => '$_baseURL$_characterResource$name';
}
