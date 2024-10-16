import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<String> filterOptions = ['Filter', 'All', 'Completed', 'Pending'];

final selectedFilterProvider = StateProvider<String>((ref) => filterOptions[0]);
final currentIndexProvider = StateProvider<int>((ref) => 0);
final currentPageProvider = StateProvider<int>((ref) => 0);
final isInitializedProvider = StateProvider<bool>((ref) => false);

enum CourseType { free, paid }

class CourseSelectionNotifier extends StateNotifier<CourseType> {
  CourseSelectionNotifier() : super(CourseType.free);

  void selectCourse(CourseType courseType) {
    state = courseType;
  }
}

class SelectedIndexNotifier extends StateNotifier<int?> {
  SelectedIndexNotifier() : super(null);

  void selectIndex(int index) {
    state = index;
  }
}

final selectedIndexProvider =
    StateNotifierProvider<SelectedIndexNotifier, int?>((ref) {
  return SelectedIndexNotifier();
});

final courseSelectionProvider =
    StateNotifierProvider<CourseSelectionNotifier, CourseType>(
  (ref) => CourseSelectionNotifier(),
);
