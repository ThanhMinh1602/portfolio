import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:new_portfolio/components/footer/footer.dart';
import 'package:new_portfolio/pages/details/widgets/project_description.dart';
import 'package:new_portfolio/pages/details/widgets/project_features.dart';
import 'package:new_portfolio/pages/details/widgets/project_image.dart';
import 'package:new_portfolio/pages/details/widgets/project_repo_files.dart';
import 'package:new_portfolio/pages/details/widgets/project_technologies.dart';
import 'package:new_portfolio/pages/details/widgets/project_video.dart';
import 'package:video_player/video_player.dart';

class ProjectDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final List<String> features;
  final String? imagePath;
  final String? videoUrl;
  final String? repoOwner;
  final String? repoName;
  final String? branch;
  final String? link;

  const ProjectDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.technologies,
    required this.features,
    this.imagePath,
    this.videoUrl,
    this.repoOwner,
    this.repoName,
    this.branch = "main",
    this.link,
  });

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  VideoPlayerController? _videoController;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    if (widget.videoUrl != null) {
      if (widget.videoUrl!.startsWith('http')) {
        _videoController = VideoPlayerController.network(widget.videoUrl!)
          ..initialize()
              .then((_) {
                setState(() {
                  _isInitialized = true;
                });
                _videoController!.play();
              })
              .catchError((error) {
                print('Error initializing video: $error');
              });
      } else {
        _videoController = VideoPlayerController.asset(widget.videoUrl!)
          ..initialize()
              .then((_) {
                setState(() {
                  _isInitialized = true;
                });
                _videoController!.play();
              })
              .catchError((error) {
                print('Error initializing video: $error');
              });
      }
      _videoController?.addListener(() {
        if (mounted) setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  void _playPause() {
    setState(() {
      _videoController!.value.isPlaying
          ? _videoController!.pause()
          : _videoController!.play();
    });
  }

  void _replay() {
    _videoController!.seekTo(Duration.zero);
    _videoController!.play();
  }

  void _stop() {
    _videoController!.pause();
    _videoController!.seekTo(Duration.zero);
  }

  void _fastForward() {
    if (_videoController != null && _isInitialized) {
      final currentPosition = _videoController!.value.position;
      final duration = _videoController!.value.duration;
      final newPosition = currentPosition + const Duration(seconds: 10);
      if (newPosition < duration) {
        _videoController!.seekTo(newPosition);
      } else {
        _videoController!.seekTo(duration);
      }
    }
  }

  void _rewind() {
    if (_videoController != null && _isInitialized) {
      final currentPosition = _videoController!.value.position;
      final newPosition = currentPosition - const Duration(seconds: 10);
      if (newPosition > Duration.zero) {
        _videoController!.seekTo(newPosition);
      } else {
        _videoController!.seekTo(Duration.zero);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.9),
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProjectImage(imagePath: widget.imagePath),
              ProjectDescription(description: widget.description),
              ProjectFeatures(features: widget.features),
              ProjectTechnologies(technologies: widget.technologies),
              ProjectVideo(
                videoUrl: widget.videoUrl,
                onPlayPause: _playPause,
                onReplay: _replay,
                onStop: _stop,
                onFastForward: _fastForward,
                onRewind: _rewind,
                controller: _videoController,
                isInitialized: _isInitialized,
              ),
              ProjectRepoFiles(
                repoOwner: widget.repoOwner,
                repoName: widget.repoName,
                branch: widget.branch,
                token: dotenv.env['KEY_GITHUB_API']!,
              ),
              FooterWidget(),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black.withOpacity(0.9),
    );
  }
}
