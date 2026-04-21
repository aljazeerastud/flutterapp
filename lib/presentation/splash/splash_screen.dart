import 'package:awa/core/constant/app_images.dart';
import 'package:awa/core/widgets/custom_loading.dart';
import 'package:awa/presentation/splash/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_)=>OnSplashCubit()..initSplash(context),
    child: BlocConsumer<OnSplashCubit,OnSplashState>(
      listener: (context,state){},
      builder: (context,state){
        final cubit = OnSplashCubit.get(context);

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(),
            Image.asset(AppImages.logo),
            // SvgPicture.asset(AppImages.horizontalLogo),
            const CustomLoading(),
          ],
        );
      },
    )
    );
  }
}
