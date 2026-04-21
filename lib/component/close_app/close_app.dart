import 'dart:io';

import 'package:awa/component/color_manger.dart';
import 'package:awa/component/component.dart';
import 'package:awa/component/image_assets.dart';
import 'package:flutter/material.dart';
class CheckCloseApp{

  static void CloseApp(BuildContext context){
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 260,

          decoration: BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.circular(25)
          ),
          child: Center(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(ImageAssets.hiddenSubLogo,),fit: BoxFit.fill)
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage(ImageAssets.subLogo))
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'هل تريد الخروج ؟',
                      style: TextStyle(fontSize: 20,color: ColorManager.black,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      '( اوي )',
                      style: TextStyle(fontSize: 16,color: ColorManager.blue),
                    ),
                    SizedBox(height: 30,),
                
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     defaultButton(width: 100, text: "خروج", onTap:(){
                    //       exit(0);
                    //
                    //     } ),
                    //     defaultButton(width: 100, text: "رجوع", onTap:(){
                    //       Navigator.of(context).pop();
                    //
                    //     } ),
                    //   ],)
                
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

  }

}