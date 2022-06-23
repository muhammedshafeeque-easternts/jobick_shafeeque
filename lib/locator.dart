import 'package:get_it/get_it.dart';
import 'package:jobick_shafeeque/core/repositories/dashboard_repository.dart';
import 'package:jobick_shafeeque/core/viewmodels/dashboard_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/http.dart';
import 'core/repositories/add_new_job_repository.dart';
import 'core/res/db.dart';
import 'core/viewmodels/add_new_job_model.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {

  sl.registerFactory(() => DashBoardViewModel(db: sl(), repository: sl()));
  sl.registerLazySingleton(() => DashBoardRepository(db: sl(), client: sl()));

  sl.registerFactory(() => AddNewJobViewModel(db: sl(), repository: sl()));
  sl.registerLazySingleton(() => AddNewJobRepository(db: sl(), client: sl()));

  sl.registerLazySingleton(() => Db());
  sl.registerLazySingleton(() => Http());
  final pref = await SharedPreferences.getInstance();
  sl.registerSingletonAsync(() async => pref);
}
