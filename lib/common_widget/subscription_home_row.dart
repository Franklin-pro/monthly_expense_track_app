import 'package:flutter/material.dart';
import 'package:tracker/common/color_extension.dart';

class SubscriptionHomeRow extends StatefulWidget {
  const SubscriptionHomeRow({
    super.key,
    required this.sObj,
    required this.onPressed,
  });
  final Map sObj;
  final VoidCallback onPressed;

  @override
  State<SubscriptionHomeRow> createState() => _SubscriptionHomeRowState();
}

class _SubscriptionHomeRowState extends State<SubscriptionHomeRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: widget.onPressed,
        child: Container(
          height: 64,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: TColor.gray10.withValues(alpha: 0.15)),
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Row(
              children: [
                Image.asset(widget.sObj["icon"], height: 40, width: 40),
                SizedBox(width: 8),
                Expanded(
                  child: Text(widget.sObj["name"],
                      style: TextStyle(
                          color: TColor.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(width: 8),
                Text("\$${widget.sObj["price"]}",
                    style: TextStyle(
                        color: TColor.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
