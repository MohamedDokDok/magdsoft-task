import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../../constants/strings.dart';
import '../../styles/colors.dart';
import '../../widget/default_buttom.dart';
import '../../widget/text_form_field.dart';



class LogInScreen extends StatelessWidget {

   LogInScreen({Key? key}) : super(key: key);

   final TextEditingController _emailTextController = TextEditingController();
   final TextEditingController _passwordTextController = TextEditingController();
   var formKey=GlobalKey<FormState>();
   final FocusNode _emailFCN = FocusNode();
   final FocusNode _passwordFCN = FocusNode();



  @override
  Widget build(BuildContext context) {
    GlobalCubit _cubit = GlobalCubit.get(context);
    return  BlocConsumer<GlobalCubit,GlobalState>(
        listener: (context, state){},
        builder: (context, state) => Scaffold(
          backgroundColor: const Color.fromRGBO(0, 93, 163, 1),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15.0,right: 20.0),
                              child: DefaultButton(
                                  onPress: (){
                                    Navigator.popAndPushNamed(context, signUpScreen);
                                  },
                                  height: 31,
                                  width: 84,
                                  buttonColor: AppColor.white,
                                  label: 'عريي',
                                  labelSize: 15.0,
                                  labelColor: AppColor.blue),
                            )),
                        Spacer(),
                        const Image(
                          image: AssetImage('assets/images/logoFlutter.png'),
                          fit: BoxFit.cover,
                        ),
                        Spacer(flex: 3,),
                      ],
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
                        key: formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .18,
                            ),
                            DefaultTextFormField(
                              controller: _emailTextController,
                              onSubmit: () =>
                                  FocusScope.of(context).requestFocus(_passwordFCN),
                              node: _emailFCN,
                              isObscure: false,
                              validate: (String? email) {
                                if (email!.isEmpty ) {
                                  return 'Email Required';
                                }
                              },
                              label: 'Email',
                              keyBoardType: TextInputType.emailAddress,
                              action: TextInputAction.next,
                            ),
                            const SizedBox(
                              height: 18.0,
                            ),
                            DefaultTextFormField(
                              controller: _passwordTextController,
                              onSubmit: () =>  FocusScope.of(context).requestFocus(_passwordFCN),
                              node: _passwordFCN,
                              isObscure: _cubit.isObscure,
                              validate: (String? password) {
                                if (password!.isEmpty  ) {
                                  return 'password Required ';
                                }
                              },

                              label: 'PassWord',
                              keyBoardType: TextInputType.visiblePassword,
                              action: TextInputAction.done,
                              suffixIcon: _cubit.isObscure ? Icons.visibility : Icons.visibility_off,
                              suffixIconOnPress: (){
                                _cubit.changePasswordVisibility();
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .23,
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                DefaultButton(
                                  onPress: () {
                                    if(formKey.currentState!.validate()){
                                      _cubit.userLogin(context: context, email: _emailTextController.text, password: _passwordTextController.text,);
                                    }
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
                                    Navigator.popAndPushNamed(context, signUpScreen);
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
        ),
    );
  }
}
