import 'dart:convert';

List<TheoryResult> theoryResultFromJson(String str) => List<TheoryResult>.from(
    json.decode(str).map((x) => TheoryResult.fromJson(x)));

String theoryResultToJson(List<TheoryResult> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TheoryResult {
  TheoryResult({
    this.trId,
    this.trbatchId,
    this.trCandidateId,
    this.trMarks1,
    this.trMarks2,
    this.trMarks3,
    this.trMarks4,
    this.trMarks5,
    this.trMarks6,
    this.trMarks7,
    this.trMarks8,
    this.trMarks9,
    this.trMarks10,
    this.trMarks11,
    this.trMarks12,
    this.trMarks13,
    this.trMarks14,
    this.trMarks15,
    this.trMarks16,
    this.trMarks17,
    this.trMarks18,
    this.trMarks19,
    this.trMarks20,
    this.trTotalMarks,
    this.trbatch,
    this.tblFinalResult,
  });

  int trId;
  // ignore: avoid_init_to_null
  int trbatchId = null;
  // ignore: avoid_init_to_null
  String trCandidateId = null;
  int trMarks1 = 0;
  int trMarks2 = 0;
  int trMarks3 = 0;
  int trMarks4 = 0;
  int trMarks5 = 0;
  int trMarks6 = 0;
  int trMarks7 = 0;
  int trMarks8 = 0;
  int trMarks9 = 0;
  int trMarks10 = 0;
  int trMarks11 = 0;
  int trMarks12 = 0;
  int trMarks13 = 0;
  int trMarks14 = 0;
  int trMarks15 = 0;
  int trMarks16 = 0;
  int trMarks17 = 0;
  int trMarks18 = 0;
  int trMarks19 = 0;
  int trMarks20 = 0;
  int trTotalMarks = 0;
  dynamic trbatch;
  List<dynamic> tblFinalResult;

  factory TheoryResult.fromJson(Map<String, dynamic> json) => TheoryResult(
        trId: json["trId"],
        trbatchId: json["trbatchId"],
        trCandidateId: json["trCandidateId"],
        trMarks1: json["trMarks1"],
        trMarks2: json["trMarks2"],
        trMarks3: json["trMarks3"],
        trMarks4: json["trMarks4"],
        trMarks5: json["trMarks5"],
        trMarks6: json["trMarks6"],
        trMarks7: json["trMarks7"],
        trMarks8: json["trMarks8"],
        trMarks9: json["trMarks9"],
        trMarks10: json["trMarks10"],
        trMarks11: json["trMarks11"],
        trMarks12: json["trMarks12"],
        trMarks13: json["trMarks13"],
        trMarks14: json["trMarks14"],
        trMarks15: json["trMarks15"],
        trMarks16: json["trMarks16"],
        trMarks17: json["trMarks17"],
        trMarks18: json["trMarks18"],
        trMarks19: json["trMarks19"],
        trMarks20: json["trMarks20"],
        trTotalMarks: json["trTotalMarks"],
        trbatch: json["trbatch"],
        tblFinalResult:
            List<dynamic>.from(json["tblFinalResult"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "trId": trId,
        "trbatchId": trbatchId,
        "trCandidateId": trCandidateId,
        "trMarks1": trMarks1,
        "trMarks2": trMarks2,
        "trMarks3": trMarks3,
        "trMarks4": trMarks4,
        "trMarks5": trMarks5,
        "trMarks6": trMarks6,
        "trMarks7": trMarks7,
        "trMarks8": trMarks8,
        "trMarks9": trMarks9,
        "trMarks10": trMarks10,
        "trMarks11": trMarks11,
        "trMarks12": trMarks12,
        "trMarks13": trMarks13,
        "trMarks14": trMarks14,
        "trMarks15": trMarks15,
        "trMarks16": trMarks16,
        "trMarks17": trMarks17,
        "trMarks18": trMarks18,
        "trMarks19": trMarks19,
        "trMarks20": trMarks20,
        "trTotalMarks": trTotalMarks,
        "trbatch": trbatch,
        "tblFinalResult": List<dynamic>.from(tblFinalResult.map((x) => x)),
      };
}
