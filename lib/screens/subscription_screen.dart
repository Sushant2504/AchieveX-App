import 'package:achievex/provider/coupon_provider.dart';
import 'package:achievex/provider/subscription_provider.dart';
import 'package:achievex/screens/widgets/plans_widget.dart';
import 'package:achievex/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  CouponProvider? couponProvider;
  int? referCount = 0;
  bool isCouponWidgetVisible = true;
  @override
  void initState() {
    super.initState();
    Provider.of<SubscriptionProvider>(context, listen: false).initPhonePeSdk();
    couponProvider = Provider.of<CouponProvider>(context, listen: false);
    Provider.of<SubscriptionProvider>(context, listen: false)
        .checkTotalRefferalsFriends();
    referCount =
        Provider.of<SubscriptionProvider>(context, listen: false).referCount;

    if (referCount != null && referCount! > 3) {
      planPriceA = planPriceA - 200;
      planPriceB = planPriceB - 200;
      isCouponWidgetVisible = false;
    }
  }

  int planIndex = 0;
  double planPrice = 799;
  int planPriceA = 799;
  int planPriceB = 599;
  bool hideButton = false;
  TextEditingController couponController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<SubscriptionProvider>(
      builder: (context, subsciptionProvider, child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => {Navigator.pop(context)},
                child: const Padding(
                  padding: EdgeInsets.only(top: 45.0, left: 10),
                  child: Icon(Icons.arrow_back),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 0.0, left: 10),
                child: Text(
                  'Subscription',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      // fontFamily: 'Prompt',
                      fontSize: 34,
                      color: AppColors.blackColor),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 0.0, left: 10),
                child: Text(
                  'Benefits includes:',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      // fontFamily: 'Prompt',
                      fontSize: 13,
                      color: AppColors.accentColor),
                ),
              ),
              (planIndex == 0)
                  ? basicPlan()
                  : (planIndex == 1)
                      ? standardPlan()
                      : premiumPlan(),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: (planIndex == 0)
                          ? const Color(0xff869BFF)
                          : AppColors.formBgColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 2, // Spread radius
                          blurRadius: 2, // Blur radius
                          offset: const Offset(0, 1), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () => {
                        planIndex = 0,
                        setState(() {
                          planIndex = 0;
                        }),
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/badge.png',
                              height: 19,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              '89/ -',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text('Monthly'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: (planIndex == 1)
                          ? const Color(0xff869BFF)
                          : AppColors.formBgColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 2, // Spread radius
                          blurRadius: 2, // Blur radius
                          offset: const Offset(0, 1), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () => {
                        planIndex = 1,
                        setState(() {
                          planIndex = 1;
                        }),
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/badge.png',
                              height: 19,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              '249/ -',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text('6 Months'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: (planIndex == 2)
                          ? const Color(0xff869BFF)
                          : AppColors.formBgColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 2, // Spread radius
                          blurRadius: 2, // Blur radius
                          offset: const Offset(0, 1), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () => {
                        planIndex = 2,
                        // subsciptionProvider.getPackageSignatureForAndroid(),
                        // subsciptionProvider.startSubscribe(599, 365, context),
                        setState(() {
                          planIndex = 2;
                        }),
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/badge.png',
                              height: 19,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "$planPriceB /-",
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text('1 Year'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              (referCount != null && referCount! >= 4)
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'You have invited around 4 friends you have 200 Rs discount on yearly plans',
                        textAlign: TextAlign.center,
                      ),
                    )
                  : const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'You have invited 0 friends.',
                        textAlign: TextAlign.center,
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
              if (isCouponWidgetVisible)
                if (planIndex == 2 || planIndex == 3)
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text('Apply coupon code'),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: TextField(
                              controller: couponController,
                              textCapitalization: TextCapitalization.characters,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          Positioned(
                            right: 28.0,
                            child: (!hideButton)
                                ? ElevatedButton(
                                    onPressed: () {
                                      // if (couponController.text.toString() != '' && referCount != null && referCount! < 4) {

                                      // if (couponController.text.toString() !=
                                      //         '' &&
                                      //     referCount! < 4) {
                                      Provider.of<CouponProvider>(context,
                                              listen: false)
                                          .applyCoupon(
                                              couponController.text.toString(),
                                              planPrice)
                                          .then((value) => {
                                                print('value-> $value'),
                                                setState(() {
                                                  if (value! > 1) {
                                                    hideButton = true;

                                                    if (planIndex == 2) {
                                                      planPriceB = planPriceB -
                                                          value.toInt();
                                                    } else {
                                                      planPriceA = planPriceA -
                                                          value.toInt();
                                                    }
                                                  }
                                                }),
                                              });
                                      // Provider.of<CouponProvider>(context,
                                      //         listen: false)
                                      //     .isCouponCodeApplied(true);

                                      //     planPriceA = (planPrice -
                                      // couponProvider!.discount!.toDouble());
                                      // }

                                      // } else {
                                      //   Fluttertoast.showToast(
                                      //       msg: "Enter Valid code");
                                      // }
                                    },
                                    child: const Text('Apply'),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ],
                  ),
              const SizedBox(
                height: 10,
              ),
              const Center(child: Text('Please select your plan')),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 52.0, right: 52),
                child: InkWell(
                  onTap: () => {
                    (planIndex == 0)
                        ? subsciptionProvider.startSubscribe(
                            planIndex, 89, 30, context, '')
                        : (planIndex == 1)
                            ? subsciptionProvider.startSubscribe(
                                planIndex, 249, 180, context, '')
                            : (planIndex == 2)
                                ? subsciptionProvider.startSubscribe(
                                    planIndex,
                                    int.parse(planPriceB.toString()),
                                    365,
                                    context,
                                    couponController.text.toString())
                                : subsciptionProvider.startSubscribe(
                                    planIndex,
                                    int.parse(planPriceA.toString()),
                                    485,
                                    context,
                                    couponController.text.toString()),
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.accentColor,
                        border:
                            Border.all(color: AppColors.accentColor, width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Get Started",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.whitebackgroundColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  'Lets go with your pocket friendly subscription and make your every activity on “Achieve X” interruption free get the access to courses',
                  textAlign: TextAlign.center,
                )),
              ),
            ],
          ),
        );
      },
    ));
  }
}
