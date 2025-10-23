import 'package:flutter/material.dart';
import 'package:tracker/common/color_extension.dart';
import 'package:tracker/common_widget/custom_arc_painter.dart';
import 'package:tracker/common_widget/segment_button.dart';
import 'package:tracker/common_widget/status_button.dart';
import 'package:tracker/common_widget/subscription_home_row.dart';
import 'package:tracker/common_widget/upcoming_bill_row.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSubscription = true;
  List subArr = [
    {
      "name": "Spotify",
      "icon": "assets/images/spotify_logo.png",
      "price": "5.99",
    },
    {
      "name": "Netflix",
      "icon": "assets/images/netflix_logo.png",
      "price": "10.99",
    },
    {
      "name": "YouTube Premium",
      "icon": "assets/images/youtube_logo.png",
      "price": "18.99",
    },
    {
      "name": "Microsoft OneDrive",
      "icon": "assets/images/onedrive_logo.png",
      "price": "26.99",
    },
  ];

  List billArr = [
    {
      "name": "Spotify",
      "date": DateTime(2025, 10, 21),
      "price": "5.99",
    },
    {
      "name": "Netflix",
      "date": DateTime(2025, 10, 21),
      "price": "10.99",
    },
    {
      "name": "YouTube Premium",
      "date": DateTime(2025, 10, 21),
      "price": "18.99",
    },
    {
      "name": "Microsoft OneDrive",
      "date": DateTime(2025, 10, 21),
      "price": "26.99",
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
            Container(
              height: media.width * 1.1,
              // margin: const EdgeInsets.symmetric(horizontal: 20),
              // padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: TColor.gray70.withValues(alpha: 0.5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(height: media.width * 0.05),
                  Image.asset("assets/images/home_bg.png"),
                  Container(
                    padding: EdgeInsets.all(media.width * 0.01),
                    width: media.width * 0.65,
                    height: media.width * 0.65,
                    child: CustomPaint(
                      painter: CustomArcPainter(
                          start: 0, end: 100, width: 15, blurWidth: 6),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/app_logo.png",
                        width: media.width * 0.25,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: media.width * 0.05),
                      Text(
                        "\$1,250",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: media.width * 0.055),
                      Text(
                        "This Month Bills",
                        style: TextStyle(
                            color: TColor.gray40,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: media.width * 0.07),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: TColor.gray10.withValues(alpha: 0.15)),
                            color: TColor.gray60.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text("See You Budget",
                              style: TextStyle(
                                  color: TColor.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: StatusButton(
                                title: "Active Subs",
                                value: "12",
                                statusColor: TColor.secondary,
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: StatusButton(
                                title: "Highest Subs",
                                value: "\$19.99",
                                statusColor: TColor.primary10,
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: StatusButton(
                                title: "Lowest Subs",
                                value: "\$5.99",
                                statusColor: TColor.secondaryG,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              // padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: SegmentButton(
                          title: "Your Subscription",
                          isActive: isSubscription,
                          onPressed: () {
                            setState(() {
                              isSubscription = !isSubscription;
                            });
                          })),
                  Expanded(
                      child: SegmentButton(
                          title: "Upcoming bills",
                          isActive: !isSubscription,
                          onPressed: () {
                            setState(() {
                              isSubscription = !isSubscription;
                            });
                          })),
                ],
              ),
            ),
            if (isSubscription)
              ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: subArr.length,
                itemBuilder: (context, index) {
                  var obj = subArr[index] as Map? ?? {};
                  return SubscriptionHomeRow(
                    sObj: obj,
                    onPressed: () {},
                  );
                },
              ),
            if (!isSubscription)
              ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: billArr.length,
                itemBuilder: (context, index) {
                  var obj = billArr[index] as Map? ?? {};
                  return UpcomingBillRow(
                    sObj: obj,
                    onPressed: () {},
                  );
                },
              ),
            SizedBox(height: 110),
          ],
        ),
      ),
    );
  }
}
