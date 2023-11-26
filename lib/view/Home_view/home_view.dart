import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextion_taskpro/services/shareprefrence_services.dart';
import 'package:nextion_taskpro/view/Favorite_view/favorite_view.dart';
import '../../model/movie_model.dart';
import '../../resources/app_strings/app_strings.dart';
import '../../services/movie_service.dart';
import '../../widget/movie_data_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Movie> _favList = <Movie>[];

  getFavList() async {
    _favList = await SharedPrefService().getFavList('fav');
  }

  @override
  didChangeDependencies() async {
    super.didChangeDependencies();
    await getFavList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text(
          AppStrings.homePageTitle,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          InkWell(
              onTap: () {
                Get.to(() => FavoritePage());
              },
              child: const Icon(
                Icons.favorite,
                color: Colors.white,
              ))
        ],
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
          future: MovieService.getMoviesList(),
          builder: (ctx, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapShot.data?.length,
                itemBuilder: (ctx, index) {
                  log(snapShot.data![index].posterPath.toString());
                  bool isExists = _favList
                      .any((element) => element.id == snapShot.data![index].id);
                  if (isExists) {
                    snapShot.data![index].isFav?.value = true;
                  } else {
                    snapShot.data![index].isFav?.value = false;
                  }
                  return showMovieDataWidget(
                      context: context,
                      title: snapShot.data?[index].title ?? '',
                      overView: snapShot.data?[index].overview ?? '',
                      posterUrl: snapShot.data?[index].posterPath,
                      isFav: snapShot.data?[index].isFav,
                      onPress: () async {
                        if (snapShot.data?[index].isFav?.value == false) {
                          snapShot.data?[index].isFav?.value = true;
                          if (_favList.contains(snapShot.data![index])) {
                          } else {
                            _favList.add(snapShot.data![index]);
                          }
                          SharedPrefService().storeFavList('fav', _favList);
                        } else {
                          _favList.removeWhere((element) =>
                              element.id == snapShot.data![index].id);
                          SharedPrefService().storeFavList('fav', _favList);
                          snapShot.data?[index].isFav?.value = false;
                        }
                      });
                });
          }),
    );
  }
}
