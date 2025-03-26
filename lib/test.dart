import 'package:flutter/material.dart';
import 'package:new_portfolio/utils/youtube_parser.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: VideoPlayerScreen());
  }
}

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;
  final String url =
      'https://www.youtube.com/watch?v=ABvUHh71hcY&list=RDABvUHh71hcY&start_radio=1';
  String? videoId;

  @override
  void initState() {
    super.initState();
    videoId = YouTubeParser.getVideoId(url);
    _controller = YoutubePlayerController.fromVideoId(
      videoId: videoId!,
      autoPlay: true,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        strictRelatedVideos: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('YouTube Video Player (Web)')),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          aspectRatio: 16 / 9, // Standard YouTube aspect ratio
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close(); // Clean up the controller
    super.dispose();
  }
}
