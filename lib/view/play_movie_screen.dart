import 'dart:developer';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

var src =
    'https://dl5.freeserver.top/www2/film/animation2/The.Croods.2013.1080p.BluRay.SoftSub.DigiMoviez.mkv';

class SubtitlesPage extends StatefulWidget {
  @override
  _SubtitlesPageState createState() => _SubtitlesPageState();
}

final videoPlayerController = VideoPlayerController.network(src);

class _SubtitlesPageState extends State<SubtitlesPage> {
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        const BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      fullScreenByDefault: true,
      autoPlay: true,
      subtitlesConfiguration: BetterPlayerSubtitlesConfiguration(
        backgroundColor: Colors.green,
        fontColor: Colors.white,
        outlineColor: Colors.black,
        fontSize: 20,
      ),
    );

    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.addEventsListener((event) {
      if (event.betterPlayerEventType == BetterPlayerEventType.progress) {
        log("Current subtitle line: ${_betterPlayerController.renderedSubtitle}");
      }
    });
    _setupDataSource();
    super.initState();
  }

  void _setupDataSource() async {
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      src,
      subtitles: BetterPlayerSubtitlesSource.single(
        type: BetterPlayerSubtitlesSourceType.file,
        url: src,
        name: "My subtitles",
        selectedByDefault: true,
      ),
    );
    _betterPlayerController.setupDataSource(dataSource);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 8),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer.network(src),
          )
        ],
      ),
    );
  }
}
