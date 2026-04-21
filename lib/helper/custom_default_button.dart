import 'package:flutter/material.dart';
import 'package:awa/component/color_manger.dart';
import 'package:awa/component/font_manager.dart';
import 'package:awa/component/styles_manager.dart';
class CustomDefaultButton extends StatelessWidget {
  final double width;
  final String text;
  final Function() ?onTap;
  const CustomDefaultButton({Key? key,required this.width, required this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        height: 45,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: ColorManager.lightPrimary.withOpacity(.5),
        ),
        child: Row(children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManager.lightPrimary
            ),
            child: Icon(Icons.lock,size: 20,color: ColorManager.white,),
          ),
          Expanded(child: Center(child: Text(text,
            textDirection: TextDirection.rtl,
            style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s15),),)),
          SizedBox(width: 6,),
        ],),
      ),
    );
  }
}
