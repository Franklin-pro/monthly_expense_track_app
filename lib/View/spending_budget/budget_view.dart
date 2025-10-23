import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:tracker/common/color_extension.dart';
import 'package:tracker/common_widget/spending_budget_row.dart';
// import 'package:tracker/common_widget/upcoming_bill_row.dart';

class SpendingBudgetView extends StatefulWidget {
  const SpendingBudgetView({super.key});

  @override
  State<SpendingBudgetView> createState() => _SpendingBudgetViewState();
}

class _SpendingBudgetViewState extends State<SpendingBudgetView> {
  List budgetArr = [
    {
      "name": "Auto & transport",
      "icon": "assets/images/auto_&_transport.png",
      "spend_amount": "30.00",
      "total_budget": "400",
      "left_amount": "370.00",
      "color": TColor.secondary
    },
    {
      "name": "Security",
      "icon": "assets/images/security.png",
      "spend_amount": "100.00",
      "total_budget": "500",
      "left_amount": "400.00",
      "color": TColor.secondaryG
    },
    {
      "name": "Entertainment",
      "icon": "assets/images/entertainment.png",
      "spend_amount": "150.00",
      "total_budget": "500",
      "left_amount": "350.00",
      "color": TColor.secondary0
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray80,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {},
                child: Container(
                  height: 64,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: TColor.gray10.withValues(alpha: 0.1)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("your budget are on Track 👍",
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: budgetArr.length,
              itemBuilder: (context, index) {
                var bObj = budgetArr[index] as Map? ?? {};
                return SpendingBudgetRow(
                  sObj: bObj,
                  onPressed: () {},
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {},
                child: DottedBorder(
                  dashPattern: const [4, 3],
                  color: TColor.gray10.withValues(alpha: 0.1),
                  strokeWidth: 1,
                  radius: Radius.circular(16),
                  child: Container(
                    height: 64,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Add new Category",
                              style: TextStyle(
                                  color: TColor.gray30,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                          Image.asset("assets/images/add.png",
                              height: 20, width: 20, color: TColor.gray30)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 110),
          ],
        ),
      ),
    );
  }
}
