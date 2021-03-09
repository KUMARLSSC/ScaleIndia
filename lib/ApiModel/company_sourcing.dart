class ComapanySourcing {
  final String id;
  final String companyname;
  final String requestDepartment;
  final String gender;
  final String duration;
  final String function;
  final String jobRole;
  final String numberofposition;
  final String qualification;
  final String experience;
  final String state;
  final String city;
  final String dateOfJoin;
  final String specificDetails;
  final String category;
  //final String imageUrl;
  final String documentId;
  //final String imageFilecompanyName;

  ComapanySourcing({
    this.requestDepartment,
    this.id,
    this.companyname,
    this.gender,
    this.duration,
    this.function,
    this.jobRole,
    this.dateOfJoin,
    this.city,
    this.specificDetails,
    this.qualification,
    this.numberofposition,
    this.experience,
    this.state,
    this.documentId,
    //this.imageUrl,
    //this.imageFilecompanyName,
    this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'companyname': companyname,
      'requestDepartment': requestDepartment,
      'gender': gender,
      'duration': duration,
      'function': function,
      'jobRole': jobRole,
      'numberofposition': numberofposition,
      'qualification': qualification,
      'experience': experience,
      'state': state,
      'city': city,
      'dateOfJoin': dateOfJoin,
      'specificDetails': specificDetails,
      'documnetId': documentId,
      //'imageUrl': imageUrl,
//'imageFilecompanyName': imageFilecompanyName,
      'category': category,
    };
  }

  static ComapanySourcing fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;
    return ComapanySourcing(
      requestDepartment: map['requestDepartment'],
      id: map['id'],
      companyname: map['companyname'],
      gender: map['gender'],
      duration: map['duration'],
      function: map['function'],
      dateOfJoin: map['dateOfJoin'],
      city: map['city'],
      numberofposition: map['numberofposition'],
      qualification: map['qualification'],
      experience: map['experience'],
      state: map['state'],
      specificDetails: map['specificDetails'],
      documentId: map['documemntId'],
      // imageUrl: map['imageUrl'],
      // imageFilecompanyName: map['imageFilecompanyName'],
      jobRole: map['jobRole'],
      category: map['category'],
    );
  }
}
