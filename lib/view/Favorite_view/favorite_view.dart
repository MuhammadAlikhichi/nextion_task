
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextion_taskpro/widget/fav_movie_data_widget.dart';
import '../../controller/favorite_controller.dart';
import '../../widget/movie_data_widget.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});
  final FavoriteController _favoriteController = Get.put(FavoriteController());
  @override
  Widget build(BuildContext context) {
    _favoriteController.getFavList();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Center(
          child:  Text("Favorite",
          style: TextStyle(
            color: Colors.white
          ),),
        ),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(future: _favoriteController.getFavList(),
        builder: (context,sna) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: _favoriteController.favouriteList.length,
              itemBuilder: (ctx,index) {
                return
                favouriteMovieDataWidget(context: context,
                    posterUrl: _favoriteController.favouriteList[index].posterPath,
                  overView: _favoriteController.favouriteList[index].overview,
                  title: _favoriteController.favouriteList[index].title
                );
              }
          );
        }
      ),
    );
  }
}
