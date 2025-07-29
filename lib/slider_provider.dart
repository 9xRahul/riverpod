import 'package:flutter_riverpod/flutter_riverpod.dart';

final slider = StateProvider<double>((ref) {
  return .2;
});

class AppState {
  final double slider;
  final bool showPassword;

  AppState({required this.slider, required this.showPassword});

  AppState copyWith({double? slider, bool? showPassword}) {
    return AppState(
        slider: slider ?? this.slider,
        showPassword: showPassword ?? this.showPassword);
  }
}
