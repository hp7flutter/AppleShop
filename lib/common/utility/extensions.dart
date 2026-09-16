import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension PersianFormat on String {
  String toPersianFormat() {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    var output = this;
    for (int i = 0; i < english.length; i++) {
      output = output.replaceAll(english[i], persian[i]);
    }
    return output;
  }
}

extension PriceParsing on num {
  String converToPrice() {
    final formatter = NumberFormat('#,###,###', 'fa_IR');
    return formatter.format(this);
  }
}

void toFarsiDigits(String value, TextEditingController controller) {
  final persian = value.toString().toPersianFormat();
  controller.value = TextEditingValue(
    text: persian,
    selection: TextSelection.collapsed(offset: persian.length),
  );
}

extension SameDigits on String {
  bool isAllSameDigit() {
    if (isEmpty) return true;
    final firstChar = this[0];
    for (int i = 1; i < length; i++) {
      if (this[i] != firstChar) return false;
    }
    return true;
  }
}
