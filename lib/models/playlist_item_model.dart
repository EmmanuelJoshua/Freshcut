import 'dart:ui';

class PlaylistItemModel {
  late String title;
  late String image;
  late int newVideos;
  late int totalVideos;
  late int watchedVideos;
  late double progress;
  late Color dominantColor;
  late bool isPlaylistCompleted;
  late bool isPlaylistStarted;
  PlaylistItemModel({
    required this.title,
    required this.image,
    required this.newVideos,
    required this.totalVideos,
    required this.watchedVideos,
    required this.progress,
    required this.dominantColor,
    isPlaylistCompleted,
    isPlaylistStarted,
  })  : isPlaylistCompleted = (watchedVideos == totalVideos),
        isPlaylistStarted = (watchedVideos == 0);
}
