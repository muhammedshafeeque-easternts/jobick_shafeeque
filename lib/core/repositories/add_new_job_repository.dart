

import 'package:jobick_shafeeque/core/hive_db_functions.dart';
import 'package:jobick_shafeeque/core/http.dart';

class  AddNewJobRepository {
  AddNewJobRepository({required this.db ,required this.client});

  final Http client;
  final AppDatabase db;

/*
  Future<HomeTopResponse> sentRequestGetHomeTopData() async {
    return homeTopResponseFromJson(
        await client.getRequest("${baseUrl}top.json"));
  }



  Future<HomeMiddleResponse> sentRequestGetHomeMiddleData() async{
    return homeMiddleResponseFromJson(
        await client.getRequest("${baseUrl}middle.json"));
  }



  Future<HomeBottomResponse> sentRequestGetHomeBottomData() async{
    return homeBottomResponseFromJson(
        await client.getRequest("${baseUrl}bottom.json"));
  }*/

}
