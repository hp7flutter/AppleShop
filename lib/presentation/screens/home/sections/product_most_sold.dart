import 'package:apple_shop_ir/common/api/api_status.dart';
import 'package:apple_shop_ir/common/components/components.dart';
import 'package:apple_shop_ir/features/Product/bloc/product_bloc.dart';
import 'package:apple_shop_ir/features/Product/bloc/product_state.dart';
import 'package:apple_shop_ir/presentation/screens/home/widgets/product_card.dart';
import 'package:apple_shop_ir/presentation/screens/home/widgets/product_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductMostSold extends StatelessWidget {
  const ProductMostSold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        switch (state) {
          case ProductLoadingState():
            return Components.loadingIndicator();
          case ProductErrorState():
            return Components.errorAlert(state.message);
          case ProductLoadedState():
            return ProductListBuilder(
              length: state.hottest.length,
              title: 'پربازدیدترین‌ها',
              itemBuilder: (context, index) {
                return ProductCard(product: state.hottest[index]);
              },
            );
          default:
            return Components.errorAlert(ApiStatus.noDataToShowError);
        }
      },
    );
  }
}
