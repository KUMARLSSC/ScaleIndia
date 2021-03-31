import 'package:image_picker/image_picker.dart';

class VideoSelector {
  Future selectVideo() async {
    final pickedVideo =
        await ImagePicker().getVideo(source: ImageSource.camera);
    return pickedVideo;
  }
}
