import 'package:achievex/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class WriteYourPost extends StatefulWidget {
  const WriteYourPost({super.key});

  @override
  State<WriteYourPost> createState() => _WriteYourPostState();
}

class _WriteYourPostState extends State<WriteYourPost> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return 
     Consumer<HomeProvider>(builder: (context, homedata, child) {
      if(homedata.defaultQuote != null){
        controller.text = homedata.defaultQuote.toString();
      }else{
        controller.text = "Enter your quote";
      }
     return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.accentColor,
          iconTheme: const IconThemeData(color: AppColors.whiteColor),
          title:  const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
               
                "Write Your Quote",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.whitebackgroundColor, fontSize: 19),
              ),
            ],
          ),
          automaticallyImplyLeading: true),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(14),
          height: 300,
          decoration:  const BoxDecoration(
              color: AppColors.accentColor,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child:  TextField(

            
            
            controller: controller,
            minLines: 10,
            maxLines: 12,
            
            style: const TextStyle(color: AppColors.whiteColor),
          ),
        ),
        InkWell(
          onTap: () => {
            // if(controller.text.toString().isNotEmpty){
            homedata.saveQuote(controller.text.toString().trim()),
               Navigator.pop(context)

            // }else{
            //   Utils.showToast('Please enter your quote.')
            // }
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  border: Border.all(color: AppColors.accentColor, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Post",
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
      ]),
    );
     
  });}
}
