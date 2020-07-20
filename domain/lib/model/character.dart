import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Character extends Equatable {
  Character({
    @required this.name,
    @required this.image,
  })  : assert(name != null),
        assert(image != null);

  final String name;
  final String image;

  @override
  List<Object> get props => [name, image];
}
