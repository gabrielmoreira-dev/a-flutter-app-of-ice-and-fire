import '../cache/model/house_cm.dart';
import '../remote/model/house_rm.dart';

extension HouseRMMapperToCM on HouseRM {
  HouseCM toCM() => HouseCM(
        name: name,
        image: logoURL,
      );
}
