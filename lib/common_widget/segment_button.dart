import 'package:flutter/material.dart';
import 'package:tracker/common/color_extension.dart';

class SegmentButton extends StatefulWidget {
  const SegmentButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.isActive = false});
  final String title;
  final VoidCallback onPressed;
  final bool isActive;
  @override
  State<SegmentButton> createState() => _SegmentButtonState();
}

class _SegmentButtonState extends State<SegmentButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        decoration: widget.isActive
            ? BoxDecoration(
                border:
                    Border.all(color: TColor.gray10.withValues(alpha: 0.15)),
                color: widget.isActive
                    ? TColor.gray60.withValues(alpha: 0.5)
                    : TColor.gray60.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(15),
              )
            : null,
        alignment: Alignment.center,
        child: Text(widget.title,
            style: TextStyle(
                color: TColor.white,
                fontSize: 14,
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}
