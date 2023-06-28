
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jaadara/presntionlayer/home/widget/drew_anyproduct.dart';
import 'package:jaadara/presntionlayer/home/widget/drewbottomnavbar.dart';
import 'package:jaadara/presntionlayer/home/widget/drewcustomtextfieldhome.dart';
import 'package:jaadara/presntionlayer/home/widget/drewslider.dart';
import 'package:jaadara/presntionlayer/home/widget/drewtextside.dart';
import '../../busnieslogiclayer/home/homecubit.dart';
import '../../busnieslogiclayer/home/homestate.dart';
import '../../customwidget/drewtoplogo.dart';
import '../../datalayer/model/slider.dart';
import '../../datalayer/repo/home/slider.dart';
import '../../helper/massage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {

    var slider =
        BlocProvider.of<HomeCubit>(context).getSliderSendData(context: context);
    var seller =
        BlocProvider.of<HomeCubit>(context).getSellerSendData(context: context);
    var offers =
        BlocProvider.of<HomeCubit>(context).getoffersSendData(context: context);
    var search =
        BlocProvider.of<HomeCubit>(context).getsearchSendData(context: context);
    var defaultSize = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Container(
          width: 24,
          height: 30,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage(
            "assets/image/shopping-cart.png",
          ))),
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: drewNavBar(),

      //    bottomNavigationBar: BottomNavBar(),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeStateLoading) {
            const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else if (state is HomeStateSuccess) {
          } else if (state is HomeStateFailure) {
            MassageApp.snackBar(state.toString(), context);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
              child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                  width: defaultSize.width * 0.2,
                  height: 30,
                  child: Image.asset("assets/image/bars-3-center-left.png"),
                ),
                SizedBox(
                  width: 32,
                ),
                drewTopLogo(),
              ],
            ),
            !BlocProvider.of<HomeCubit>(context).isSearch
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                            width: 45,
                            height: 40,
                            child: Image.asset(
                              "assets/image/Group 48095690.png",
                            ),
                          ),
                          drewCustomSearchField(context: context),
                        ],
                      ),
                      drewSlider(),
                      drewText(rightText: "الاكثر مبيعا", leftText: "المزيد"),
                      Container(
                        child: drewHomeProduct(
                            title: BlocProvider.of<HomeCubit>(context)
                                .seller!
                                .data!
                                .first
                                .title
                                .toString(),
                            image: BlocProvider.of<HomeCubit>(context)
                                .seller!
                                .data!
                                .first
                                .photo
                                .toString(),
                            price: BlocProvider.of<HomeCubit>(context)
                                .seller!
                                .data!
                                .first
                                .price
                                .toString(),
                            context: context),
                      ),
                      drewText(rightText: "الاكثر عروضا", leftText: ""),
                      Container(
                        child: drewHomeProduct(
                            title: BlocProvider.of<HomeCubit>(context)
                                .offers!
                                .data!
                                .first
                                .title
                                .toString(),
                            image: BlocProvider.of<HomeCubit>(context)
                                .offers!
                                .data!
                                .first
                                .photo
                                .toString(),
                            price: BlocProvider.of<HomeCubit>(context)
                                .offers!
                                .data!
                                .first
                                .price
                                .toString(),
                            context: context),
                      ),
                    ],
                  )
                : Container(
                  child: drewHomeProduct(
                      title: BlocProvider.of<HomeCubit>(context)
                          .searchModel!
                          .data!
                          .first
                          .title
                          .toString(),
                      image: BlocProvider.of<HomeCubit>(context)
                          .searchModel!
                          .data!
                          .first
                          .photo
                          .toString(),
                      price: BlocProvider.of<HomeCubit>(context)
                          .searchModel!
                          .data!
                          .first
                          .price
                          .toString(),
                      context: context),
                ),
          ]));
        },
      ),
    );
  }
}
