import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../styles/colors.dart';
import '../../widget/default_buttom.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _cubit = GlobalCubit.get(context);
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.blue,
              title: const Text(
                'UserData',
                style: TextStyle(fontSize: 20),
              ),
              centerTitle: true,
            ),
            body: _cubit.isDone
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Name : ${_cubit.name}',
                            style: const TextStyle(
                                color: AppColor.blue, fontSize: 25),
                          ),
                          Text(
                            'Email : ${_cubit.email}',
                            style: const TextStyle(
                                color: AppColor.blue, fontSize: 25),
                          ),
                          Text(
                            'Phone : ${_cubit.phone}',
                            style: const TextStyle(
                                color: AppColor.blue, fontSize: 25),
                          ),
                        ],
                      ),
                      const Spacer(),
                        DefaultButton(
                            onPress: (){},
                            height: 60,
                            width: 150,
                            buttonColor: AppColor.red,
                            label: 'Logout',
                            labelSize: 20,
                            labelColor: AppColor.white),
                      const SizedBox(
                        height: 40.0,
                      ),
                    ],
                  ),
                )
                : const Center(
                    child: CircularProgressIndicator(),
                  ));
      },
    );
  }
}
