import 'package:api/new%20getx%20api/services/repo/repo.dart';
import 'package:get/get.dart';

class GetxGetController extends GetxController
{

 RxList userData = [].obs;
 var isLoading = false.obs;

  final GetRepo repo = GetRepo();

  @override
  void onInit() {
    super.onInit();
    fetchUserData();

  }
  void fetchUserData () async
  {
    try {
      isLoading.value=true;
      final data = await repo.getData();
      userData.value = data;
      update();
      isLoading.value=false;
    }
    catch(e){
      print(e.toString());
      print("=========>>>ERROR<<<===========");
      isLoading.value=false;
    }
  }
}