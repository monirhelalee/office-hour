import 'package:get_it/get_it.dart';
import 'package:office_hour/app/core/env.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
final pocketBase = sl.get<PocketBase>();

Future<void> initServices() async {
  await sl.reset();
  final prefs = await SharedPreferences.getInstance();
  sl.registerSingleton(
    PocketBase(
      Env.value.pocketBaseURL,
      authStore: AsyncAuthStore(
        initial: prefs.getString('pocketbase_auth'),
        save: (data) async => prefs.setString('pocketbase_auth', data),
      ),
    ),
  );
  await sl.allReady();
}
