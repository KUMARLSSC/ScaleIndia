import 'package:file_picker/file_picker.dart';

class ResumeSelector {
  // ignore: missing_return
  selectResum() async {
    return await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
  }
}
