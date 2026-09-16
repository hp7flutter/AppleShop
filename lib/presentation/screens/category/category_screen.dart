import 'package:apple_shop_ir/common/api/api_status.dart';
import 'package:apple_shop_ir/common/components/components.dart';
import 'package:apple_shop_ir/core/configs/constants/colours.dart';
import 'package:apple_shop_ir/features/Category/bloc/category_bloc.dart';
import 'package:apple_shop_ir/features/Category/bloc/category_state.dart';
import 'package:apple_shop_ir/presentation/components/sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.lightGrey,
      body: SafeArea(
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            switch (state) {
              case CategoryLoadingState():
                return Components.loadingIndicator();
              case CategoryErrorState():
                return Components.errorAlert(state.message);
              case CategoryResposneState():
                return CustomScrollView(
                  slivers: [
                    SliverAppBarWidget(title: 'همه محصولات'),
                    SliverPadding(
                      padding: .all(12),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                            ),
                        delegate: SliverChildBuilderDelegate(
                          childCount: state.response.length,
                          (context, index) {
                            return Components.networkImage(
                              url: state.response[index].thumbnail!,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
            }
            return Components.errorAlert(ApiStatus.noDataToShowError);
          },
        ),
      ),
    );
  }
}
