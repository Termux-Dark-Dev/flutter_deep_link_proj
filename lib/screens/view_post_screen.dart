import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:media_social/models/post_model.dart';
import 'package:media_social/widgets/custom_image_loader.dart';
import 'package:media_social/widgets/post_widget.dart';
import 'package:media_social/widgets/video_player_wih_control.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class ViewSinglePost extends StatefulWidget {
  String? data;
  ViewSinglePost({super.key, required this.data});

  @override
  State<ViewSinglePost> createState() => _ViewSinglePostState();
}

class _ViewSinglePostState extends State<ViewSinglePost> {
  late Map<String, dynamic> myMap;
  VideoPlayerController? controller;

  void decodeParameter() {
    try {
      var jsonString = utf8.decode(base64Decode(widget.data!));
      myMap = jsonDecode(jsonString);
      if (myMap["type"] == "video") {
        controller = VideoPlayerController.networkUrl(
          Uri.parse(myMap["dataSrc"]),
        )..initialize().then((_) {
            setState(() {
              controller!.play();
            });
          }).catchError((_) {
            widget.data = "No proper parameter";
          });
      }
    } catch (e) {
      widget.data = "No proper parameter";
    }
  }

  @override
  void initState() {
    super.initState();
    decodeParameter();
  }

  @override
  void dispose() {
    if (controller != null) {
      controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey,
              title: const Text(
                "Post",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: widget.data == "No proper parameter"
                ? const Center(
                    child: Text("No post found."),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width > 700
                            ? size.width * 0.25
                            : size.width * 0.1,
                        vertical: size.width > 700
                            ? size.height * 0.25
                            : size.height * 0.1),
                    child: SinglePost(
                        showViewDetailBtn: false,
                        model: PostModel<dynamic>(
                            dataSrc: myMap["dataSrc"],
                            userAlpha: myMap["userAlpha"],
                            userName: myMap["userName"],
                            id: myMap["id"],
                            body: myMap["type"] == "text"
                                ? Text(myMap["dataSrc"])
                                : myMap["type"] == "image"
                                    ? CustomImageLoader(
                                        imageUrl: myMap["dataSrc"])
                                    : VideoPlayerControlWidget(videoUrl: myMap["dataSrc"]))),
                  )));
  }
}
