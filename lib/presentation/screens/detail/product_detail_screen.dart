import 'dart:ui';

import 'package:apple_shop_ir/common/components/components.dart';
import 'package:apple_shop_ir/common/utility/extensions.dart';
import 'package:apple_shop_ir/core/configs/constants/colours.dart';
import 'package:apple_shop_ir/features/Detail/bloc/detail_bloc.dart';
import 'package:apple_shop_ir/features/Detail/bloc/detail_event.dart';
import 'package:apple_shop_ir/features/Detail/bloc/detail_state.dart';
import 'package:apple_shop_ir/features/Detail/model/gallery_model.dart';
import 'package:apple_shop_ir/features/Product/model/product_model.dart';
import 'package:apple_shop_ir/presentation/components/sliver_appbar.dart';
import 'package:apple_shop_ir/presentation/screens/detail/widgets/detail_builder.dart';
import 'package:apple_shop_ir/presentation/screens/detail/widgets/variant_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen(this.product, {super.key});

  final ProductModel product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    BlocProvider.of<DetailBloc>(context).add(
      DetailGetDataEvent(
        productId: widget.product.id,
        categoryId: widget.product.categoryId,
      ),
    );
    super.initState();
  }

  List<String> buildImagesList(List<GalleryModel>? galleryList) {
    final List<String> galleryImages = [];

    if (galleryList != null) {
      for (final gallery in galleryList) {
        if (gallery.productId == widget.product.id &&
            gallery.imageUrl != null &&
            gallery.imageUrl!.isNotEmpty) {
          if (!galleryImages.contains(gallery.imageUrl)) {
            galleryImages.add(gallery.imageUrl!);
          }
        }
      }
    }

    if (galleryImages.isEmpty) {
      if (widget.product.thumbnail.isNotEmpty) {
        return [widget.product.thumbnail];
      }
      return [];
    }

    return galleryImages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: productDetailBuilder()));
  }

  Widget productDetailBuilder() {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        switch (state) {
          case DetailLoadingState():
            return Components.loadingIndicator();
          case DetailResponseState():
            final imagesList = buildImagesList(state.galleryList);
            return CustomScrollView(
              slivers: [
                SliverAppBarWidget(
                  title: state.productCategory?.title ?? 'مشخصات محصول',
                  showBackButton: true,
                ),
                ...{sliver(child: Components.textFa(widget.product.name))},
                ...{sliver(paddingY: 0, child: DetailBuilder(imagesList))},
                ...{
                  sliver(
                    paddingY: 0,
                    child: VariantBuilder(state.productVariantsList!),
                  ),
                  ...{
                    sliver(
                      paddingY: 40,
                      child: Column(
                        spacing: 8,
                        children: [
                          detailTile(onTap: () {}, title: 'مشخصات فنی'),
                          detailTile(onTap: () {}, title: 'توضیحات محصول'),
                          detailTile(onTap: () {}, title: 'نظرات کاربران'),
                        ],
                      ),
                    ),
                    ...{
                      sliver(
                        child: Row(
                          mainAxisAlignment: .spaceEvenly,
                          children: [
                            blurButton(
                              title:
                                  '${widget.product.price.converToPrice()}  تومان',
                              color: Colours.green,
                            ),
                            blurButton(
                              title: 'افزودن به سبد خرید',
                              color: Colours.darkBlue,
                            ),
                          ],
                        ),
                      ),
                      sliver(),
                    },
                  },
                },
              ],
            );
        }
        return CustomScrollView(
          slivers: [
            SliverAppBarWidget(title: 'مشخصات محصول', showBackButton: true),
          ],
        );
      },
    );
  }

  Widget blurButton({Color? color, String? title}) {
    return Stack(
      clipBehavior: .none,
      alignment: .bottomCenter,
      children: [
        Container(
          width: 120,
          height: 50,
          decoration: BoxDecoration(color: color, borderRadius: .circular(12)),
        ),
        ClipRRect(
          borderRadius: .circular(12),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              width: 140,
              height: 44,
              decoration: BoxDecoration(),
              child: Center(
                child: Components.textFa(
                  title,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget detailTile({required VoidCallback onTap, required String title}) {
    return Container(
      width: 300,
      height: 48,
      padding: .only(left: 6, right: 12),
      decoration: BoxDecoration(
        border: .all(width: 2, color: Colors.grey.shade300),
        borderRadius: .circular(20),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colours.lightBlue.withValues(alpha: 0.1),
              foregroundColor: Colours.darkBlue,
              side: BorderSide(
                width: 1.2,
                color: Colours.lightBlue.withValues(alpha: 0.2),
              ),
              overlayColor: Colors.blue,
              shadowColor: Colors.transparent,
            ),
            child: Components.textFa('مشاهده'),
          ),
          Components.textFa(title),
        ],
      ),
    );
  }

  Widget sliver({Widget? child, double paddingX = 40, double paddingY = 20}) {
    return SliverPadding(
      padding: .symmetric(horizontal: paddingX, vertical: paddingY),
      sliver: SliverToBoxAdapter(child: child),
    );
  }
}
