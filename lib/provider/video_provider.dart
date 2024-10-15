import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/Model/video_model.dart';

class VideoListNotifier extends StateNotifier<List<Video>> {
  VideoListNotifier()
      : super([
          Video(
              url:
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
          Video(
              url:
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
          Video(
              url:
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
        ]);

  void toggleLike(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          Video(url: state[i].url, isLiked: !state[i].isLiked)
        else
          state[i]
    ];
  }
}

final videoListProvider =
    StateNotifierProvider<VideoListNotifier, List<Video>>((ref) {
  return VideoListNotifier();
});
