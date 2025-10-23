import 'package:flutter/material.dart';
import 'package:tracker/common/color_extension.dart';

class SpendingBudgetRow extends StatefulWidget {
  const SpendingBudgetRow({
    super.key,
    required this.sObj,
    required this.onPressed,
  });
  final Map sObj;
  final VoidCallback onPressed;

  @override
  State<SpendingBudgetRow> createState() => _SpendingBudgetRowState();
}

class _SpendingBudgetRowState extends State<SpendingBudgetRow> {
  @override
  Widget build(BuildContext context) {
    var proVal = (double.tryParse(widget.sObj["spend_amount"]) ?? 0) /
        (double.tryParse(widget.sObj["total_budget"]) ?? 0);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: widget.onPressed,
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            border: Border.all(color: TColor.gray60.withValues(alpha: 0.3)),
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        widget.sObj["icon"],
                        height: 30,
                        width: 30,
                        color: TColor.gray40,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.sObj["name"],
                              style: TextStyle(
                                  color: TColor.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                          Text("\$${widget.sObj["left_amount"]}",
                              style: TextStyle(
                                  color: TColor.gray30,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("of \$${widget.sObj["spend_amount"]}",
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                        Text("of \$${widget.sObj["total_budget"]}",
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: proVal,
                  valueColor: AlwaysStoppedAnimation(widget.sObj["color"]),
                  minHeight: 3,
                  backgroundColor: TColor.gray60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
