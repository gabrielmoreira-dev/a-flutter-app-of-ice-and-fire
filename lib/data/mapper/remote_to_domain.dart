import 'package:domain/model/house.dart';

import '../remote/model/house_rm.dart';

extension HouseRMMapperToDM on HouseRM {
  House toDM() {
    print('remote to dm $image');
    return House(
      name: name,
      image: image,
    );
  }
}
