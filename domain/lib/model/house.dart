import 'package:meta/meta.dart';

class House {
  House({
    @required this.name,
    @required this.logoURL,
  })  : assert(name != null),
        assert(logoURL != null);

  final String name;
  final String logoURL;
}
