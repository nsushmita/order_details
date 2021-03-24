class OrderDetails {
  OrderDetails({
    this.content,
    this.pageable,
    this.last,
    this.totalPages,
    this.totalElements,
    this.sort,
    this.first,
    this.numberOfElements,
    this.size,
    this.number,
    this.empty,
  });

  List<OrderContent> content;
  Pageable pageable;
  bool last;
  int totalPages;
  int totalElements;
  Sort sort;
  bool first;
  int numberOfElements;
  int size;
  int number;
  bool empty;

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
    content: List<OrderContent>.from(json["content"].map((x) => OrderContent.fromJson(x))),
    pageable: Pageable.fromJson(json["pageable"]),
    last: json["last"],
    totalPages: json["totalPages"],
    totalElements: json["totalElements"],
    sort: Sort.fromJson(json["sort"]),
    first: json["first"],
    numberOfElements: json["numberOfElements"],
    size: json["size"],
    number: json["number"],
    empty: json["empty"],
  );

  Map<String, dynamic> toJson() => {
    "content": List<dynamic>.from(content.map((x) => x.toJson())),
    "pageable": pageable.toJson(),
    "last": last,
    "totalPages": totalPages,
    "totalElements": totalElements,
    "sort": sort.toJson(),
    "first": first,
    "numberOfElements": numberOfElements,
    "size": size,
    "number": number,
    "empty": empty,
  };
}

class OrderContent {
  OrderContent({
    this.orderId,
    this.user,
    this.driverId,
    this.merchantId,
    this.orderValue,
    this.orderWeight,
    this.orderDetails,
    this.routeId,
    this.destLatitude,
    this.destLongitude,
    this.destAddress,
    this.customerPhone,
    this.requestedOn,
    this.acceptedOn,
    this.pickedupOn,
    this.completedOn,
    this.fromAddress,
    this.fromLatitude,
    this.fromLongitude,
    this.status,
    this.tip,
    this.costOfDrive,
    this.driveDistance,
    this.cardId,
  });

  int orderId;
  User user;
  int driverId;
  int merchantId;
  double orderValue;
  double orderWeight;
  String orderDetails;
  String routeId;
  double destLatitude;
  double destLongitude;
  String destAddress;
  dynamic customerPhone;
  int requestedOn;
  int acceptedOn;
  int pickedupOn;
  int completedOn;
  String fromAddress;
  double fromLatitude;
  double fromLongitude;
  String status;
  int tip;
  double costOfDrive;
  double driveDistance;
  String cardId;

  factory OrderContent.fromJson(Map<String, dynamic> json) => OrderContent(
    orderId: json["orderId"],
    user: User.fromJson(json["user"]),
    driverId: json["driverId"],
    merchantId: json["merchantId"],
    orderValue: json["orderValue"],
    orderWeight: json["orderWeight"],
    orderDetails: json["orderDetails"],
    routeId: json["routeId"],
    destLatitude: json["destLatitude"].toDouble(),
    destLongitude: json["destLongitude"].toDouble(),
    destAddress: json["destAddress"],
    customerPhone: json["customerPhone"],
    requestedOn: json["requestedOn"],
    acceptedOn: json["acceptedOn"],
    pickedupOn: json["pickedupOn"],
    completedOn: json["completedOn"],
    fromAddress: json["fromAddress"],
    fromLatitude: json["fromLatitude"].toDouble(),
    fromLongitude: json["fromLongitude"].toDouble(),
    status: json["status"],
    tip: json["tip"],
    costOfDrive: json["costOfDrive"].toDouble(),
    driveDistance: json["driveDistance"],
    cardId: json["cardId"],
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "user": user.toJson(),
    "driverId": driverId,
    "merchantId": merchantId,
    "orderValue": orderValue,
    "orderWeight": orderWeight,
    "orderDetails": orderDetails,
    "routeId": routeId,
    "destLatitude": destLatitude,
    "destLongitude": destLongitude,
    "destAddress": destAddress,
    "customerPhone": customerPhone,
    "requestedOn": requestedOn,
    "acceptedOn": acceptedOn,
    "pickedupOn": pickedupOn,
    "completedOn": completedOn,
    "fromAddress": fromAddress,
    "fromLatitude": fromLatitude,
    "fromLongitude": fromLongitude,
    "status": status,
    "tip": tip,
    "costOfDrive": costOfDrive,
    "driveDistance": driveDistance,
    "cardId": cardId,
  };
}

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.addressStreet,
    this.addressCity,
    this.addressState,
    this.postalCode,
    this.registeredOn,
    this.mobileNumber,
    this.email,
    this.roleId,
    this.roleName,
  });

  int id;
  FirstName firstName;
  LastName lastName;
  Gender gender;
  AddressStreet addressStreet;
  AddressCity addressCity;
  AddressState addressState;
  String postalCode;
  int registeredOn;
  String mobileNumber;
  Email email;
  int roleId;
  RoleName roleName;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: firstNameValues.map[json["firstName"]],
    lastName: lastNameValues.map[json["lastName"]],
    gender: genderValues.map[json["gender"]],
    addressStreet: addressStreetValues.map[json["addressStreet"]],
    addressCity: addressCityValues.map[json["addressCity"]],
    addressState: addressStateValues.map[json["addressState"]],
    postalCode: json["postalCode"],
    registeredOn: json["registeredOn"],
    mobileNumber: json["mobileNumber"],
    email: emailValues.map[json["email"]],
    roleId: json["roleId"],
    roleName: roleNameValues.map[json["roleName"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstNameValues.reverse[firstName],
    "lastName": lastNameValues.reverse[lastName],
    "gender": genderValues.reverse[gender],
    "addressStreet": addressStreetValues.reverse[addressStreet],
    "addressCity": addressCityValues.reverse[addressCity],
    "addressState": addressStateValues.reverse[addressState],
    "postalCode": postalCode,
    "registeredOn": registeredOn,
    "mobileNumber": mobileNumber,
    "email": emailValues.reverse[email],
    "roleId": roleId,
    "roleName": roleNameValues.reverse[roleName],
  };
}

enum AddressCity { ACHAMPET_A }

final addressCityValues = EnumValues({
  "Achampet A": AddressCity.ACHAMPET_A
});

enum AddressState { ANDRA_PRADESH_A }

final addressStateValues = EnumValues({
  "Andra Pradesh a": AddressState.ANDRA_PRADESH_A
});

enum AddressStreet { GANESH_NAGAR }

final addressStreetValues = EnumValues({
  "ganesh nagar": AddressStreet.GANESH_NAGAR
});

enum Email { TESTINGDRIVER1_GMAIL_COM }

final emailValues = EnumValues({
  "testingdriver1@gmail.com": Email.TESTINGDRIVER1_GMAIL_COM
});

enum FirstName { RAVELLA_LATHA }

final firstNameValues = EnumValues({
  "Ravella latha": FirstName.RAVELLA_LATHA
});

enum Gender { FEMALE }

final genderValues = EnumValues({
  "Female": Gender.FEMALE
});

enum LastName { LATHA_R }

final lastNameValues = EnumValues({
  "lathaR": LastName.LATHA_R
});

enum RoleName { DRIVER }

final roleNameValues = EnumValues({
  "DRIVER": RoleName.DRIVER
});

class Pageable {
  Pageable({
    this.sort,
    this.pageNumber,
    this.pageSize,
    this.offset,
    this.unpaged,
    this.paged,
  });

  Sort sort;
  int pageNumber;
  int pageSize;
  int offset;
  bool unpaged;
  bool paged;

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
    sort: Sort.fromJson(json["sort"]),
    pageNumber: json["pageNumber"],
    pageSize: json["pageSize"],
    offset: json["offset"],
    unpaged: json["unpaged"],
    paged: json["paged"],
  );

  Map<String, dynamic> toJson() => {
    "sort": sort.toJson(),
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    "offset": offset,
    "unpaged": unpaged,
    "paged": paged,
  };
}

class Sort {
  Sort({
    this.sorted,
    this.unsorted,
    this.empty,
  });

  bool sorted;
  bool unsorted;
  bool empty;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
    sorted: json["sorted"],
    unsorted: json["unsorted"],
    empty: json["empty"],
  );

  Map<String, dynamic> toJson() => {
    "sorted": sorted,
    "unsorted": unsorted,
    "empty": empty,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
