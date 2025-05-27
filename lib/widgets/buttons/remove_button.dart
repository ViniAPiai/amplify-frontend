import 'package:flutter/material.dart';
import 'package:frontend/widgets/form/label.dart';

class RemoveButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final int index;

  const RemoveButton({super.key, this.onPressed, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        index == 0 ? Label(label: "", required: false,) : const SizedBox(),
        OutlinedButton(
                onPressed: onPressed ?? () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.grey.shade50)),
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                  fixedSize: Size(25, 25),
                ),
                child: Center(
                  child: Icon(
                    Icons.remove,
                    color: Colors.grey.shade700,
                    size: 24,
                  ),
                ),
              ),
      ],
    );
  }
}
