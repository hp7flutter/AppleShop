import 'package:apple_shop_ir/common/utility/extensions.dart';
import 'package:apple_shop_ir/common/components/components.dart';
import 'package:apple_shop_ir/core/configs/constants/colours.dart';
import 'package:apple_shop_ir/features/Product/model/product_model.dart';
import 'package:apple_shop_ir/presentation/screens/detail/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isToCard = false;
  bool isToFavorite = false;

  @override
  Widget build(BuildContext context) {
    return productCard(widget.product);
  }

  Widget productCard(ProductModel product) {
    return Padding(
      padding: const .symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product),
            ),
          );
        },
        child: Stack(
          clipBehavior: .none,
          children: [
            cardLayer(product),
            percent(product),
            quantity(product),
            addToFavorite(),
            addToCart(),
          ],
        ),
      ),
    );
  }

  Widget addToCart() {
    return Positioned(
      top: 2,
      left: 2,
      child: SizedBox(
        width: 32,
        height: 32,
        child: IconButton(
          onPressed: () {
            setState(() {
              isToCard = isToCard;
            });
          },
          style: IconButton.styleFrom(
            backgroundColor: Colors.grey.shade300,
            padding: .zero,
          ),
          icon: isToCard
              ? Icon(Iconsax.shopping_bag5, color: Colours.green)
              : Icon(Iconsax.shopping_bag5, color: Colors.white),
        ),
      ),
    );
  }

  Widget addToFavorite() {
    return Positioned(
      top: 2,
      right: 2,
      child: SizedBox(
        width: 32,
        height: 32,
        child: IconButton(
          onPressed: () {
            setState(() {
              isToFavorite = isToFavorite;
            });
          },
          style: IconButton.styleFrom(
            backgroundColor: Colors.grey.shade300,
            padding: .zero,
          ),
          icon: isToFavorite
              ? Icon(Icons.favorite_rounded, color: Colours.red)
              : Icon(Icons.favorite_rounded, color: Colors.white),
        ),
      ),
    );
  }

  Widget percent(ProductModel item) {
    final hasDiscount = item.discountPrice > 0;
    return Positioned(
      bottom: 36,
      left: -8,
      child: Visibility(
        visible: hasDiscount,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
          decoration: BoxDecoration(
            color: Colours.green,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Components.textFa(
                '%',
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
              Components.textFa(
                item.percent.toStringAsFixed(0),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget quantity(ProductModel item) {
    final bool hasDiscount = item.quantity > 0;
    return Positioned(
      bottom: 90,
      right: -8,
      child: Visibility(
        visible: hasDiscount,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
          decoration: BoxDecoration(
            color: Colours.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 2,
            children: [
              Components.textFa(
                'عدد',
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
              Components.textFa(
                item.quantity.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productPrice(ProductModel item) {
    final hasDiscount = item.discountPrice > 0;

    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Colours.darkBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: hasDiscount,
                child: Components.textFa(
                  item.realPrice.converToPrice(),
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.white,
                    decorationThickness: 1.6,
                  ),
                ),
              ),
              Components.textFa(
                item.price.converToPrice(),
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
          Components.textFa(
            'تومان',
            style: TextStyle(color: Colors.grey.shade200),
          ),
        ],
      ),
    );
  }

  Widget cardLayer(ProductModel item) {
    return Container(
      width: 164,
      height: 248,
      padding: .all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(12),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 8,
            spreadRadius: -6,
            color: Colors.grey,
          ),
        ],
      ),
      child: Column(
        spacing: 4,
        children: [
          productThumbnail(item),
          productName(item),
          productPrice(item),
        ],
      ),
    );
  }

  Widget productName(ProductModel item) {
    return Container(
      width: .infinity,
      height: 40,
      padding: .all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: .circular(12),
      ),
      child: Center(
        child: Components.textFa(
          item.name,
          textAlign: .end,
          style: TextStyle(fontSize: 14, overflow: .ellipsis),
        ),
      ),
    );
  }

  Widget productThumbnail(ProductModel item) {
    return Container(
      width: .infinity,
      height: 152,
      decoration: BoxDecoration(
        color: Colors.white,
        border: .all(width: 1, color: Colors.grey.shade100),
        borderRadius: .circular(12),
      ),
      child: ClipRRect(
        borderRadius: .circular(12),
        child: Components.networkImage(url: item.thumbnail),
      ),
    );
  }
}
