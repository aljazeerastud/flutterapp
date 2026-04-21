import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';


class OnSplashCubit extends Cubit<OnSplashState> {
  OnSplashCubit() : super(OnSplashStateInitial());

static OnSplashCubit get(context)=>BlocProvider.of(context);

  late Timer _timer;

  Future<void> initSplash(BuildContext context) async {
    _timer = Timer(const Duration(seconds: 5git add .), () {
      context.go('/onMainStartBoarding');

    });
  }



}



abstract class OnSplashState{}


class OnSplashStateInitial extends OnSplashState{}


class IntroViewedState extends OnSplashState{}

