import 'package:apple_shop_ir/features/Auth/bloc/auth_bloc.dart';
import 'package:apple_shop_ir/features/Banner/bloc/banner_bloc.dart';
import 'package:apple_shop_ir/features/Category/bloc/category_bloc.dart';
import 'package:apple_shop_ir/features/Detail/bloc/detail_bloc.dart';
import 'package:apple_shop_ir/features/Product/bloc/product_bloc.dart';
import 'package:apple_shop_ir/common/di/di.dart';
import 'package:apple_shop_ir/core/configs/constants/colours.dart';
import 'package:apple_shop_ir/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => initApp();

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Di.setupLocator();
  final Application application = Application();
  runApp(application);
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => BannerBloc()),
        BlocProvider(create: (_) => CategoryBloc()),
        BlocProvider(create: (_) => ProductBloc()),
        BlocProvider(create: (_) => DetailBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colours.lightGrey,
          fontFamily: 'SM',
        ),
        home: DashboardScreen(),
      ),
    );
  }
}
