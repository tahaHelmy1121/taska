

    import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../busnieslogiclayer/home/homecubit.dart';

Widget drewSlider(){
  return    CarouselSlider.builder(
      itemCount: 1,
      itemBuilder: (context, position, index) {
        return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(5),
            height: 180,
            child:Image.network(BlocProvider.of<HomeCubit>(context).sliderCat!.data![1].photo)
        );
      },
      options: CarouselOptions(
        onPageChanged: (value, int) {
          //     pageIndexNotifier.value = value;
        },
        height: 150,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration:
        Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ));


    }