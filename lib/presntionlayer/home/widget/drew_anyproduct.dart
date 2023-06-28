import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../const/style.dart';

Widget drewHomeProduct({context, image, title, price}) {
  var defaultSize = MediaQuery.of(context).size;
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 250,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) => Container(
          margin: const EdgeInsets.only(left: 17),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: HexColor("#FFF5F4"),
              boxShadow: [const BoxShadow(blurRadius: 0.2)]),
          height: defaultSize.height * 0.6,
          width: defaultSize.width * 0.4,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(image.toString()),
                      fit: BoxFit.contain),
                ),
              ),
              Text(
                title,
                style: StyleApp.styleBestSellers,
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  //    mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Text(
                        price,
                        style: StyleApp.styleLogo,
                      ),
                    ),
                    const SizedBox(
                      width: 41,
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(right: 10, top: 50, left: 30),
                      //   alignment: Alignment.centerRight,
                      // margin: EdgeInsets.symmetric(horizontal: 35),
                      child: Image.asset("assets/image/Group 48095671.png"),
                      width: 27,
                      height: 28,
                    )
                  ],
                ),
              )
            ],
          )),
    ),
  );
}
