import 'package:flutter/material.dart';

import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VlcPlayerController _videoPlayerController;

  Future<void> initializePlayer() async {}

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VlcPlayerController.network(
      'http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8',
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  @override
  void dispose() async {
    super.dispose();
    await _videoPlayerController.stopRendererScanning();
    await _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                child: VlcPlayer(
                  controller: _videoPlayerController,
                  aspectRatio: (2 / 3),
                  placeholder: Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
