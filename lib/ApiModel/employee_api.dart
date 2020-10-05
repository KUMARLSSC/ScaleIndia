class Employee {
  final String id;
  final String name;
  final String emailAddress;
  final String gender;
  final String phoneNumber;
  final String alternatePhoneNumber;
  final String aadharNumber;
  final String motherName;
  final String fatherName;
  final String pincode;
  final String state;
  final String district;
  final String dateOfBirth;
  final String educationalQualification;
  final String workExperiance;
  final String lastCompanyWorkedFor;
  final String lastWorkingDesignation;
  final String address;

  Employee(
      {this.emailAddress,
      this.address,
      this.id,
      this.name,
      this.gender,
      this.phoneNumber,
      this.alternatePhoneNumber,
      this.aadharNumber,
      this.dateOfBirth,
      this.district,
      this.educationalQualification,
      this.fatherName,
      this.lastCompanyWorkedFor,
      this.lastWorkingDesignation,
      this.motherName,
      this.pincode,
      this.state,
      this.workExperiance});

  Employee.fromData(Map<String, dynamic> data)
      : emailAddress = data['emailAddress'],
        id = data['id'],
        name = data['name'],
        address=data['address'],
        gender = data['gender'],
        phoneNumber = data['phoneNumber'],
        alternatePhoneNumber = data['alternatePhoneNumber'],
        dateOfBirth = data['dateOfBirth'],
        district = data['district'],
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
      'emailAddress': emailAddress,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'alternatePhoneNumber': alternatePhoneNumber,
      'aadharNumber': aadharNumber,
      'motherName': motherName,
      'fatherName': fatherName,
      'pincode': pincode,
      'state': state,
      'district': district,
      'dateOfBirth': dateOfBirth,
      'workExperiance': workExperiance,
      'lastCompanyWorkedFor': lastCompanyWorkedFor,
      'lastWorkingDesignation': lastWorkingDesignation,
      'educationalQualification': educationalQualification
    };
  }
}
