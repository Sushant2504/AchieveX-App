import 'package:achievex/screens/fullscreen_video.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDataCard extends StatefulWidget {
  final String post;

  const VideoDataCard({super.key, required this.post});

  @override
  _VideoDataState createState() => _VideoDataState();
}

class _VideoDataState extends State<VideoDataCard> {
  late VideoPlayerController _controller;
  final bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    print("v1--->${widget.post}");

    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.post))
      ..initialize().then((_) {
        // Ensure the first frame is shown when the video is loaded
        // setState(() {});
      });
    print("v2--->${widget.post}");
  }

  void _toggleVideoPlayPause() {
    // FullScreenVideoPlayer(controller:  _controller);
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    // setState(() {
    //   _isPlaying = !_isPlaying;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: <Widget>[
          GestureDetector(
            onTap: _toggleVideoPlayPause,
            child: SizedBox(
              height: 500,
              child: AspectRatio(
                aspectRatio: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              (widget.post.toString().endsWith('.mp4'))
                  ? IconButton(
                      iconSize: 40,
                      icon: const Icon(Icons.fullscreen),
                      onPressed: () => {
                        //  aps = 16/9

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreenPlayer(
                              post: widget.post,
                            ),
                          ),
                        ),
                        // FullScreenPlayer(post: widget.post),
                      },
                    )
                  : Container(),
              (widget.post.toString().endsWith('.mp4'))
                  ? IconButton(
                      iconSize: 40,
                      icon: _isPlaying
                          ? const Icon(Icons.pause)
                          : const Icon(Icons.play_arrow),
                      onPressed: _toggleVideoPlayPause,
                    )
                  : Container()
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
