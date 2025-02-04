import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:achievex/screens/quotes_data.dart';

class MotivationalCard extends StatefulWidget {
  const MotivationalCard({super.key});

  @override
  _MotivationalCardState createState() => _MotivationalCardState();
}

class _MotivationalCardState extends State<MotivationalCard> {
  @override
  Widget build(BuildContext context) {
       return Scaffold(
          
          body: Swiper(
          itemBuilder: (context, index) {
            return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Image.asset('assets/images/stars.png'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 35.0,),

                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Center(
                        child: Text(
                          quotes[index],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Times New Roman",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 35.0,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Image.asset('assets/images/stars.png'),
                        ),
                      ],
                    ),


                  ],
                ),
            
            );
          
          },
          autoplay: true,
          itemCount: quotes.length,
          scrollDirection: Axis.vertical,
          pagination: const SwiperPagination(alignment: Alignment.centerRight),
          control: const SwiperControl(),
          layout: SwiperLayout.TINDER,
        )
        
       );
  }

  
}
