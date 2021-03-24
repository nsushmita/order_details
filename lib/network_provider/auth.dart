import 'package:order_details/utils/constants.dart';
import 'api_provider.dart';

class ApiProvider {

  Future getOrderDetails(int orderId,var startDate,var endDate) async {
    final String url = "$urlEndPoint/deliveryhostory-getdeliverysbetweendatebasedondriverid/$orderId/$startDate/$endDate";
    var result = await authService.get(url);
    if (result == null || result.isEmpty) {
      print("No order details found");
      return Future.error(genericErrorMessage);
    }
    return result;
  }
}

final apiProvider = ApiProvider();
