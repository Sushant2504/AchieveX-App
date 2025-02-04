import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BrainTrainingCertificatePage extends StatelessWidget {
  BrainTrainingCertificatePage({
    super.key,
  });

  final List<String> certificates = [
    "assets/images/certificate1.jpeg",
    "assets/images/certificate2.jpeg",
    "assets/images/certificate3.jpeg",
    "assets/images/certificate4.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.16,
              width: width,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "About Brain Training Sessions",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.02,
              ),
              child: const Text(
                '''Discover our Brain Training Sessions, a cutting-edge solution for boosting cognitive abilities, meticulously verified and certified by leading experts in neurosciences. Our programs are designed to enhance vital cognitive skills such as Memory, Attention, Visuospatial, Reasoning, Executive Functioning, problem-solving, and mental flexibility. Through targeted exercises and activities, participants experience tangible improvements in brain function. With the endorsement of top neurological experts, our sessions provide a reliable and effective method for cognitive enhancement. Elevate your mental performance and achieve your full potential with our trusted, medically certified Brain Training Sessions.''',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.02,
              ),
              child: const Text(
                'Certificates',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            CarouselSlider(
              items: certificates.map((item) => Image.asset(item)).toList(),
              options: CarouselOptions(
                height: 400,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.04,
                right: width * 0.04,
                top: height * 0.01,
              ),
              child: const Text(
                'Special Thanks',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.01,
              ),
              child: const Text(
                '''Our profound gratitude to the scientific advisory board and neuroscientific research collaborators for their invaluable contributions and endorsement of our Brain Training Sessions. Their expertise ensures the highest standards in cognitive enhancement and brain health.''',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
