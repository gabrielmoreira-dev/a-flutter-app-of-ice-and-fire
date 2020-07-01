class RouteNameBuilder {
  static const houseListResource = 'houseList';
  static const characterListResource = 'characterList';
  static const houseNameParameter = 'houseName';

  static String houseList() => '$houseListResource';

  static String characterList(String houseName) =>
      '$characterListResource/$houseName';
}
