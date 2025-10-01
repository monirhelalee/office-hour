import 'package:office_hour/app/app.dart';
import 'package:office_hour/app/core/env.dart';
import 'package:office_hour/bootstrap.dart';

Future<void> main() async {
  await bootstrap(ProductionEnv(), () => const App());
}
