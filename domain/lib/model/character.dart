import 'package:meta/meta.dart';

class Character {
  Character({
    @required this.name,
    @required this.image,
  })  : assert(name != null),
        assert(image != null);

  final String name;
  final String image;
}
