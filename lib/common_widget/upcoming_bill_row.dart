import 'package:flutter/material.dart';
import 'package:tracker/common/color_extension.dart';

class UpcomingBillRow extends StatefulWidget {
  const UpcomingBillRow({
    super.key,
    required this.sObj,
    required this.onPressed,
  });
  final Map sObj;
  final VoidCallback onPressed;

  @override
  State<UpcomingBillRow> createState() => _UpcomingBillRowState();
}

class _UpcomingBillRowState extends State<UpcomingBillRow> {
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
            padding: const EdgeInsets.all(0),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: TColor.gray70.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text("jun",
                          style: TextStyle(
                              color: TColor.gray30,
                              fontSize: 10,
                              fontWeight: FontWeight.w500)),
                      Text("21",
                          style: TextStyle(
                              color: TColor.gray30,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
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
