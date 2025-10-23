import 'package:flutter/material.dart';
import 'package:tracker/common/color_extension.dart';

class StatusButton extends StatefulWidget {
  const StatusButton({
    super.key,
    required this.title,
    required this.value,
    required this.statusColor,
    required this.onPressed,
  });
  final String title;
  final String value;
  final Color statusColor;
  final VoidCallback onPressed;
  @override
  State<StatusButton> createState() => _StatusButtonState();
}

class _StatusButtonState extends State<StatusButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 68,
            decoration: BoxDecoration(
              border: Border.all(color: TColor.gray10.withValues(alpha: 0.15)),
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.title,
                    style: TextStyle(
                        color: TColor.gray40,
                        fontSize: 12,
                        fontWeight: FontWeight.w600)),
                Text(widget.value,
                    style: TextStyle(
                        color: TColor.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 2,
            color: widget.statusColor,
          ),
        ],
      ),
    );
  }
}
