class Employee {
  final String id;
  final String name;
  final String employeeEmailAddress;
  final String gender;
  final String phoneNumber;
  final String alternatePhoneNumber;
  final String aadharNumber;
  final String motherName;
  final String fatherName;
  final String pincode;
  final String state;
  final String city;
  final String dateOfBirth;
  final String educationalQualification;
  final String workExperiance;
  final String lastCompanyWorkedFor;
  final String lastWorkingDesignation;
  final String address;

  Employee(
      {this.employeeEmailAddress,
      this.address,
      this.id,
      this.name,
      this.gender,
      this.phoneNumber,
      this.alternatePhoneNumber,
      this.aadharNumber,
      this.dateOfBirth,
      this.city,
      this.educationalQualification,
      this.fatherName,
      this.lastCompanyWorkedFor,
      this.lastWorkingDesignation,
      this.motherName,
      this.pincode,
      this.state,
      this.workExperiance});

  Employee.fromData(Map<String, dynamic> data)
      : employeeEmailAddress = data['employeeEmailAddress'],
        id = data['id'],
        name = data['name'],
        address=data['address'],
        gender = data['gender'],
        phoneNumber = data['phoneNumber'],
        alternatePhoneNumber = data['alternatePhoneNumber'],
        dateOfBirth = data['dateOfBirth'],
        city = data['city'],
        motherName = data['motherName'],
        fatherName = data['fatherName'],
        pincode = data['pincode'],
        state = data['state'],
        workExperiance = data['workExperiance'],
        lastCompanyWorkedFor = data['lastCompanyWorkedFor'],
        lastWorkingDesignation = data['lastWorkingDesignation'],
        educationalQualification = data['educationalQualification'],
        aadharNumber = data['aadharNumber'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address':address,
      'employeeEmailAddress': employeeEmailAddress,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'alternatePhoneNumber': alternatePhoneNumber,
      'aadharNumber': aadharNumber,
      'motherName': motherName,
      'fatherName': fatherName,
      'pincode': pincode,
      'state': state,
      'city': city,
      'dateOfBirth': dateOfBirth,
      'workExperiance': workExperiance,
      'lastCompanyWorkedFor': lastCompanyWorkedFor,
      'lastWorkingDesignation': lastWorkingDesignation,
      'educationalQualification': educationalQualification
    };
  }
}
