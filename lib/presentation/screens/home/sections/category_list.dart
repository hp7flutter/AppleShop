import 'package:apple_shop_ir/common/api/api_status.dart';
import 'package:apple_shop_ir/common/components/components.dart';
import 'package:apple_shop_ir/core/configs/constants/colours.dart';
import 'package:apple_shop_ir/features/Category/bloc/category_bloc.dart';
import 'package:apple_shop_ir/features/Category/bloc/category_state.dart';
import 'package:apple_shop_ir/features/Category/model/category_model.dart';
import 'package:apple_shop_ir/presentation/screens/category/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        switch (state) {
          case CategoryLoadingState():
            return Components.loadingIndicator();
          case CategoryErrorState():
            return Components.errorAlert(state.message);
          case CategoryResposneState():
            return categoryWidget(state.response);
        }
        return Components.errorAlert(ApiStatus.noDataToShowError);
      },
    );
  }

  Widget categoryWidget(List<CategoryModel> data) {
    return Column(
      crossAxisAlignment: .end,
      spacing: 28,
      children: [
        Padding(
          padding: const .symmetric(horizontal: 40),
          child: Text(
            'دسته‌بندی',
            style: TextStyle(
              fontFamily: 'SM',
              fontSize: 16,
              color: Colours.darkGrey,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 84,
          child: ListView.builder(
            itemCount: data.length,
            scrollDirection: .horizontal,
            reverse: true,
            padding: .symmetric(horizontal: 20),
            itemBuilder: (context, index) {
              return Column(
                spacing: 8,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CategoryScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 56,
                        height: 56,
                        margin: .symmetric(horizontal: 12),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: .circular(24),
                          ),
                          color: HexColor(data[index].color!),
                          shadows: [
                            BoxShadow(
                              offset: Offset(0, 8),
                              blurRadius: 20,
                              spreadRadius: -8,
                              color: HexColor(data[index].color!),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Components.networkImage(
                            width: 26,
                            height: 26,
                            url: data[index].icon!,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(data[index].title!, style: TextStyle(fontFamily: 'SB')),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
