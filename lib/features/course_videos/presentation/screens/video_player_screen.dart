import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/constants/app_colors.dart';
import '../../data/model/course_video_model.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key, required this.courseVideoModel});

  final CourseVideoModel courseVideoModel;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();

    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(widget.courseVideoModel.url),
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    final controlManager = flickManager.flickControlManager;

    if (controlManager != null && controlManager.isFullscreen) {
      controlManager.toggleFullscreen();
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldPop = await _onWillPop();
        if (shouldPop && context.mounted) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: Text(widget.courseVideoModel.title),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () async {
              final shouldPop = await _onWillPop();
              if (!shouldPop) return;
              if (!context.mounted) return;
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: FlickVideoPlayer(flickManager: flickManager),
          ),
        ),
      ),
    );
  }
}
