import 'package:achievex/screens/widgets/CustomGestureDetector.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import '../utils/colors.dart';

class AudioBookPage extends StatefulWidget {
  final String audioTitle;
  final String audioBookImage;
  final List episodes;

  const AudioBookPage({
    super.key,
    required this.audioTitle,
    required this.audioBookImage,
    required this.episodes,
  });

  @override
  _AudioBookPageState createState() => _AudioBookPageState();
}

class _AudioBookPageState extends State<AudioBookPage> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
  bool showBottomMenu = false;
  double _playbackSpeed = 1.0;
  int _currentEpisodeIndex = 0;
  String _currentEpisode = "";
  String _currentAudioSource = "";

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _currentEpisode = widget.episodes[_currentEpisodeIndex]["title"]!;
    _currentAudioSource = widget.episodes[_currentEpisodeIndex]["source"]!;

    _audioPlayer.onPositionChanged.listen((Duration position) {
      setState(() {
        _currentPosition = position;
      });
    });

    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _totalDuration = duration;
      });
    });

    _audioPlayer.setPlaybackRate(_playbackSpeed);
  }

  void _togglePlayPause() {
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play(UrlSource(_currentAudioSource));
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _rewind10Seconds() {
    Duration newPosition = _currentPosition - const Duration(seconds: 10);
    if (newPosition < Duration.zero) newPosition = Duration.zero;
    _audioPlayer.seek(newPosition);
  }

  void _fastForward10Seconds() {
    Duration newPosition = _currentPosition + const Duration(seconds: 10);
    if (newPosition > _totalDuration) newPosition = _totalDuration;
    _audioPlayer.seek(newPosition);
  }

  void _onSliderChanged(double value) {
    final position = Duration(seconds: value.toInt());
    _audioPlayer.seek(position);
  }

  void updatePlaybackSpeed(double speed) {
    setState(() {
      _playbackSpeed = speed;
    });
    _audioPlayer.setPlaybackRate(speed);
  }

  void _selectEpisode(int index) {
    setState(() {
      _currentEpisodeIndex = index;
      _currentEpisode = widget.episodes[index]["title"]!;
      _currentAudioSource = widget.episodes[index]["source"]!;
      _isPlaying = false;
    });
    _togglePlayPause();
  }

  void _playNextEpisode() {
    if (_currentEpisodeIndex < widget.episodes.length - 1) {
      _selectEpisode(_currentEpisodeIndex + 1);
    }
  }

  void _playPreviousEpisode() {
    if (_currentEpisodeIndex > 0) {
      _selectEpisode(_currentEpisodeIndex - 1);
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double threshold = 100;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: CustomGestureDetector(
        axis: CustomGestureDetector.AXIS_Y,
        velocity: threshold,
        onSwipeUp: () {
          setState(() {
            showBottomMenu = true;
          });
        },
        onSwipeDown: () {
          setState(() {
            showBottomMenu = false;
          });
        },
        onSwipeLeft: () {},
        onSwipeRight: () {},
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.48,
                    child: Image.asset(
                      widget.audioBookImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.13,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                bottom: 10,
                              ),
                              child: Text(
                                widget.audioTitle,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showBottomMenu = !showBottomMenu;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.blackColor,
                                        width: 1.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(_currentEpisode),
                                  ),
                                ),
                                SpeedMenu(
                                  onSpeedSelected: updatePlaybackSpeed,
                                ), // Use SpeedMenu widget here
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 0),
                                trackShape: CustomTrackShape(),
                              ),
                              child: Slider(
                                value: _currentPosition.inSeconds.toDouble(),
                                min: 0,
                                max: _totalDuration.inSeconds.toDouble(),
                                activeColor: AppColors.accentColor,
                                onChanged: (value) {
                                  _onSliderChanged(value);
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  style: ButtonStyle(
                                    iconSize: WidgetStateProperty.all(40),
                                    shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                  color: AppColors.accentColor,
                                  iconSize: 40,
                                  icon: const Icon(Icons.skip_previous),
                                  onPressed: _playPreviousEpisode,
                                ),
                                IconButton(
                                  style: ButtonStyle(
                                    iconSize: WidgetStateProperty.all(33),
                                    shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                  color: AppColors.accentColor,
                                  iconSize: 33,
                                  icon: const Icon(Icons.replay_10),
                                  onPressed: _rewind10Seconds,
                                ),
                                IconButton(
                                  style: ButtonStyle(
                                    iconSize: WidgetStateProperty.all(40),
                                    backgroundColor:
                                        const WidgetStatePropertyAll(
                                            AppColors.accentColor),
                                    shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                  color: Colors.white,
                                  iconSize: 40,
                                  icon: Icon(_isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow),
                                  onPressed: _togglePlayPause,
                                ),
                                IconButton(
                                  style: ButtonStyle(
                                    iconSize: WidgetStateProperty.all(33),
                                    shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                  color: AppColors.accentColor,
                                  iconSize: 33,
                                  icon: const Icon(Icons.forward_10),
                                  onPressed: _fastForward10Seconds,
                                ),
                                IconButton(
                                  style: ButtonStyle(
                                    iconSize: WidgetStateProperty.all(40),
                                    shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                  color: AppColors.accentColor,
                                  iconSize: 40,
                                  icon: const Icon(Icons.skip_next),
                                  onPressed: _playNextEpisode,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: (showBottomMenu) ? 1.0 : 0.0,
            ),
            AnimatedPositioned(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 200),
              left: 0,
              bottom: (showBottomMenu) ? 0 : -(height / 3),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: height / 3 + 60,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2.0,
                        horizontal: 10.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 130.0),
                            child: Divider(
                              color: Colors.grey.shade400,
                              thickness: 2,
                            ),
                          ),
                          Text(
                            "Episodes (1-${widget.episodes.length})",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: widget.episodes.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                    title:
                                        Text(widget.episodes[index]["title"]!),
                                    trailing: const Icon(Icons.play_arrow),
                                    onTap: () {
                                      _selectEpisode(index);
                                      setState(() {
                                        showBottomMenu = false;
                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackWidth = parentBox.size.width;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

class SpeedMenu extends StatelessWidget {
  final void Function(double) onSpeedSelected;

  const SpeedMenu({
    super.key,
    required this.onSpeedSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPopover(
          context: context,
          bodyBuilder: (context) => Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSpeedOption(context, '0.5x'),
                buildSpeedOption(context, '1x'),
                buildSpeedOption(context, '1.5x'),
                buildSpeedOption(context, '2x'),
              ],
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Image.asset(
          'assets/icons/playback.png', // Replace with your actual path
          width: 30,
          height: 30,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget buildSpeedOption(BuildContext context, String speedText) {
    return GestureDetector(
      onTap: () {
        double speedValue = 1.0; // Default playback speed
        switch (speedText) {
          case '0.5x':
            speedValue = 0.5;
            break;
          case '1x':
            speedValue = 1.0;
            break;
          case '1.5x':
            speedValue = 1.5;
            break;
          case '2x':
            speedValue = 2.0;
            break;
          default:
            // speedValue = 1.0;
            break;
        }

        onSpeedSelected(speedValue); // Notify parent about selected speed
        Navigator.pop(context); // Close the popover after selection
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          speedText,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
