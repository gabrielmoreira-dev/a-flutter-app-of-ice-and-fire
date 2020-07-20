import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class House extends Equatable {
  House({
    @required this.name,
    @required this.logoURL,
  })  : assert(name != null),
        assert(logoURL != null);

  final String name;
  final String logoURL;

  @override
  List<Object> get props => [name, logoURL];
}
