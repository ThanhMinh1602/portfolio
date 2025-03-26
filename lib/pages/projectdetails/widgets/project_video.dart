import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';
import 'package:new_portfolio/utils/youtube_parser.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ProjectVideo extends StatefulWidget {
  const ProjectVideo({super.key, required this.videoUrl});
  final String videoUrl;

  @override
  State<ProjectVideo> createState() => _ProjectVideoState();
}

class _ProjectVideoState extends State<ProjectVideo> {
  late YoutubePlayerController _controller;
  String? videoId;
  @override
  void initState() {
    super.initState();
    videoId = YouTubeParser.getVideoId(widget.videoUrl);
    _controller = YoutubePlayerController.fromVideoId(
      videoId: videoId!,
      autoPlay: true,

      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        strictRelatedVideos: false,
        enableCaption: true,
        playsInline: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: YoutubePlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
          gestureRecognizers: {
            Factory<PanGestureRecognizer>(() => PanGestureRecognizer()),
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
