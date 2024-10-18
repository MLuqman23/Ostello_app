import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

// Riverpod provider for the TextEditingController
final pinControllerProvider =
    StateNotifierProvider<PinControllerNotifier, TextEditingController>(
  (ref) => PinControllerNotifier(),
);

class PinControllerNotifier extends StateNotifier<TextEditingController> {
  PinControllerNotifier() : super(TextEditingController());

  void updatePin(String pin) {
    state.text = pin;
  }
}

final phoneNumberProvider =
    StateNotifierProvider<PhoneNumberNotifier, PhoneNumberState>(
  (ref) => PhoneNumberNotifier(),
);

class PhoneNumberNotifier extends StateNotifier<PhoneNumberState> {
  PhoneNumberNotifier() : super(PhoneNumberState());

  void updatePhoneNumber(PhoneNumber phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber.phoneNumber, isValid: true);
  }

  void validatePhoneNumber(bool isValid) {
    state = state.copyWith(isValid: isValid);
  }
}

class PhoneNumberState {
  final String phoneNumber;
  final bool isValid;

  PhoneNumberState({this.phoneNumber = '', this.isValid = false});

  PhoneNumberState copyWith({String? phoneNumber, bool? isValid}) {
    return PhoneNumberState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isValid: isValid ?? this.isValid,
    );
  }
}
