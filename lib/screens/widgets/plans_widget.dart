import 'package:flutter/cupertino.dart';

Widget basicPlan() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 18.0, left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/u_access.png',
              height: 50,
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Ultimate Access'),
                SizedBox(
                    height: 50,
                    child: Text(
                      'Access of all features.',
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                    ))
              ],
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/noad.png',
              height: 50,
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No Ads'),
                SizedBox(
                    height: 50,
                    child: Text(
                      'AD free access of Application.           ',
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                    ))
              ],
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 0.0, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/notavailable.png',
              height: 50,
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No Neurospectrum, Neuropractice.'),
              ],
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 18.0, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/notavailable.png',
              height: 50,
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No Courses, Ebooks and Audiobooks'),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget standardPlan() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/u_access.png',
              height: 50,
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Ultimate Access'),
                SizedBox(
                    height: 50,
                    child: Text(
                      'Access of all features',
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                    )),
              ],
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/noad.png',
              height: 50,
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No Ads'),
                SizedBox(
                    height: 50,
                    child: Text(
                      'AD free access of Application',
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                    ))
              ],
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/c_more.png',
              height: 50,
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Course & more'),
                Text(
                  'Access of 50 percent Courses,',
                  overflow: TextOverflow.fade,
                ),
                Text(
                  'Ebooks and Audiobooks.',
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                ),
              ],
            ),
          ],
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.only(top: 10.0, left: 10),
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       Image.asset(
      //         'assets/images/chip.png',
      //         height: 50,
      //       ),
      //       const SizedBox(
      //         width: 20,
      //       ),
      //       const Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         children: [
      //           Text('Eva Ai'),
      //           SizedBox(
      //               height: 50,
      //               child: Text(
      //                 'Get Eva AI for 1 month free.',
      //                 overflow: TextOverflow.fade,
      //                 maxLines: 2,
      //               ))
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    ],
  );
}

Widget premiumPlan() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/u_access.png',
              height: 50,
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Ultimate Access'),
                SizedBox(
                    height: 50,
                    child: Text(
                      'Access of all features ',
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                    )),
              ],
            )
          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/noad.png',
              height: 50,
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No Ads'),
                SizedBox(
                    height: 50,
                    child: Text(
                      'AD free access of Application.           ',
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                    ))
              ],
            ),
          ],
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.only(top: 10.0, left: 10),
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       Image.asset(
      //         'assets/images/chip.png',
      //         height: 50,
      //       ),
      //       const SizedBox(
      //         width: 20,
      //       ),
      //       const Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         children: [
      //           Text('Eva Ai'),
      //           SizedBox(
      //               height: 50,
      //               child: Text(
      //                 'Get Eva AI for 1 month free.',
      //                 overflow: TextOverflow.fade,
      //                 maxLines: 2,
      //               ))
      //         ],
      //       )
      //     ],
      //   ),
      // ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/c_more.png',
              height: 50,
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Course & more'),
                Text(
                  'Access of All Courses, Ebooks',
                  overflow: TextOverflow.fade,
                ),
                Text(
                  'and Audiobooks.',
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget ultraPremiumPlan() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/noad.png',
              height: 50,
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No Ads'),
                SizedBox(
                    height: 50,
                    child: Text(
                      'AD free access of Application.           ',
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                    ))
              ],
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/u_access.png',
              height: 50,
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Ultimate Access'),
                SizedBox(
                    height: 50,
                    child: Text(
                      'Access of all features ',
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                    )),
              ],
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/chip.png',
              height: 50,
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Eva Ai'),
                SizedBox(
                    height: 50,
                    child: Text(
                      'Access of Eva AI',
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                    ))
              ],
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/c_more.png',
              height: 50,
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Course & more'),
                SizedBox(
                    height: 50,
                    child: Text(
                      'Access of All courses',
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                    ))
              ],
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/free.png',
              height: 50,
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Additional'),
                SizedBox(
                    height: 50,
                    child: Text(
                      'Get additional 2 months free\naccess of all this features.',
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                    ))
              ],
            )
          ],
        ),
      ),
    ],
  );
}
