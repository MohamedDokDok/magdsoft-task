import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../../constants/strings.dart';
import '../../styles/colors.dart';
import '../../widget/default_buttom.dart';
import '../../widget/text_form_field.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);

   final TextEditingController _fullNameTextController = TextEditingController();
   final TextEditingController _emailTextController = TextEditingController();
   final TextEditingController _phoneTextController = TextEditingController();
   final TextEditingController _passwordTextController = TextEditingController();
   final TextEditingController _confirmPasswordTextController = TextEditingController();

   final FocusNode _fullNameFCN = FocusNode();
   final FocusNode _emailFCN = FocusNode();
   final FocusNode _phoneFCN = FocusNode();
   final FocusNode _passwordFCN = FocusNode();
   final FocusNode _confirmPasswordFCN = FocusNode();
   var formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    GlobalCubit _cubit = GlobalCubit.get(context);

    return  BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(0, 93, 163, 1),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                const Expanded(
                    flex: 1,
                    child:  Image(
                      image: AssetImage('assets/images/logoFlutter.png'),
                      fit: BoxFit.cover,
                    )),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Form(
                        key: formKey  ,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .08,
                            ),
                            DefaultTextFormField(
                              controller: _fullNameTextController,
                              onSubmit: () =>
                                  FocusScope.of(context).requestFocus(_emailFCN),
                              node: _fullNameFCN,
                              isObscure: false,
                              validate: (String? email) {},
                              label: 'Full Name',
                              keyBoardType: TextInputType.emailAddress,
                              action: TextInputAction.next,
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            DefaultTextFormField(
                              controller: _emailTextController,
                              onSubmit: () =>
                                  FocusScope.of(context).requestFocus(_phoneFCN),
                              node: _emailFCN,
                              isObscure: false,
                              validate: (String? password) {},
                              label: 'Email',
                              keyBoardType: TextInputType.visiblePassword,
                              action: TextInputAction.done,
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            DefaultTextFormField(
                              controller: _phoneTextController,
                              onSubmit: () =>
                                  FocusScope.of(context).requestFocus(_passwordFCN),
                              node: _phoneFCN,
                              isObscure: false,
                              validate: (String? password) {},
                              label: 'Phone',
                              keyBoardType: TextInputType.visiblePassword,
                              action: TextInputAction.done,
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            DefaultTextFormField(
                              controller: _passwordTextController,
                              onSubmit: () =>
                                  FocusScope.of(context).requestFocus(_confirmPasswordFCN),
                              node: _passwordFCN,
                              isObscure: _cubit.isObscure,
                              validate: (String? password) {},
                              label: 'PassWord',
                              keyBoardType: TextInputType.visiblePassword,
                              action: TextInputAction.done,
                              suffixIcon: _cubit.isObscure ? Icons.visibility : Icons.visibility_off,
                              suffixIconOnPress: (){
                                _cubit.changePasswordVisibility();
                              },
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            DefaultTextFormField(
                              controller: _confirmPasswordTextController,
                              suffixIcon: _cubit.isObscure2 ? Icons.visibility : Icons.visibility_off,
                              suffixIconOnPress: (){
                                _cubit.changePasswordVisibility2();
                              },
                              onSubmit: () =>
                                  FocusScope.of(context).requestFocus(),
                              node: _confirmPasswordFCN,
                              isObscure: _cubit.isObscure2,
                              validate: (String? password) {},
                              label: 'Confirm PassWord',
                              keyBoardType: TextInputType.visiblePassword,
                              action: TextInputAction.done,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .1,
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                DefaultButton(
                                  onPress: () {
                                    Navigator.popAndPushNamed(context, logInScreen);
                                  },
                                  height: 55,
                                  width: 140,
                                  buttonColor: AppColor.blue,
                                  label: 'Login',
                                  labelSize: 20.0,
                                  labelColor: AppColor.white,
                                ),
                                const Spacer(),
                                DefaultButton(
                                  onPress: () {
                                    _cubit.userRegister(context: context,email: _emailTextController.text, password: _passwordTextController.text, name: _fullNameTextController.text, phone: _phoneTextController.text);
                                  },
                                  height: 55,
                                  width: 140,
                                  buttonColor: AppColor.blue,
                                  label: 'Register',
                                  labelSize: 20.0,
                                  labelColor: AppColor.white,
                                ),
                                const Spacer(),
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            // const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
