import 'package:jobick_shafeeque/core/http.dart';
import 'package:jobick_shafeeque/core/moor_database/moor_database.dart';

class  DashBoardRepository {
  DashBoardRepository({required this.db ,required this.client});

  final Http client;
  final AppDatabase db;

/*
  Future<HomeTopResponse> sentRequestGetHomeTopData() async {
    return homeTopResponseFromJson(
        await client.getRequest("${baseUrl}top.json"));
  }

*/

}