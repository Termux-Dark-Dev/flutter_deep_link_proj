import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Created this class as the image laoding builder was not working properly
class CustomImageLoader extends StatefulWidget {
  final String imageUrl;
  const CustomImageLoader({Key? key, required this.imageUrl}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomImageLoaderState createState() => _CustomImageLoaderState();
}

class _CustomImageLoaderState extends State<CustomImageLoader> {
  late Future<Uint8List> _imageBytes;

  @override
  void initState() {
    super.initState();
    _imageBytes = _fetchImage(widget.imageUrl);
  }

  Future<Uint8List> _fetchImage(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.bodyBytes;
      } else {
        throw Exception("Failed to load image. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Failed to load image: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: _imageBytes,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while the image is being loaded
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          // Handle errors with a retry option
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
                color: Colors.red,
                size: 50,
              ),
              const SizedBox(height: 10),
              const Text(
                "Failed to load image.",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Retry fetching the image
                  setState(() {
                    _imageBytes = _fetchImage(widget.imageUrl);
                  });
                },
                child: const Text("Retry"),
              )
            ],
          );
        } else {
          // Display the image once it's loaded
          return Image.memory(
            snapshot.data!,
            fit: BoxFit.cover,
          );
        }
      },
    );
  }
}
