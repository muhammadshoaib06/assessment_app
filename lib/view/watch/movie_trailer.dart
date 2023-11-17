import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MovieTrailer extends StatefulWidget {
  const MovieTrailer({super.key, required this.videoKey});

  final String videoKey;

  @override
  State<MovieTrailer> createState() => _MovieTrailerState();
}

class _MovieTrailerState extends State<MovieTrailer> {
  late YoutubePlayerController? controller;

  @override
  void initState() {
    initController();
    super.initState();
  }

  void initController() {
    controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoKey,
      autoPlay: true,
      params: const YoutubePlayerParams(
        showFullscreenButton: false,
        enableCaption: true,
        loop: false,
        mute: false,
        enableKeyboard: false,
        showControls: true,
      ),
    )..enterFullScreen(lock: true);
  }

  void _onVideoEnded() {
    // Navigate back when the video ends
    Navigator.pop(context);
  }

  @override
  void dispose() {
    controller!.close();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: YoutubePlayerScaffold(
          controller: controller!,
          defaultOrientations: const [
            DeviceOrientation.landscapeLeft,
          ],
          lockedOrientations: const [
            DeviceOrientation.landscapeLeft,
          ],
          fullscreenOrientations: const [
            DeviceOrientation.landscapeLeft,
          ],
          enableFullScreenOnVerticalDrag: true,
          autoFullScreen: true,
          backgroundColor: Colors.black,
          aspectRatio: 16 / 9,
          builder: (context, player) {
            return player;
          },
        ),
      ),
    );
  }
}
