import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<String> filterOptions = ['Filter', 'All', 'Completed', 'Pending'];

final selectedFilterProvider = StateProvider<String>((ref) => filterOptions[0]);
final currentIndexProvider = StateProvider<int>((ref) => 0);
final currentPageProvider = StateProvider<int>((ref) => 0);
final isInitializedProvider = StateProvider<bool>((ref) => false);
