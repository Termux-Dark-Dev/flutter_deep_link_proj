import 'package:flutter/material.dart';
import 'package:media_social/screens/image_post_screen.dart';
import 'package:media_social/screens/text_post_screen.dart';
import 'package:media_social/screens/video_post_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _screenIdx = 0;
  final List<Widget> _screenList = const [
    TextPostScreen(),
    VideoPostScreen(),
    ImagePostScreen()
  ];
  void _changeScreen(int value) {
    setState(() {
      _screenIdx = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: _screenIdx == 0
              ? const Text(
                  "Text Posts",
                  style: TextStyle(color: Colors.white),
                )
              : _screenIdx == 1
                  ? const Text(
                      "Video Posts",
                      style: TextStyle(color: Colors.white),
                    )
                  : const Text(
                      "Image Posts",
                      style: TextStyle(color: Colors.white),
                    ),
        ),
        body: _screenList[_screenIdx],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 2,
          currentIndex: _screenIdx,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          backgroundColor: Colors.blueGrey,
          onTap: (value) {
            _changeScreen(value);
          },
          selectedLabelStyle:
              const TextStyle(color: Colors.white),
              selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.tab,
              ),
              activeIcon: Icon(
                Icons.tab,
                color: Colors.white,
              ),
              label: "Text",
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.video_call,
                  color: Colors.white,
                ),
                icon: Icon(Icons.video_call),
                label: "Video"),
            BottomNavigationBarItem(
                icon: Icon(Icons.image),
                activeIcon: Icon(
                  Icons.image,
                  color: Colors.white,
                ),
                label: "Image")
          ],
        ),
      ),
    );
  }
}
