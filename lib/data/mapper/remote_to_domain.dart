import 'package:domain/model/house.dart';

import '../remote/model/house_rm.dart';

extension HouseRMMapperToDM on HouseRM {
  House toDM() => House(
        name: name,
        image: logoURL,
      );
}
