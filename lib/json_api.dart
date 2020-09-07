class ScaleIndia {
  int id;
  String requestId;
  String center;
  String assessrName;
  String batchNo;
  String tqOption4;
  int tqCorrectAnswer;
  int tqMarks;
  String tqVersionOfQb;
  String tqLanguage;

  ScaleIndia({
    this.id,
    this.requestId,
    this.center,
    this.assessrName,
    this.batchNo,
    this.tqOption4,
    this.tqCorrectAnswer,
    this.tqMarks,
    this.tqVersionOfQb,
    this.tqLanguage,
  });

  ScaleIndia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    requestId = json['requestId'];
    center = json['center'];
    assessrName = json['assessrName'];
    batchNo = json['batchNo'];
    tqOption4 = json['tqOption4'];
    tqCorrectAnswer = json['tqCorrectAnswer'];
    tqMarks = json['tqMarks'];
    tqVersionOfQb = json['tqVersionOfQb'];
    tqLanguage = json['tqLanguage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['requestId'] = this.requestId;
    data['center'] = this.center;
    data['assessrName'] = this.assessrName;
    data['batchNo'] = this.batchNo;
    data['tqOption4'] = this.tqOption4;
    data['tqCorrectAnswer'] = this.tqCorrectAnswer;
    data['tqMarks'] = this.tqMarks;
    data['tqVersionOfQb'] = this.tqVersionOfQb;
    data['tqLanguage'] = this.tqLanguage;
    return data;
  }
}
