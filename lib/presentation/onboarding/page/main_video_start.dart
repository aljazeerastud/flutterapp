import 'package:awa/component/values_manager.dart';
import 'package:awa/core/constant/app_colors.dart';
import 'package:awa/helper/custom_default_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:go_router/go_router.dart';

import 'package:video_player/video_player.dart';


class MainVideoStartScreen extends StatefulWidget {
  const MainVideoStartScreen({super.key});

  @override
  State<MainVideoStartScreen> createState() => _MainVideoStartScreenState();
}

class _MainVideoStartScreenState extends State<MainVideoStartScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the video controller with a video asset or network video
    _controller = VideoPlayerController.networkUrl(
        Uri.parse("https://spiconx.sa/spiconx/assets/img/video.mp4"))
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(false);
        _controller.setVolume(0);
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // hideAppbar: true,
      body: Stack(
        children: [
          _controller.value.isInitialized
              ? SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          )
              : const Center(child: CircularProgressIndicator()),
          Container(
              color: AppColors.primaryColor.withOpacity(0.7)
          ),
          Positioned(
            bottom: 20,
            right: AppSize.s8,
            left: AppSize.s8,
            child: Column(
              children: [
                // Text(
                //   "title_onBoarding".tr(),
                //   style: AppStyles.bigTitleStyle.copyWith(color: Colors.white),
                //   textAlign: TextAlign.center,
                // ),
                // SizedBox(
                //   height: 5.h,
                // ),
                // Text(
                //   "معًا نحو مستقبل آمن ومستدام: تعزيز القيادة والابتكار في مجال السلامة من الحرائق ضمن رؤية المملكة 2030.",
                //   style: AppStyles.bigTitleStyle.copyWith(color: Colors.white),
                //   textAlign: TextAlign.center,
                // ),
                SizedBox(
                  height: 15,
                ),
                CustomDefaultButton(width: MediaQuery.sizeOf(context).width*.8, 
                    text:  "skip".tr(),
                    onTap: () {
                      context.go('/onBoarding');
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
