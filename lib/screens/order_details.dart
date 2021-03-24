import 'package:flutter/material.dart';
import 'package:order_details/models/order_details.dart';
import 'package:order_details/network_provider/auth.dart';
import 'package:order_details/utils/color.dart';
import 'package:order_details/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:order_details/widgets/order_details_container.dart';

class OrderDetailsScreen extends StatefulWidget {
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {

  List<OrderContent> orderDetailsList = [];
  String selectedFilterValue = last7days;
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  DateTime startDate;
  DateTime endDate;
  DateTime sevenDaysBefore;
  DateTime thirtyDaysBefore;
  bool isLoading = false;
  DateTime currentDate = DateTime.now();
  List<String> allFilters = [last7days,today, last30Days, customDate];
  
  @override
  void initState() {
    sevenDaysBefore = currentDate.subtract(Duration(days: 7));
    thirtyDaysBefore = currentDate.subtract(Duration(days: 30));
    fetchAllOrders(sevenDaysBefore,currentDate);
    super.initState();
  }
  
  fetchAllOrders(DateTime firstDate,DateTime endDate) async {
    orderDetailsList = [];
    setState(() {
      isLoading = true;
    });
    await apiProvider.getOrderDetails(20, currentTimeInSeconds(firstDate), currentTimeInSeconds(endDate)).then((value){
      var data = value;
      List dataList = data.map((i) => OrderContent.fromJson(i)).toList();
      for(var i in dataList){
        setState(() {
          orderDetailsList.add(i);
          isLoading = false;
        });
      }
    }).catchError((error){
      setState(() {
        isLoading = false;
      });
      print(error);
    });
  }

  int currentTimeInSeconds(DateTime date) {
    var ms = date.millisecondsSinceEpoch;
    return (ms / 1000).round();
  }

  Future<DateTime> selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    var currentYear = DateTime
        .now()
        .year;
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(currentYear - 100),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
    return selectedDate;
  }
  
  @override
  Widget build(BuildContext context) {
    return isLoading?Scaffold(body: Center(child: CircularProgressIndicator()),):Scaffold(
      backgroundColor: ColorPalette.scaffoldColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () => {
          },
        ),
        title: Text("Request History"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                ColorPalette.appBarColor1,
                ColorPalette.appBarColor2
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: screenWidth,
                height: screenHeight*(45/640),
                child: Card(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        isExpanded: true,
                        itemHeight: 55,
                        icon: null,
                        iconEnabledColor: Colors.transparent,
                        iconDisabledColor: Colors.transparent,
                        value: selectedFilterValue,
                        items: allFilters.map((value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.calendar_today,color: Colors.orange,),
                                SizedBox(width:screenWidth*(20/360)),
                                Text(
                                  value,
                                  style: TextStyle(
                                    color: Colors
                                        .black,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedFilterValue = newValue;
                            filterValues();
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: selectedFilterValue=="Custom date"?true:false,
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Container(
                       width: screenWidth * (150/360),
                       child: TextFormField(controller: startDateController, decoration: new InputDecoration(
                         fillColor: Colors.white,
                         filled: true,
                         labelText: "Start date",
                         labelStyle:
                         TextStyle(fontSize: 14, color: Colors.grey),
                         enabledBorder: new OutlineInputBorder(
                           borderRadius: new BorderRadius.circular(3.84),
                           borderSide: new BorderSide(
                               color: ColorPalette.borderColor, width: 0.96),
                         ),
                         disabledBorder: new OutlineInputBorder(
                           borderRadius: new BorderRadius.circular(3.84),
                           borderSide: new BorderSide(
                               color: ColorPalette.borderColor, width: 0.96),
                         ),
                         border: new OutlineInputBorder(
                           borderRadius: new BorderRadius.circular(3.84),
                           borderSide: new BorderSide(
                               color: ColorPalette.borderColor, width: 0.96),
                         ),
                       ),onTap: () {
                         selectDate(context).then((value) {
                           setState(() {
                             startDateController.text = getFormattedDate(value.millisecondsSinceEpoch);
                             startDate = value;
                           });
                           filterValues();
                         });
                       },),
                     ),
                     Container(
                       width: screenWidth * (150/360),
                       child: TextFormField(controller: endDateController,decoration: new InputDecoration(
                         fillColor: Colors.white,
                         filled: true,
                         labelText: "End date",
                         labelStyle:
                         TextStyle(fontSize: 14, color: Colors.grey),
                         enabledBorder: new OutlineInputBorder(
                           borderRadius: new BorderRadius.circular(3.84),
                           borderSide: new BorderSide(
                               color: ColorPalette.borderColor, width: 0.96),
                         ),
                         disabledBorder: new OutlineInputBorder(
                           borderRadius: new BorderRadius.circular(3.84),
                           borderSide: new BorderSide(
                               color: ColorPalette.borderColor, width: 0.96),
                         ),
                         border: new OutlineInputBorder(
                           borderRadius: new BorderRadius.circular(3.84),
                           borderSide: new BorderSide(
                               color: ColorPalette.borderColor, width: 0.96),
                         ),
                       ),onTap: () {
                         selectDate(context).then((value) {
                           setState(() {
                             endDateController.text = getFormattedDate(value.millisecondsSinceEpoch);
                             endDate = value;
                           });
                           filterValues();
                         });
                         },),
                     )
                   ],
                  ),
                )
            ),
            Container(
              height: screenHeight,
              child: orderDetailsList.isEmpty?Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("No items found",style: TextStyle(fontSize: 16,color: Colors.black),),
              ):ListView.builder(
                itemCount: orderDetailsList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index){
                  return OrderDetailsContainer(orderDetailsList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  filterValues(){
    if(selectedFilterValue==last7days){
      fetchAllOrders(sevenDaysBefore, currentDate);
    }

    else if(selectedFilterValue==last30Days){
      fetchAllOrders(thirtyDaysBefore, currentDate);
    }

    else if(selectedFilterValue==today){
      fetchAllOrders(currentDate, currentDate);
    }

    else if(selectedFilterValue==customDate){
      if(startDate!=null && endDate!=null){
        fetchAllOrders(startDate, endDate);
      }
    }
  }

  String getFormattedDate(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat('dd MMM yyyy').format(date);
  }

}
