import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jaadara/busnieslogiclayer/home/homecubit.dart';

import '../../../const/style.dart';

Widget drewCustomSearchField({context}) {
  return Padding(
    padding: const EdgeInsets.only(right: 4),
    child: Stack(
      children: [
        Container(
          color: HexColor("#FFF5F4"),
          width: 298,
          height: 48,
          child: TextFormField(
            controller:
                BlocProvider.of<HomeCubit>(context).searchEdtingController,
            onChanged: (v) {
              BlocProvider.of<HomeCubit>(context).checkSearch(val: v);
            },
            style: StyleApp.style1,
            textDirection: TextDirection.rtl,
            //      controller: context.read<LoginViewModel>().textEditingControllerMobile,
            validator: (value) {
              if (value!.isEmpty) {
                return "أدخل رقم الهاتف";
              }
              return null;
            },
            keyboardType: TextInputType.text,
            textAlign: TextAlign.right,

            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: (){
                  BlocProvider.of<HomeCubit>(context).onSearch();
                },
                child: Container(
                  width: 30,
                  height: 30,

                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: ExactAssetImage(
                      "assets/image/search-normal.png",
                    ),
                  ),

                  ),

                ),
              ),
              suffixIconConstraints:
                  BoxConstraints(maxHeight: 50, maxWidth: 35),
              errorStyle: const TextStyle(fontFamily: "BigVesta"),
              hintText: "ابحث عن ",
              hintStyle: StyleApp.style1,
              filled: true,
            ),
          ),
        ),
      ],
    ),
  );
}
