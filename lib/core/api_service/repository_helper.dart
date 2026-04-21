import 'package:dartz/dartz.dart';
import 'package:awa/core/api_service/exceptions.dart';
import 'package:awa/core/api_service/failures.dart';
// import 'package:awa/core/utils/app_navigator.dart';
import 'package:awa/injection_container.dart';
// import 'package:awa/modules/auth/presentation/screens/login_screen.dart';

mixin RepositoryHelper {
  Future<Either<Failure, T>> handleEither<T>(Future<T> Function() call,) async {
    try {
      final result = await call();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, errors: e.response?.data as Map<String, dynamic>?,));
    } on NetworkException catch (_) {
      return const Left(NetworkFailure(message: 'No internet connection'));
    } on UnauthorizedException catch (_) {
      // sl<AppNavigator>().pushAndRemoveUntil(screen: const LoginScreen());
      return const Left(ServerFailure(message: 'your session is expired',));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}