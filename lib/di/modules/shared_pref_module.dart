
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class SharedPreferencesModule{
  @preResolve
  @singleton
  Future<SharedPreferences> getSharedPreferences() async => await SharedPreferences.getInstance();
}
