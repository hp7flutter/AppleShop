import 'package:apple_shop_ir/features/Banner/bloc/banner_bloc.dart';
import 'package:apple_shop_ir/features/Banner/bloc/banner_event.dart';
import 'package:apple_shop_ir/features/Category/bloc/category_bloc.dart';
import 'package:apple_shop_ir/features/Category/bloc/category_event.dart';
import 'package:apple_shop_ir/features/Product/bloc/product_bloc.dart';
import 'package:apple_shop_ir/features/Product/bloc/product_event.dart';
import 'package:apple_shop_ir/presentation/components/sliver_appbar.dart';
import 'package:apple_shop_ir/presentation/screens/home/sections/category_list.dart';
import 'package:apple_shop_ir/presentation/screens/home/sections/product_most_sold.dart';
import 'package:apple_shop_ir/presentation/screens/home/sections/product_most_viewed.dart';
import 'package:apple_shop_ir/presentation/screens/home/sections/product_running_out.dart';
import 'package:apple_shop_ir/presentation/screens/home/sections/slider_banner.dart';
import 'package:apple_shop_ir/presentation/screens/home/widgets/appbar_trailing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<BannerBloc>().add(BannerGetDataEvent());
    context.read<CategoryBloc>().add(CategoryGetDataEvent());
    context.read<ProductBloc>().add(ProductGetDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBarWidget(trailing: appbarTrailing()),
            SliverPadding(
              padding: .only(top: 40),
              sliver: SliverToBoxAdapter(child: SliderBanners()),
            ),
            SliverPadding(
              padding: .symmetric(vertical: 40),
              sliver: SliverToBoxAdapter(child: CategoryList()),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              sliver: SliverToBoxAdapter(child: ProductMostSold()),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              sliver: SliverToBoxAdapter(child: ProductMostViewed()),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              sliver: SliverToBoxAdapter(child: ProductRunningOut()),
            ),
          ],
        ),
      ),
    );
  }
}
