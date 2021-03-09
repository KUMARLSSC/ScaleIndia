class Rpl4 {
  final String id;
  final String phoneNumber;

  Rpl4({
    this.id,
    this.phoneNumber,
  });

  Rpl4.fromData(Map<String, dynamic> data)
      : id = data['id'],
        phoneNumber = data['phoneNumber'];

  Map<String, dynamic> toJson() {
    return {'id': id, 'phoneNumber': phoneNumber};
  }
}
