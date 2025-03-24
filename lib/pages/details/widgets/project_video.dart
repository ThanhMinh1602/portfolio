import 'package:flutter/material.dart';
import 'package:new_portfolio/pages/details/widgets/video_control_button.dart';
import 'package:video_player/video_player.dart';
import 'package:new_portfolio/constants/app_style.dart';

class ProjectVideo extends StatefulWidget {
  final String? videoUrl;
  final VoidCallback onPlayPause;
  final VoidCallback onReplay;
  final VoidCallback onStop;
  final VoidCallback onFastForward;
  final VoidCallback onRewind;
  final VideoPlayerController? controller;
  final bool isInitialized;

  const ProjectVideo({
    super.key,
    this.videoUrl,
    required this.onPlayPause,
    required this.onReplay,
    required this.onStop,
    required this.onFastForward,
    required this.onRewind,
    this.controller,
    required this.isInitialized,
  });

  @override
  State<ProjectVideo> createState() => _ProjectVideoState();
}

class _ProjectVideoState extends State<ProjectVideo> {
  static const _aspectRatio = 16 / 6; // Tỉ lệ 16/6 cố định

  @override
  Widget build(BuildContext context) {
    if (widget.videoUrl == null || widget.controller == null) {
      return const SizedBox.shrink();
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTitle(),
          const SizedBox(height: 20),
          _buildVideoPlayer(),
          const SizedBox(height: 16),
          if (widget.isInitialized) _buildControlButtons(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Demo Video',
      style: AppStyle.button.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return AspectRatio(
      aspectRatio: _aspectRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            widget.isInitialized
                ? VideoPlayer(widget.controller!)
                : _buildLoadingIndicator(),
            if (widget.isInitialized) ...[
              _buildOverlayGradient(),
              _buildPlayPauseButton(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Container(
      color: Colors.grey[900],
      child: const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }

  Widget _buildOverlayGradient() {
    return AnimatedOpacity(
      opacity: widget.controller!.value.isPlaying ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.7),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayPauseButton() {
    return GestureDetector(
      onTap: widget.onPlayPause,
      child: AnimatedOpacity(
        opacity: widget.controller!.value.isPlaying ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            shape: BoxShape.circle,
          ),
          child: Icon(
            widget.controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget _buildControlButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        VideoControlButton(icon: Icons.replay_10, onPressed: widget.onRewind),
        const SizedBox(width: 16),
        VideoControlButton(icon: Icons.replay, onPressed: widget.onReplay),
        const SizedBox(width: 16),
        VideoControlButton(
          icon:
              widget.controller!.value.isPlaying
                  ? Icons.pause
                  : Icons.play_arrow,
          onPressed: widget.onPlayPause,
        ),
        const SizedBox(width: 16),
        VideoControlButton(icon: Icons.stop, onPressed: widget.onStop),
        const SizedBox(width: 16),
        VideoControlButton(
          icon: Icons.forward_10,
          onPressed: widget.onFastForward,
        ),
      ],
    );
  }
}
