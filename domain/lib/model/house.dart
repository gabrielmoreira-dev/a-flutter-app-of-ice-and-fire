import 'package:meta/meta.dart';

class House {
  House({
    @required this.name,
    this.image,
  }) : assert(name != null);

  final String name;
  final String image;
}
