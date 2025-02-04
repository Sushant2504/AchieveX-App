import 'package:achievex/provider/appdata_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  PrivacyPolicyScreen({super.key, required this.title});
  String title;
  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _loadData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _loadData() async {
    Provider.of<AppdataProvider>(context, listen: false).getAppData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title,style: const TextStyle(color: AppColors.whiteColor,fontSize: 17,fontWeight: FontWeight.w400),),
          backgroundColor: AppColors.accentColor,
        ),
        body: Consumer<AppdataProvider>(builder: (context, appdata, child) {
          return appdata.isLoading || appdata.appdataModel == null
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.whiteColor,
                ))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black,), borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.title == "Terms & Conditions" ? appdata.appdataModel?.termsCondition??'': widget.title == "About Us" ? appdata.appdataModel?.aboutUs??'': widget.title == "Contact Us" ? appdata.appdataModel?.contactUs ??''  : appdata.appdataModel?.privacyPolicy ??'' ),
                      )),
                  ));
        }));
  }
}
