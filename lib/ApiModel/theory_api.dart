class Theory {
  int tqCode;
  String tqQuestion;
  String tqOption1;
  String tqOption2;
  String tqOption3;
  String tqOption4;
  int tqCorrectAnswer;
  int tqMarks;
  String tqVersionOfQb;
  String tqLanguage;

  Theory({
    this.tqCode,
    this.tqQuestion,
    this.tqOption1,
    this.tqOption2,
    this.tqOption3,
    this.tqOption4,
    this.tqCorrectAnswer,
    this.tqMarks,
    this.tqVersionOfQb,
    this.tqLanguage,
  });

  Theory.fromJson(Map<String, dynamic> json) {
    tqCode = json['tqCode'];
    tqQuestion = json['tqQuestion'];
    tqOption1 = json['tqOption1'];
    tqOption2 = json['tqOption2'];
    tqOption3 = json['tqOption3'];
    tqOption4 = json['tqOption4'];
    tqCorrectAnswer = json['tqCorrectAnswer'];
    tqMarks = json['tqMarks'];
    tqVersionOfQb = json['tqVersionOfQb'];
    tqLanguage = json['tqLanguage'];
  }
   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tqCode'] = this.tqCode;
    data['tqQuestion'] = this.tqQuestion;
    data['tqOption1'] = this.tqOption1;
    data['tqOption2'] = this.tqOption2;
    data['tqOption3'] = this.tqOption3;
    data['tqOption4'] = this.tqOption4;
    data['tqCorrectAnswer'] = this.tqCorrectAnswer;
    data['tqMarks'] = this.tqMarks;
    data['tqVersionOfQb'] = this.tqVersionOfQb;
    data['tqLanguage'] = this.tqLanguage;
    return data;
  }
}
