import 'package:intl/intl.dart';

class Request {
  int? id;
  DateTime? createdAt;
  String? companyName;
  String? location;
  String? businessNumber;
  String? businessEmail;
  (String, String)? workingHours;
  String? logo;
  String? userId; //
  Request({
    this.id,
    this.createdAt,
    this.businessEmail,
    this.businessNumber,
    this.companyName,
    this.location,
    this.logo,
    this.userId,
    this.workingHours,
  });
  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "company_name": companyName,
      "location_of_business": location,
      "bussiness_account_number": businessNumber,
      "email": businessEmail,
      "working_hours": {
        "start_time": workingHours?.$1,
        "end_time": workingHours?.$2,
      },
      "company_logo": logo,
    };
  }

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      id: json['id'],
      businessEmail: json['email'],
      businessNumber: json['business_account_number'],
      companyName: json['company_name'],
      location: json['location_of_business'],
      logo: json['company_logo'],
      userId: json['user_id'],
      workingHours: (
        json['working_hours']['start_time'],
        json['working_hours']['end_time'],
      ),
      createdAt: DateFormat('yyyy-MM-dd HH:mm:ss').parseUTC(json['created_at']),
    );
  }
}
