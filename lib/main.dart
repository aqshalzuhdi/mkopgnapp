import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgnmko_flutter/cubit/company_cubit.dart';
import 'package:pgnmko_flutter/cubit/cubit.dart';
import 'package:pgnmko_flutter/cubit/checkbox_cubit.dart';
import 'package:pgnmko_flutter/cubit/task_detail_cubit.dart';
import 'package:pgnmko_flutter/cubit/tab_bar_task_result_cubit.dart';
import 'package:pgnmko_flutter/shared/shared.dart';
import 'package:pgnmko_flutter/ui/pages/page.dart';
import 'package:get/get.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';

dynamic session;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  session = await getAuthorizationSession();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<UserCubit>().Profile();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginCubit(),
        ),
        BlocProvider(
          create: (_) => RefreshTokenCubit(),
        ),
        BlocProvider(
          create: (_) => ProfileCubit(),
        ),
        BlocProvider(
          create: (_) => TaskCubit(),
        ),
        BlocProvider(
          create: (_) => TaskCategoryCubit(),
        ),
        BlocProvider(
          create: (_) => TaskCategorySubCubit(),
        ),
        BlocProvider(
          create: (_) => TaskDetailCubit(),
        ),
        BlocProvider(
          create: (_) => TaskResultCubit(),
        ),
        BlocProvider(
          create: (_) => TaskResultDetailCubit(),
        ),
        BlocProvider(
          create: (_) => CheckboxCubit(),
        ),
        BlocProvider(
          create: (_) => TabBarTaskResultCubit(),
        ),
        BlocProvider(
          create: (_) => CompanyCubit(),
        ),
        BlocProvider(
          create: (_) => TaskResultSubmitCubit(),
        ),
        BlocProvider(
          create: (_) => TaskDocumentationCubit(),
        ),
        BlocProvider(
          create: (_) => TaskDocumentationCategoryCubit(),
        ),
        BlocProvider(
          create: (_) => TaskDocumentationSubmitCubit(),
        ),
        BlocProvider(
          create: (_) => TaskExportSubmitCubit(),
        ),
        BlocProvider(
          create: (_) => TotalCubit(),
        ),
        BlocProvider(
          create: (_) => LogoutSubmitCubit(),
        ),
        BlocProvider(
          create: (_) => TroubleReportCubit(),
        ),
      ],
      child: GetMaterialApp(
        home: Builder(
          builder: (_) {
            if (session != null) return const MainPage();

            return const LoginPage();
          },
        ),

        // BlocProvider(
        //   create: (_) => UserCubit(),
        //   child: BlocBuilder<UserCubit, UserState>(builder: (_, state) {
        //     if (session != null) {
        //       if (state is UserUnauthorized) {
        //         destroyAllSession();
        //         return const LoginPage();
        //       } else if (state is UserLoaded) {
        //         return MainPage();
        //         // return BlocProvider(
        //         //   create: (_) => AuthCubit(),
        //         //   child: BlocListener<AuthCubit, AuthState>(
        //         //     listener: (context, state) {
        //         //       print(state);
        //         //     },
        //         //     child: BlocBuilder<AuthCubit, AuthState>(
        //         //       builder: (context, state) {
        //         //         if (state is AuthFailed) {
        //         //           destroyAllSession();
        //         //           return const LoginPage();
        //         //         }

        //         //         return const MainPage();
        //         //       },
        //         //     ),
        //         //   ),
        //         // );
        //       } else if (state is UserLoadingFailed) {
        //         // ScaffoldMessenger.of(context).showSnackBar(
        //         //   SnackBar(
        //         //     content: Text((state as UserLoadingFailed).message),
        //         //     backgroundColor: kRedColor,
        //         //   ),
        //         // );
        //         print("destroyAllSession");
        //         destroyAllSession();
        //         return const LoginPage();
        //       } else {
        //         return MainPage();
        //       }
        //     } else {
        //       return const LoginPage();
        //     }
        //   }),
        // ),
      ),
    );
  }
}
