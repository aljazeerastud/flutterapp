import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates>{
  OnBoardingCubit():super(AppInitOnBoardingState());
  static OnBoardingCubit get(context)=>BlocProvider.of(context);





}
abstract class OnBoardingStates{}
class AppInitOnBoardingState extends OnBoardingStates {}