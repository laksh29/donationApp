import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/dropdown_providers.dart';

class DropdownModel extends ConsumerWidget {
  const DropdownModel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(dropdownChangeProvider).selectedCat;
    return DropdownButton(
      hint: const Text("Choose any one!"),
      value: selected,
      items: <String>[
        "Item 1",
        "Item 2",
        "Item 3",
      ]
          .map((e) => DropdownMenuItem(
                onTap: () => e,
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: (val) {
        ref.read(dropdownChangeProvider).itemSelected("$val");
      },
    );
  }
}
