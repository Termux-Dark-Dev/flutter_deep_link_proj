import 'package:flutter/material.dart';
import 'package:media_social/models/post_model.dart';
import 'package:media_social/widgets/custom_image_loader.dart';
import 'package:media_social/widgets/video_player_wih_control.dart';

class PostsData {
  static final List<PostModel<Text>> textPosts = [
    PostModel<Text>(
      userAlpha: "A",
      userName: "Alice",
      dataSrc:
          "The only way to do great work is to love what you do. - Steve Jobs",
      body: const Text(
          "The only way to do great work is to love what you do. - Steve Jobs"),
      id: 1,
    ),
    PostModel<Text>(
      userAlpha: "B",
      userName: "Bob",
      dataSrc:
          "Why don't scientists trust atoms? Because they make up everything!",
      body: const Text(
          "Why don't scientists trust atoms? Because they make up everything!"),
      id: 2,
    ),
    PostModel<Text>(
      userAlpha: "C",
      userName: "Charlie",
      dataSrc:
          "Life is what happens when you're busy making other plans. - John Lennon",
      body: const Text(
          "Life is what happens when you're busy making other plans. - John Lennon"),
      id: 3,
    ),
    PostModel<Text>(
      userAlpha: "D",
      userName: "Diana",
      dataSrc:
          "I told my wife she was drawing her eyebrows too high. She looked surprised.",
      body: const Text(
          "I told my wife she was drawing her eyebrows too high. She looked surprised."),
      id: 4,
    ),
  ];

  static final List<PostModel<Widget>> videoPosts = [
    PostModel<Widget>(
      userAlpha: 'Z',
      userName: "Zara",
      dataSrc:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      id: 1,
      body: const VideoPlayerControlWidget(
        videoUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ),
    ),
    PostModel<Widget>(
      userAlpha: 'M',
      userName: "Max",
      dataSrc:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      id: 2,
      body: const VideoPlayerControlWidget(
        videoUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      ),
    ),
    PostModel<Widget>(
      userAlpha: 'S',
      userName: "Sam",
      dataSrc:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      id: 3,
      body: const VideoPlayerControlWidget(
        videoUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ),
    ),
    PostModel<Widget>(
      userAlpha: 'L',
      userName: "Lara",
      dataSrc:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      id: 4,
      body: const VideoPlayerControlWidget(
        videoUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      ),
    ),
  ];

  static final List<PostModel<CustomImageLoader>> imagePosts = [
    PostModel<CustomImageLoader>(
      userAlpha: 'V',
      userName: "Vexia",
      id: 1,
      dataSrc:
          "https://images.pexels.com/photos/14448239/pexels-photo-14448239.jpeg",
      body: const CustomImageLoader(
        imageUrl:
            "https://images.pexels.com/photos/14448239/pexels-photo-14448239.jpeg",
      ),
    ),
    PostModel<CustomImageLoader>(
      userAlpha: 'M',
      userName: "Max",
      id: 2,
      dataSrc:
          "https://images.pexels.com/photos/2103127/pexels-photo-2103127.jpeg",
      body: const CustomImageLoader(
        imageUrl:
            "https://images.pexels.com/photos/2103127/pexels-photo-2103127.jpeg",
      ),
    ),
    PostModel<CustomImageLoader>(
      userAlpha: 'S',
      userName: "Sam",
      id: 3,
      dataSrc:
          "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg",
      body: const CustomImageLoader(
        imageUrl:
            "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg",
      ),
    ),
    PostModel<CustomImageLoader>(
      userAlpha: 'L',
      userName: "Lara",
      id: 4,
      dataSrc: "https://images.pexels.com/photos/34950/pexels-photo.jpg",
      body: const CustomImageLoader(
        imageUrl: "https://images.pexels.com/photos/34950/pexels-photo.jpg",
      ),
    ),
  ];
}
