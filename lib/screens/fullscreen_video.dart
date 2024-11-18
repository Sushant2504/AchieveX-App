import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../ui/theme.dart';

class FullScreenPlayer extends StatefulWidget {
  final String post;

  const FullScreenPlayer({super.key, required this.post});

  @override
  _FullScreenPlayerState createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool showProgressIndicator = false;
  bool isFullScreen = false;

  @override
  void initState() {
    super.initState();
    showProgressIndicator = true;

    _controller = VideoPlayerController.networkUrl(Uri.parse(
       
            widget.post.toString()))
      ..initialize().then((_) {
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.black,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _controller.value.isInitialized
                ? GestureDetector(
                    onTap: _toggleVideoPlayPause,
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  )
                : (showProgressIndicator)
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.accentColor,
                          ),
                        ),
                      )
                    : Container(),
            (widget.post.toString().endsWith('.mp4'))
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 40,
                        icon: _isPlaying
                            ? const Icon(Icons.pause)
                            : const Icon(Icons.play_arrow),
                        onPressed: _toggleVideoPlayPause,
                      ),
                      IconButton(
                          iconSize: 40,
                          onPressed: _toggleFullScreen,
                          icon: const Icon(Icons.fullscreen)),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  void _toggleFullScreen() {
    Navigator.of(context).pop();
  }

  void _toggleVideoPlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }
}
