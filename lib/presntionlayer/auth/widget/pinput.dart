

         import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../busnieslogiclayer/auth/resendcode/resendcubit.dart';

Widget drewPinPut({var context }){
  return  Pinput(
    length: 4,
    keyboardType: TextInputType.number,
    controller: BlocProvider.of<ResendCodeCubit>(context).code,
    textInputAction: TextInputAction.next,
    showCursor: true,
    validator: (s) {
      print('validating code: $s');
    },
    onCompleted: null,
  );


}