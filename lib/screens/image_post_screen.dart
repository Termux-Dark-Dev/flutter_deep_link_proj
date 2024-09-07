import 'package:flutter/material.dart';
import 'package:media_social/utils/data.dart';
import 'package:media_social/widgets/post_widget.dart';

class ImagePostScreen extends StatelessWidget {
  const ImagePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 700) {
          return Container(
            padding: EdgeInsets.symmetric(
                vertical: 10, horizontal: constraints.maxWidth * 0.25),
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView.builder(
                itemCount: PostsData.imagePosts.length,
                itemBuilder: (context, index) {
                  return Post(
                      showViewDetailBtn: true,
                      model: PostsData.imagePosts[index]);
                },
              ),
            ),
          );
        } else {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: PostsData.imagePosts.length,
              itemBuilder: (context, index) {
                return Post(
                    showViewDetailBtn: true,
                    model: PostsData.imagePosts[index]);
              },
            ),
          );
        }
      },
    );
  }
}
