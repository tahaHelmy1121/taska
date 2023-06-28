import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaadara/busnieslogiclayer/auth/setpassword/resetpasswordstate.dart';
import 'package:jaadara/presntionlayer/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../datalayer/model/newpass.dart';
import '../../../datalayer/repo/resetpassword.dart';
import '../../../helper/resultprocess.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  SetPassword? setPassword;

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final TextEditingController pass = TextEditingController();
  final TextEditingController pass2 = TextEditingController();
  SharedPreferences? _sharedPreferences;

  SharedPreferences? get sharedPreferences => _sharedPreferences;

  SetPassword? setPasswords;

  forgetSendData({var pass, pass2, required context}) async {
    setPassword = await ResetpasswordRepo.getResetResponse(
     password: pass,
      confirmPass: pass2,
    );
    if (setPassword?.message.toString() == true) {
      ResultProcess.drewResultProcess(
        context: context,
        reson: setPassword?.message.toString(),
        status: true,
        nav:  HomeView(),
      );
      emit(ResetPasswordSuccess());
    } else {
      ResultProcess.drewResultProcess(
          context: context,
          reson: setPassword?.message.toString(),
          status: false);

      emit(ResetPasswordFailure());
    }
  }
}
