import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/end_points.dart';
import '../../constants/strings.dart';
import '../../data/models/account_model.dart';
import '../../data/remote/dio_helper.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  bool isObscure = true;
  bool isObscure2 = true;

  void changePasswordVisibility() {
    isObscure = !isObscure;
    emit(ChangePasswordVisibilityState());
  }
  void changePasswordVisibility2() {
    isObscure2 = !isObscure;
    emit(ChangePasswordVisibilityState2());
  }
  AccountModel? loginModel;

  void userLogin({required String email, required String password, required context}) {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: loginPath,
        body: {
          'email': email,
          'password': password,
        }
    ).then((value) {
      print(value.data);
      loginModel = AccountModel.fromJson(value.data);
      Navigator.popAndPushNamed(context, userProfileScreen);
      getData();
      print(loginModel!.account);
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  void userRegister({required String email, required String password,required String name, required String phone,context}){
    emit(RegisterLoadingState());
    DioHelper.postData(
        url: registerPath,
        body:{
          'name': name,
          'password':password,
          'email':email,
          'phone':phone,
        }
    ).then((value) {
      print(value.data);
      loginModel= AccountModel.fromJson(value.data);
      getData();
      Navigator.popAndPushNamed(context, userProfileScreen);
      emit(RegisterSuccessState());
    }).catchError((error){
      emit(RegisterErrorState());
    });
  }

  late String name;
  late String email;
  late String phone;
  bool isDone = false;
  getData(){
    loginModel!.account!.forEach((element) {
      name = element.name!;
      phone = element.phone!;
      email = element.email!;
    });
    isDone =true;
    emit(GetDataSuccess());
  }
}
