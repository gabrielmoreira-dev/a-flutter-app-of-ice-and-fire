import 'package:domain/model/character.dart';
import 'package:meta/meta.dart';

class CharacterDetails extends Character {
  CharacterDetails({
    @required String name,
    @required String image,
    @required this.culture,
    @required this.titles,
    this.allegiances,
  })  : assert(culture != null),
        assert(titles != null),
        assert(name != null),
        assert(image != null),
        super(
          name: name,
          image: image,
        );

  final List<String> culture;
  final List<String> titles;
  final List<String> allegiances;
}
