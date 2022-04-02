// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoPlayerPlugin extends StatefulWidget {
//   const VideoPlayerPlugin({Key key}) : super(key: key);
//
//   @override
//   _VideoPlayerPluginState createState() => _VideoPlayerPluginState();
// }
//
// class _VideoPlayerPluginState extends State<VideoPlayerPlugin> {
//   VideoPlayerController _controller;
//   @override
//   void initState() {
//     super.initState();
//   //  _controller=VideoPlayerController.file(file),
//
//
//     _controller = VideoPlayerController.network(
//         'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _controller.value.isInitialized
//             ? AspectRatio(
//           aspectRatio: _controller.value.aspectRatio,
//           child: VideoPlayer(_controller),
//         )
//             : Container(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _controller.value.isPlaying
//                 ? _controller.pause()
//                 : _controller.play();
//           });
//         },
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//
//   }
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }