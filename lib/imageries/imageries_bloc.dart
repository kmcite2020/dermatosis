import 'package:file_picker/file_picker.dart';

import '../main.dart';
import 'imageries.dart';

final _imageries = box<Imagery>(store);
final imageriesRM = rm(_imageries);
final imageries = list(_imageries, imageriesRM);

bool get loadingImageries => imageriesRM.isWaiting;

void addImagery(Imagery imagery) => _imageries.put(imagery);
void removeImagery(int id) => _imageries.remove(id);

Future<Imagery?> pickImageToSaveImagery() async {
  final pickerResult = await FilePicker.platform.pickFiles();
  if (pickerResult != null) {
    final pickedPath = pickerResult.files.first.path;

    if (pickedPath != null) {
      imageries(Imagery()..path = pickedPath);
    }
  }
  return null;
}

class ImageriesRM {}
