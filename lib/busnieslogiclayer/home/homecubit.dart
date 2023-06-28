import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaadara/datalayer/repo/home/searchrepo.dart';
import 'package:jaadara/datalayer/repo/home/slider.dart';

import '../../datalayer/model/bestsellers.dart';
import '../../datalayer/model/offers.dart';
import '../../datalayer/model/searchmodel.dart';
import '../../datalayer/model/slider.dart';
import '../../datalayer/repo/home/bestsellers.dart';

import '../../datalayer/repo/home/offers.dart';
import 'homestate.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
          HomeStateInitial(),
        );


  // SliderModel categorySlider = SliderModel();
  Seller seller = Seller();
  SliderModel? sliderCat = SliderModel();
  TextEditingController searchEdtingController = TextEditingController();
  bool isSearch = false;

  List<SliderModel> slider = [];

  getSliderSendData({context}) async {
    emit(HomeStateLoading());
    sliderCat = await SliderRepo.getSliderRepo();
    print(sliderCat!.message.toString());
    emit(HomeStateSuccess());
  }

  checkSearch({val}) {
    if (val == "") {
      isSearch = false;
    }
    emit(HomeStateSuccess());
  }

  onSearch() {
    isSearch = true;
    emit(HomeStateSuccess());
  }

  getSellerSendData({context}) async {
    emit(HomeStateLoading());
    seller = await SellerRepo.getSellerRepo();
    emit(HomeStateSuccess());
  }

  SearchModel searchModel = SearchModel();

  getsearchSendData({context}) async {
    emit(HomeStateLoading());
    searchModel = await SearchRepo.getSearchRepo();
    emit(HomeStateSuccess());
  }

  Offers offers = Offers();
  String searchProduct = "";

  getoffersSendData({context}) async {
    emit(HomeStateLoading());
    offers = await OfferRepo.getOfferRepo();
    emit(HomeStateSuccess());
  }
}
