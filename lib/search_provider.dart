import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState(isChanged: false, search: ""));

  void search({required String query}) {
    state = state.copyWith(search: query);
  }

  void isChanged({required bool isChanged}) {
    state = state.copyWith(isChanged: isChanged);
  }
}

class SearchState {
  final String search;
  final bool isChanged;

  SearchState({required this.isChanged, required this.search});

  SearchState copyWith({String? search, bool? isChanged}) {
    return SearchState(
        isChanged: isChanged ?? this.isChanged, search: search ?? this.search);
  }
}
