import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseExample extends StatefulWidget {
  const FirebaseExample({super.key});
  @override
  State<FirebaseExample> createState() => _FirebaseExampleState();
}

class _FirebaseExampleState extends State<FirebaseExample> {

  String? imageUrl;

  Future<void> _loadImage(name) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child(name);
      final url = await storageRef.getDownloadURL();
      setState(() {
        imageUrl = url;
      });
    } catch (e) {
      print('Failed to load image: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _loadImage('genre/Chill.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Center(
        child: imageUrl == null
            ? CircularProgressIndicator()
            : Image.network(imageUrl!,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!.toInt() : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.error);
          },
        ),
      ),
    );
  }
}
