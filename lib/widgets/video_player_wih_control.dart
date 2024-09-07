import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerControlWidget extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerControlWidget({super.key,required this.videoUrl});

  @override
  State<VideoPlayerControlWidget> createState() =>
      _VideoPlayerControlWidgetState();
}

class _VideoPlayerControlWidgetState extends State<VideoPlayerControlWidget> {
  late final VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
          widget.videoUrl),
    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose controller when widget is destroyed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: _controller.value.isInitialized
          ? Column(
              children: [
                SizedBox(
                    height: size.width>700?size.height * 0.09:size.height*0.1, child: VideoPlayer(_controller)),
                IconButton(
                    onPressed: () {
                      _controller.addListener(
                        () {
                          if (_controller.value.isCompleted) {
                            setState(() {});
                          }
                        },
                      );
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    icon: _controller.value.isCompleted
                        ? const Icon(Icons.restart_alt)
                        : _controller.value.isPlaying
                            ? const Icon(Icons.pause)
                            : const Icon(Icons.play_arrow))
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
