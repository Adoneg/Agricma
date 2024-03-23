import 'dart:developer';

import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Storage {
  final supabase = Supabase.instance;

  Future<String?> uploadImage(XFile image, String dir) async {
    try {
      final bytes = await image.readAsBytes();
      final fileName =
          DateTime.now().microsecondsSinceEpoch.toString() + image.name;
      await supabase.client.storage.from(dir).uploadBinary(fileName, bytes);
      final imageUrl = await supabase.client.storage
          .from(dir)
          .createSignedUrl(fileName, 60 * 60 * 24 * 365 * 10);
      return imageUrl;
    } on StorageException catch (e) {
      log('Storage error $e');
      return null;
    }
  }
}
