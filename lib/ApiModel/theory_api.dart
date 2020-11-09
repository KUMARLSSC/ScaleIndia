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
  String tqImg;
  String tqNos;
  String tqDifficultyLevel;
  Null tqNosNavigation;
  Null tqVersionOfQbNavigation;

  Theory(
      {this.tqCode,
      this.tqQuestion,
      this.tqOption1,
      this.tqOption2,
      this.tqOption3,
      this.tqOption4,
      this.tqCorrectAnswer,
      this.tqMarks,
      this.tqVersionOfQb,
      this.tqLanguage,
      this.tqImg,
      this.tqNos,
      this.tqDifficultyLevel,
      this.tqNosNavigation,
      this.tqVersionOfQbNavigation});

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
    tqImg = json['tqImg'];
    tqNos = json['tqNos'];
    tqDifficultyLevel = json['tqDifficultyLevel'];
    tqNosNavigation = json['tqNosNavigation'];
    tqVersionOfQbNavigation = json['tqVersionOfQbNavigation'];
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
    data['tqImg'] = this.tqImg;
    data['tqNos'] = this.tqNos;
    data['tqDifficultyLevel'] = this.tqDifficultyLevel;
    data['tqNosNavigation'] = this.tqNosNavigation;
    data['tqVersionOfQbNavigation'] = this.tqVersionOfQbNavigation;
    return data;
  }
}
