import 'package:api/new%20getx%20api/services/repo/repo.dart';
import 'package:get/get.dart';

class GetxGetController extends GetxController
{

  RxMap<String, dynamic> userData = <String, dynamic>{}.obs;

  final GetRepo repo = GetRepo();

  @override
  void onInit() {
    super.onInit();
    fetchUserData();

  }
  void fetchUserData () async
  {
    try {
      final data = await repo.getData();
      userData.value = data;
      update();
    }
    catch(e){
      print("=========>>>ERROR<<<===========");
    }
  }
}