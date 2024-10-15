import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<String> filterOptions = ['Filter', 'All', 'Completed', 'Pending'];

final selectedFilterProvider = StateProvider<String>((ref) => filterOptions[0]);
final currentIndexProvider = StateProvider<int>((ref) => 0);
final currentPageProvider = StateProvider<int>((ref) => 0);
final isInitializedProvider = StateProvider<bool>((ref) => false);

final focusNodeProvider = Provider<FocusNode>((ref) {
  final focusNode = FocusNode();
  ref.onDispose(() {
    focusNode.dispose();
  });
  return focusNode;
});

enum CourseType { free, paid }

class CourseSelectionNotifier extends StateNotifier<CourseType> {
  CourseSelectionNotifier() : super(CourseType.free);

  void selectCourse(CourseType courseType) {
    state = courseType;
  }
}

final courseSelectionProvider =
    StateNotifierProvider<CourseSelectionNotifier, CourseType>(
  (ref) => CourseSelectionNotifier(),
);
