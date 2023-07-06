import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dropdownChangeProvider =
    ChangeNotifierProvider<DropdownSelectedProvider>((ref) {
  return DropdownSelectedProvider();
});

class DropdownSelectedProvider extends ChangeNotifier {
  String? selectedCat;

  itemSelected(String item) {
    if (item.isEmpty) {
      return selectedCat;
    }
    selectedCat = item;
    return notifyListeners();
  }
}
