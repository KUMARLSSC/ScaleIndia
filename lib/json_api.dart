class ScaleIndia {
  int id;
  String center;
  String assessrName;
  String batchNo;
  ScaleIndia({
    this.id,
    this.center,
    this.assessrName,
    this.batchNo,
  });

  ScaleIndia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    center = json['center'];
    assessrName = json['assessrName'];
    batchNo = json['batchNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['center'] = this.center;
    data['assessrName'] = this.assessrName;
    data['batchNo'] = this.batchNo;
    return data;
  }
}
