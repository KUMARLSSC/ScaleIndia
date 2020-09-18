class Candidate {
  String clEnrollmentNo;
  String clName;
  int clReqNo;
  bool clPracticalDone;
  bool clTheoryDeone;

  Candidate(
      {this.clEnrollmentNo,
      this.clName,
      this.clReqNo,
      this.clPracticalDone,
      this.clTheoryDeone});

  Candidate.fromJson(Map<String, dynamic> json) {
    clEnrollmentNo = json['clEnrollmentNo'];
    clName = json['clName'];
    clReqNo = json['clReqNo'];
    clPracticalDone = json['clPracticalDone'];
    clTheoryDeone = json['clTheoryDeone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clEnrollmentNo'] = this.clEnrollmentNo;
    data['clName'] = this.clName;
    data['clReqNo'] = this.clReqNo;
    data['clPracticalDone'] = this.clPracticalDone;
    data['clTheoryDeone'] = this.clTheoryDeone;
    return data;
  }
}
