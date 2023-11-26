import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

Widget favouriteMovieDataWidget({BuildContext? context,
  String ?posterUrl,String?title,
  String?releaseDate,String?overView
}){

  var width = MediaQuery.of(context!).size.width;
  var height = MediaQuery.of(context).size.height;
  return Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(15.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.black),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          height: height * 0.35,
          width: width * 1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                image: NetworkImage(
                    "https://image.tmdb.org/t/p/w500$posterUrl"
                        .toString()),
                fit: BoxFit.contain),
          ),
        ),
        SizedBox(
          height: height * 0.005,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                title ?? " ",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const Icon(
              Icons.favorite,
              color:Colors.red,
            )
          ],
        ),
        SizedBox(
          height: height * 0.009,
        ),
        Text(
          "$releaseDate   13+   2h 18m" ??
              "",
          style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Text(
          overView ?? " ",
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}