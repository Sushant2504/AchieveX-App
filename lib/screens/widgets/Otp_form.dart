import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpForm extends StatelessWidget{
    @override
  Widget build(BuildContext context) {
     return Form(
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
               onChanged: (value) {
                  if(value.length == 1){
                    FocusScope.of(context).nextFocus();
                  }
               },
               onSaved: (pin1) {},
               style: Theme.of(context).textTheme.headlineMedium,
               keyboardType: TextInputType.number,
               textAlign: TextAlign.center,
               inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
               ],
            ),
          ),

          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
               onChanged: (value) {
                  if(value.length == 1){
                    FocusScope.of(context).nextFocus();
                  }
               },
               onSaved: (pin2) {},
               style: Theme.of(context).textTheme.headlineMedium,
               keyboardType: TextInputType.number,
               textAlign: TextAlign.center,
               inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
               ],
            ),
          ),

          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
               onChanged: (value) {
                  if(value.length == 1){
                    FocusScope.of(context).nextFocus();
                  }
               },
               onSaved: (pin3) {},
               style: Theme.of(context).textTheme.headlineMedium,
               keyboardType: TextInputType.number,
               textAlign: TextAlign.center,
               inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
               ],
            ),
          ),

          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
               onChanged: (value) {
                  if(value.length == 1){
                    FocusScope.of(context).nextFocus();
                  }
               },
               onSaved: (pin4) {},
               style: Theme.of(context).textTheme.headlineMedium,
               keyboardType: TextInputType.number,
               textAlign: TextAlign.center,
               inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
               ],
            ),
          ),
        ],
      ),
      );
  }
}