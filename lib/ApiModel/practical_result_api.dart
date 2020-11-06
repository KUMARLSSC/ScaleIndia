// To parse this JSON data, do
//
//     final practicalResult = practicalResultFromJson(jsonString);

import 'dart:convert';

List<PracticalResult> practicalResultFromJson(String str) =>
    List<PracticalResult>.from(
        json.decode(str).map((x) => PracticalResult.fromJson(x)));

String practicalResultToJson(List<PracticalResult> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PracticalResult {
  PracticalResult({
    this.prId,
    this.prbatchId,
    this.prCandidateId,
    this.prQuestionId,
    this.prMarks,
    this.prNos,
    this.prType,
    this.prNosNavigation,
    this.prQuestion,
    this.prbatch,
  });

  int prId;
  int prbatchId;
  String prCandidateId;
  int prQuestionId;
  int prMarks;
  PrNos prNos;
  bool prType;
  dynamic prNosNavigation;
  dynamic prQuestion;
  dynamic prbatch;

  factory PracticalResult.fromJson(Map<String, dynamic> json) =>
      PracticalResult(
        prId: json["prId"],
        prbatchId: json["prbatchId"],
        prCandidateId: json["prCandidateId"],
        prQuestionId: json["prQuestionId"],
        prMarks: json["prMarks"] == null ? null : json["prMarks"],
        prNos: json["prNos"] == null ? null : prNosValues.map[json["prNos"]],
        prType: json["prType"],
        prNosNavigation: json["prNosNavigation"],
        prQuestion: json["prQuestion"],
        prbatch: json["prbatch"],
      );

  Map<String, dynamic> toJson() => {
        "prId": prId,
        "prbatchId": prbatchId,
        "prCandidateId": prCandidateId,
        "prQuestionId": prQuestionId,
        "prMarks": prMarks == null ? null : prMarks,
        "prNos": prNos == null ? null : prNosValues.reverse[prNos],
        "prType": prType,
        "prNosNavigation": prNosNavigation,
        "prQuestion": prQuestion,
        "prbatch": prbatch,
      };
}

enum PrNos { LSS_N5501, LSS_N8501, LSS_N5502, LSS_N8701, LSS_N8601 }

final prNosValues = EnumValues({
  "LSS/N5501": PrNos.LSS_N5501,
  "LSS/N5502": PrNos.LSS_N5502,
  "LSS/N8501": PrNos.LSS_N8501,
  "LSS/N8601": PrNos.LSS_N8601,
  "LSS/N8701": PrNos.LSS_N8701
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
