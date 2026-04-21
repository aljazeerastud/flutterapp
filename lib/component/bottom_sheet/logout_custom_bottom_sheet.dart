import 'package:awa/component/color_manger.dart';
import 'package:awa/component/component.dart';
import 'package:awa/component/dimensions.dart';
import 'package:awa/component/image_assets.dart';
import 'package:awa/component/styles_manager.dart';
import 'package:flutter/material.dart';

class LogoutCustomBottomSheet extends StatelessWidget {
  const LogoutCustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.only(bottom: 40, top: 15),
      decoration: BoxDecoration(color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(Dimensions.paddingSizeDefault))),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(width: 40,height: 4,decoration: BoxDecoration(
            color: Theme.of(context).hintColor.withOpacity(.5), borderRadius: BorderRadius.circular(20)),),
        const SizedBox(height: 30,),

        Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
          child: SizedBox(width: 60,child: Image.asset(ImageAssets.exitIcon)),),
        const SizedBox(height: Dimensions.paddingSizeExtraSmall,),

        Text('تسجيل الخروج', style: getBoldStyle(color: ColorManager.black,fontSize:  Dimensions.fontSizeLarge),),

        Padding(padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall, bottom: Dimensions.paddingSizeLarge),
          child: Text('هل أنت متأكد أنك تريد تسجيل الخروج؟'),),

        const SizedBox(height: Dimensions.paddingSizeDefault),
        // Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeOverLarge),
        //   child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
        //     Expanded(child: SizedBox(width: 120,child: CustomButton(buttonText: 'إلغاء',
        //       backgroundColor: Theme.of(context).colorScheme.tertiaryContainer.withOpacity(.5),
        //       textColor: Theme.of(context).textTheme.bodyLarge?.color,
        //       onTap: ()=> Navigator.pop(context),))),
        //
        //     const SizedBox(width: Dimensions.paddingSizeDefault,),
        //     Expanded(child: SizedBox(width: 120,child: CustomButton(buttonText: 'تسجيل الخروج',
        //         backgroundColor: ColorManager.backgroundColor,
        //         textColor: ColorManager.white,
        //         onTap: (){
        //           // CacheHelper.removeData(key: "tokenUser").then((value){
        //           //   Navigator.pop(context);
        //           //   navigateAndFinish(context, BottomNavigationScreen());
        //           // });
        //           // Provider.of<AuthProvider>(context, listen: false).logOut().then((condition) {
        //           //   Navigator.pop(context);
        //           //   Provider.of<AuthProvider>(context,listen: false).clearSharedData();
        //           //   Provider.of<ProfileProvider>(context, listen: false).initAddressList();
        //           //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const AuthScreen()), (route) => false);
        //           // });
        //         })),
        //     )
        //   ],),
        // )

      ],),
    );
  }
}
