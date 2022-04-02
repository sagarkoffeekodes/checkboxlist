import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class Betterplaer_video extends StatefulWidget {
  const Betterplaer_video({Key key}) : super(key: key);

  @override
  State<Betterplaer_video> createState() => _Betterplaer_videoState();
}

class _Betterplaer_videoState extends State<Betterplaer_video> {



  BetterPlayerController _betterPlayerController;
  List dataSourceList = List<BetterPlayerDataSource>();

  initState() {
    super.initState();
    createDataSet();
  }

  List<BetterPlayerDataSource> createDataSet() {

    dataSourceList.add(
      BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",

      ),
    );
    dataSourceList.add(
      BetterPlayerDataSource(BetterPlayerDataSourceType.network,
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
    );
    dataSourceList.add(
      BetterPlayerDataSource(BetterPlayerDataSourceType.network,

          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
        useAsmsSubtitles: true,
        subtitles: BetterPlayerSubtitlesSource.single(


            type: BetterPlayerSubtitlesSourceType.network,
            url:
            "https://dl.dropboxusercontent.com/s/71nzjo2ux3evxqk/example_subtitles.srt"),),



    );
    dataSourceList.add(
      BetterPlayerDataSource(BetterPlayerDataSourceType.network,
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
    );

  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: BetterPlayerPlaylist(
          betterPlayerConfiguration: BetterPlayerConfiguration(
          ),
          betterPlayerPlaylistConfiguration:  BetterPlayerPlaylistConfiguration(
            loopVideos: true,

          ),
          betterPlayerDataSourceList: dataSourceList),
    );
  }
}