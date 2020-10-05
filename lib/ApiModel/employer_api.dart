class Employer {
  final String id;
  final String companyName;
  final String companyEmailAddress;
  final String companyAddress;
  final String city;
  final String companyPhoneNumber;
  final String pointOfContactNumber;
  final String pointOfContactName;
  final String pocEmailAdress;
  final String pincode;
  final String state;
  

  Employer(
      {this.companyEmailAddress,
      this.id,
      this.companyName,
      this.companyAddress,
      this.city,
      this.companyPhoneNumber,
      this.pointOfContactNumber,
      this.pointOfContactName,
      this.pincode,
      this.pocEmailAdress,
      this.state,
     });

  Employer.fromData(Map<String, dynamic> data)
      : companyEmailAddress = data['companyEmailAddress'],
        id = data['id'],
        companyName = data['companyName'],
        companyAddress = data['companyAddress'],
        city = data['city'],
        companyPhoneNumber = data['companyPhoneNumber'],
        pointOfContactName=data['pointOfContactName'],
        pocEmailAdress=data['pocEmailAdress'],
        pincode=data['pincode'],
        state=data['state'],
        pointOfContactNumber = data['pointOfContactNumber'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'companyName': companyName,
      'companyEmailAddress': companyEmailAddress,
      'companyAddress': companyAddress,
      'city': city,
      'companyPhoneNumber': companyPhoneNumber,
      'pointOfContactNumber': pointOfContactNumber,
      'pointOfContactName':pointOfContactName,
      'pocEmailAdress':pocEmailAdress,
      'pincode':pincode,
      'state':state,
    };
  }
}
