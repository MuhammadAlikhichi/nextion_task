
import 'package:get/get.dart';
import 'package:nextion_taskpro/model/movie_model.dart';
import 'package:nextion_taskpro/services/shareprefrence_services.dart';
class FavoriteController extends GetxController {

RxList<Movie> favouriteList=<Movie>[].obs;
getFavList()async{
  favouriteList.value=await SharedPrefService().getFavList('fav');
}
@override
  void onInit() {
getFavList();
    super.onInit();
  }
}