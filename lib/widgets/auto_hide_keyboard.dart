import 'package:flutter/material.dart';

class AutoHideKeyboard extends StatelessWidget {
  final Widget child;

  const AutoHideKeyboard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    void hideKeyboard() {
      final currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    return GestureDetector(
      onTap: hideKeyboard,
      // onTapDown: (_) => hideKeyboard(),
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}
