class EmployeeCandidateSourcing {
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
  final String imageUrl;
  final String documentId;
  final String imageFileName;

  EmployeeCandidateSourcing({
    this.employeeEmailAddress,
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
    this.workExperiance,
    this.documentId,
    this.imageUrl,
    this.imageFileName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
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
      'educationalQualification': educationalQualification,
      'documnetId': documentId,
      'imageUrl': imageUrl,
      'imageFileName': imageFileName,
    };
  }

  static EmployeeCandidateSourcing fromMap(
      Map<String, dynamic> map, String documentId) {
    if (map == null) return null;
    return EmployeeCandidateSourcing(
        employeeEmailAddress: map['employeeEmailAddress'],
        id: map['id'],
        name: map['name'],
        address: map['address'],
        gender: map['gender'],
        phoneNumber: map['phoneNumber'],
        alternatePhoneNumber: map['alternatePhoneNumber'],
        dateOfBirth: map['dateOfBirth'],
        city: map['city'],
        motherName: map['motherName'],
        fatherName: map['fatherName'],
        pincode: map['pincode'],
        state: map['state'],
        workExperiance: map['workExperiance'],
        lastCompanyWorkedFor: map['lastCompanyWorkedFor'],
        lastWorkingDesignation: map['lastWorkingDesignation'],
        educationalQualification: map['educationalQualification'],
        documentId: map['documemntId'],
        imageUrl: map['imageUrl'],
        imageFileName: map['imageFileName'],
        aadharNumber: map['aadharNumber']);
  }
}
