import 'dart:convert';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:media_social/models/post_model.dart';
import 'package:media_social/utils/custom_snackbar.dart';
import 'package:media_social/utils/route_names.dart';
import 'package:media_social/widgets/custom_image_loader.dart';
import 'package:video_player/video_player.dart';

class Post extends StatelessWidget {
  final PostModel model;
  final VideoPlayerController? controller;
  final bool showViewDetailBtn;
  const Post(
      {super.key,
      required this.model,
      required this.showViewDetailBtn,
      this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(offset: Offset(0, 4), spreadRadius: 0, blurRadius: 4)
          ]),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          // username and logo
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Colors.blueGrey, shape: BoxShape.circle),
                child: Text(
                  model.userAlpha,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 20),
              Text(
                "@${model.userName}",
                style: const TextStyle(color: Colors.black),
              )
            ],
          ),
          // main body
          Container(
            constraints: BoxConstraints(
                maxHeight: size.height * 0.2, maxWidth: size.width),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: model.body,
          ),
          // copy and share btn
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              showViewDetailBtn
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey),
                      onPressed: () {
                        String jsonString = jsonEncode({
                          "userAlpha": model.userAlpha,
                          "userName": model.userName,
                          "id": model.id,
                          "body": model.body.toString(),
                          "type": model.body is Text
                              ? "text"
                              : model.body is CustomImageLoader
                                  ? "image"
                                  : "video",
                          "dataSrc": model.dataSrc
                        });
                        String base64Encoded =
                            base64Encode(utf8.encode(jsonString));
                        context.goNamed(RouteNames.postViewPage,
                            pathParameters: {"data": base64Encoded});
                      },
                      child: const Text(
                        "View Details",
                        style: TextStyle(color: Colors.white),
                      ))
                  : const SizedBox(),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () {
                    String jsonString = jsonEncode({
                      "userAlpha": model.userAlpha,
                      "userName": model.userName,
                      "id": model.id,
                      "body": model.body.toString(),
                      "type": model.body is Text
                          ? "text"
                          : model.body is CustomImageLoader
                              ? "image"
                              : "video",
                      "dataSrc": model.dataSrc
                    });
                    String base64Encoded =
                        base64Encode(utf8.encode(jsonString));
                    Clipboard.setData(ClipboardData(
                        text:
                            "https://deep-link-eg-web-app.vercel.app/post/$base64Encoded"));
                    CustomSnackbar.showCustomSnackBar(
                      context: context,
                      msg: "Link copied to clipboard.",
                      snackBarColor: Colors.blueGrey,
                      type: AnimatedSnackBarType.info,
                      icon: Icons.copy,
                    );
                  },
                  icon: const Icon(
                    Icons.share_sharp,
                    color: Colors.blueGrey,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class SinglePost extends StatelessWidget {
  final PostModel model;
  final VideoPlayerController? controller;
  final bool showViewDetailBtn;
  const SinglePost(
      {super.key,
      required this.model,
      required this.showViewDetailBtn,
      this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(offset: Offset(0, 4), spreadRadius: 0, blurRadius: 4)
          ]),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          // username and logo
          Container(
            // color: Colors.amber,
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Colors.blueGrey, shape: BoxShape.circle),
                  child: Text(
                    model.userAlpha,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  "@${model.userName}",
                  style: const TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
          // main body
          Expanded(
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(
                  maxHeight: size.height * 0.2, maxWidth: size.width),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: model.body,
            ),
          ),
          // copy and share btn
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              showViewDetailBtn
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey),
                      onPressed: () {
                        String jsonString = jsonEncode({
                          "userAlpha": model.userAlpha,
                          "userName": model.userName,
                          "id": model.id,
                          "body": model.body.toString(),
                          "type": model.body is Text
                              ? "text"
                              : model.body is CustomImageLoader
                                  ? "image"
                                  : "video",
                          "dataSrc": model.dataSrc
                        });
                        String base64Encoded =
                            base64Encode(utf8.encode(jsonString));
                        context.pushNamed(RouteNames.postViewPage,
                            pathParameters: {"data": base64Encoded});
                      },
                      child: const Text(
                        "View Details",
                        style: TextStyle(color: Colors.white),
                      ))
                  : const SizedBox(),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () {
                    String jsonString = jsonEncode({
                      "userAlpha": model.userAlpha,
                      "userName": model.userName,
                      "id": model.id,
                      "body": model.body.toString(),
                      "type": model.body is Text
                          ? "text"
                          : model.body is CustomImageLoader
                              ? "image"
                              : "video",
                      "dataSrc": model.dataSrc
                    });
                    String base64Encoded =
                        base64Encode(utf8.encode(jsonString));
                    Clipboard.setData(ClipboardData(
                        text:
                            "https://deep-link-eg-web-app.vercel.app/post/$base64Encoded"));
                    CustomSnackbar.showCustomSnackBar(
                      context: context,
                      msg: "Link copied to clipboard.",
                      snackBarColor: Colors.blueGrey,
                      type: AnimatedSnackBarType.info,
                      icon: Icons.copy,
                    );
                  },
                  icon: const Icon(
                    Icons.share_sharp,
                    color: Colors.blueGrey,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
