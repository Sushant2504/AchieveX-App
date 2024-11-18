import 'package:flutter/cupertino.dart';
import 'package:appinio_video_player/appinio_video_player.dart';

class VideoScreen extends StatefulWidget {
  String vLink;
  VideoScreen({super.key, required this.vLink});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    final String value1 = data!['id'].toString();
    final String value2 = data['v_link'].toString();

    videoPlayerController = VideoPlayerController.network(value2)
      ..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
    );
    return Container(
      child: CustomVideoPlayer(
        customVideoPlayerController: _customVideoPlayerController,
      ),
    );
  }
}
