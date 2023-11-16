import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MovieTrailer extends StatefulWidget {
  const MovieTrailer({super.key, required this.videoKey});

  final String videoKey;

  @override
  State<MovieTrailer> createState() => _MovieTrailerState();
}

class _MovieTrailerState extends State<MovieTrailer> {
  // // YoutubePlayerController? _controller;
  // final videoPlayerController = VideoPlayerController.networkUrl(
  //   Uri.parse('https://www.youtube.com/watch?v=hyyyKcfJRGQ'),
  //   videoPlayerOptions: VideoPlayerOptions(
  //     allowBackgroundPlayback: false,
  //   ),
  // );
  // late final ChewieController chewieController;
  //
  // @override
  // void initState() {
  //   // _controller = YoutubePlayerController(
  //   //   initialVideoId: widget.videoKey,
  //   //   flags: const YoutubePlayerFlags(
  //   //     autoPlay: true,
  //   //     mute: false,
  //   //     controlsVisibleAtStart: true,
  //   //     enableCaption: true,
  //   //     forceHD: false,
  //   //     useHybridComposition: false,
  //   //   ),
  //   // );
  //   chewieController = ChewieController(
  //     materialProgressColors: ChewieProgressColors(
  //         bufferedColor: Colors.grey, playedColor: Colors.white),
  //     aspectRatio: 5 / 3,
  //     allowFullScreen: true,
  //     allowMuting: true,
  //     fullScreenByDefault: true,
  //     showControls: true,
  //     videoPlayerController: videoPlayerController,
  //     autoPlay: true,
  //     looping: true,
  //   );
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   videoPlayerController.dispose();
  //   chewieController.dispose();
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   print('Video key ${widget.videoKey}');
  //   return Scaffold(
  //     // body: YoutubePlayerBuilder(
  //     //   key: ObjectKey(widget.videoKey),
  //     //   player: YoutubePlayer(
  //     //     controller: _controller!,
  //     //     showVideoProgressIndicator: true,
  //     //     progressIndicatorColor: Colors.blueAccent,
  //     //     onReady: () {
  //     //       //_controller!.addListener(listener);
  //     //     },
  //     //     onEnded: (data) {
  //     //       // Video ended, navigate to the previous screen
  //     //       Navigator.pop(context);
  //     //     },
  //     //   ),
  //     //   onEnterFullScreen: () {
  //     //     print('Enter to full screen');
  //     //   },
  //     //   onExitFullScreen: () {
  //     //     SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  //     //     Navigator.pop(context);
  //     //   },
  //     //   builder: (context, player) {
  //     //     return player;
  //     //   },
  //     // ),
  //     body: Chewie(
  //       controller: chewieController,
  //     ),
  //   );
  //
  //   // return Scaffold(
  //   //   body: Center(
  //   //     child: YoutubePlayer(
  //   //       controller: _controller!,
  //   //       showVideoProgressIndicator: true,
  //   //       progressIndicatorColor: Colors.blueAccent,
  //   //     ),
  //   //   ),
  //   // );
  // }

  final String videoUrl = 'https://www.youtube.com/embed/hyyyKcfJRGQ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChewieVideoPlayer(
          videoPlayerController: VideoPlayerController.networkUrl(
            Uri.parse(videoUrl),
            videoPlayerOptions: VideoPlayerOptions(
              allowBackgroundPlayback: false,
              mixWithOthers: false,
            ),
          ),
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}

class ChewieVideoPlayer extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final double aspectRatio;

  ChewieVideoPlayer({
    super.key,
    required this.videoPlayerController,
    required this.aspectRatio,
  });

  @override
  _ChewieVideoPlayerState createState() => _ChewieVideoPlayerState();
}

class _ChewieVideoPlayerState extends State<ChewieVideoPlayer> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: widget.aspectRatio,
      autoPlay: true,
      looping: true,
      autoInitialize: true,
      allowFullScreen: true,
      allowMuting: true,
    );
  }

  @override
  void dispose() {
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }
}
