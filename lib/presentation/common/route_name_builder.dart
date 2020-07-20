class RouteNameBuilder {
  static const houseListResource = 'houseList';
  static const characterListResource = 'characterList';
  static const houseNameParameter = 'houseName';
  static const characterDetailsResource = 'characterDetails';
  static const characterNameParameter = 'characterName';

  static String houseList() => '$houseListResource';

  static String characterList(String houseName) =>
      '$characterListResource/$houseName';

  static String characterDetails(String name) =>
      '$characterDetailsResource/$name';
}
