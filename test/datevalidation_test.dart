import 'package:flutter_test/flutter_test.dart';
import 'package:order_details/network_provider/auth.dart';


void main() {

  DateTime currentDate = DateTime.now();
  var sevenDaysBefore = currentDate.subtract(Duration(days: 7));
  var thirtyDaysBefore = currentDate.subtract(Duration(days: 30));

  group('ValidationDateTest -', () {
     test('7 days before', () async {
        var sevenDaysBeforeEpoch = (sevenDaysBefore.millisecondsSinceEpoch/1000).round();
        var currentDateEpoch = (currentDate.millisecondsSinceEpoch/1000).round();
        var request = apiProvider.getOrderDetails(20, sevenDaysBeforeEpoch, currentDateEpoch);
        var response = await request;
        expect(response.length,19);
      });

      test('30 days before', () async {
        var thirtyDaysBeforeEpoch = (thirtyDaysBefore.millisecondsSinceEpoch/1000).round();
        var currentDateEpoch = (currentDate.millisecondsSinceEpoch/1000).round();
        var request = apiProvider.getOrderDetails(20, thirtyDaysBeforeEpoch, currentDateEpoch);
        var response = await request;
        expect(response.length,20);
      });
    });

}