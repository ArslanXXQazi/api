import 'package:api/new%20getx%20api/services/repo/repo.dart';
import 'package:get/get.dart';

class GetxGetController extends GetxController
{

  RxMap<String , dynamic> userData = RxMap<String,double>();

  final GetRepo repo = GetRepo();

  @override
  void onInit() {
    super.onInit();

  }
  void fetchUserData () async
  {
    try {
      final data = await repo.getData();
      userData.value = data;
    }
    catch(e){
      print("=========>>>ERROR<<<===========");
    }
  }
}