import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async => _appDependencies();

Future<void> _appDependencies() async {
  //serviceLocator.registerSingleton<SplashBloc>(SplashBloc());
}
