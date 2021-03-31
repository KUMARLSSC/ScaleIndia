class RPL4Feedback {
  final String id;
  final String topic;
  final String videourl;
  final String videoFileName;

  RPL4Feedback({this.id, this.topic, this.videoFileName, this.videourl});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'topic': topic,
      'videoFileName': videoFileName,
      'videourl': videourl,
    };
  }

  static RPL4Feedback fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return RPL4Feedback(
      id: map['id'],
      topic: map['topic'],
      videoFileName: map['videoFileName'],
      videourl: map['videourl'],
    );
  }
}
