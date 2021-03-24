import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_details/models/order_details.dart';
import 'package:order_details/utils/color.dart';
import 'package:order_details/utils/constants.dart';

class OrderDetailsContainer extends StatefulWidget {

  final OrderContent orderDetails;

  OrderDetailsContainer(this.orderDetails);

  @override
  _OrderDetailsContainerState createState() => _OrderDetailsContainerState();
}

class _OrderDetailsContainerState extends State<OrderDetailsContainer> {

  OrderContent orderContent;

  @override
  void initState() {
    orderContent = widget.orderDetails;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(20.0),
          child: Table(
            columnWidths: {
              0: FlexColumnWidth(3),
              1: FlexColumnWidth(4),
              2: FlexColumnWidth(1),
            },
            border: TableBorder.all(color: Colors.transparent),
            children: [
              tableRow(orderId,orderContent.orderId.toString()),
              tableRow(driverId,orderContent.driverId.toString()),
              tableRow(status,orderContent.status),
              tableRow(orderDetails,orderContent.orderDetails),
              tableRow(weight,orderContent.orderWeight.toString()),
              tableRow(toAddress,orderContent.destAddress),
              tableRow(fromAddress,orderContent.fromAddress),
            ],
          ),
        ),
        Container(width: screenWidth, height: screenHeight*(0.5/640), color: Colors.grey[300],),
      ],
    );
  }

  tableRow(String title,String value) {
    return TableRow(children :[
      Text(title,style: TextStyle(fontSize: 16,color: ColorPalette.textColor,fontWeight: FontWeight.w600),),
      Text(value,style: TextStyle(fontSize: 14,color: value==completed?ColorPalette.completedColor:ColorPalette.valueColor),),
      title==weight?Icon(Icons.location_pin,color: Colors.orange,):Container()
    ]);
  }
}
