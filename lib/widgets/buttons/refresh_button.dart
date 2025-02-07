import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const RefreshButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed ?? () {},
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.grey.shade50)),
            backgroundColor: Colors.white,
            padding: EdgeInsets.zero,
            fixedSize: Size(25, 25)),
        child: Icon(
          Icons.refresh,
          color: Colors.grey.shade700,
          size: 24,
        ));
  }
}
