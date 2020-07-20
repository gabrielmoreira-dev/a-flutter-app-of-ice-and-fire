import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CharacterDetails extends Equatable {
  CharacterDetails({
    @required this.name,
    @required this.image,
    @required this.culture,
    @required this.titles,
    this.allegiances,
  })  : assert(culture != null),
        assert(titles != null),
        assert(name != null),
        assert(image != null);

  final String name;
  final String image;
  final List<String> culture;
  final List<String> titles;
  final List<String> allegiances;

  @override
  List<Object> get props => [name, image, culture, titles, allegiances];
}
