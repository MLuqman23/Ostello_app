import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ostello/provider/provider.dart';

// ignore: use_key_in_widget_constructors
class PhoneNumberInputWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneNotifier = ref.read(phoneNumberProvider.notifier);

    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        phoneNotifier.updatePhoneNumber(number);
      },
      onInputValidated: (bool isValid) {
        phoneNotifier.validatePhoneNumber(isValid);
      },
      scrollPadding: EdgeInsets.zero,
      selectorConfig: const SelectorConfig(
        trailingSpace: false,
        selectorType: PhoneInputSelectorType.DROPDOWN,
        showFlags: false,
        setSelectorButtonAsPrefixIcon: true,
      ),
      initialValue: PhoneNumber(isoCode: 'US'),
      textFieldController: TextEditingController(),
      inputBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xffCFCFCF)),
      ),
      formatInput: true,
      hintText: 'Enter phone number',
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: false),
      onSaved: (PhoneNumber number) {
        phoneNotifier.updatePhoneNumber(number);
      },
    );
  }
}
