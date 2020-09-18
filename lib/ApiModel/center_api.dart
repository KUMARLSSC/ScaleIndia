class CenterAssesor {
  int asId;
  String asContactPerson;
  String asSdmsbatchName;
  String centerName;
  String asQuestionBankId;
  String asQuestionVersion;
  bool qvHindi;
  bool qvTamil;
  bool qvBangla;

  CenterAssesor(
      {this.asId,
      this.asContactPerson,
      this.asSdmsbatchName,
      this.centerName,
      this.asQuestionBankId,
      this.asQuestionVersion,
      this.qvHindi,
      this.qvTamil,
      this.qvBangla});
  CenterAssesor.initial()
      : asId = 0,
        asContactPerson = '',
        asSdmsbatchName = '',
        centerName = '';

  CenterAssesor.fromJson(Map<String, dynamic> json) {
    asId = json['asId'];
    asContactPerson = json['asContactPerson'];
    asSdmsbatchName = json['asSdmsbatchName'];
    centerName = json['centerName'];
    asQuestionBankId = json['asQuestionBankId'];
    asQuestionVersion = json['asQuestionVersion'];
    qvHindi = json['qvHindi'];
    qvTamil = json['qvTamil'];
    qvBangla = json['qvBangla'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['asId'] = this.asId;
    data['asContactPerson'] = this.asContactPerson;
    data['asSdmsbatchName'] = this.asSdmsbatchName;
    data['centerName'] = this.centerName;
    data['asQuestionBankId'] = this.asQuestionBankId;
    data['asQuestionVersion'] = this.asQuestionVersion;
    data['qvHindi'] = this.qvHindi;
    data['qvTamil'] = this.qvTamil;
    data['qvBangla'] = this.qvBangla;
    return data;
  }
}
