import 'package:apple_shop_ir/common/components/components.dart';
import 'package:flutter/material.dart';

class DetailBuilder extends StatefulWidget {
  const new(this.images, {super.key});

  final List<String> images;

  @override
  State<DetailBuilder> createState() => _DetailBuilderState();
}

class _DetailBuilderState extends State<DetailBuilder> {
  bool isFavorite = false;
  bool isStar = false;
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return detailBoard();
  }

  Widget detailBoard() {
    return Container(
      width: 320,
      height: 284,
      padding: .all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 2,
            spreadRadius: 0,
            color: Colors.black.withValues(alpha: 0.2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: .max,
        spacing: 12,
        children: [
          favoritePoints(),
          cover(widget.images),
          album(widget.images),
        ],
      ),
    );
  }

  Widget favoritePoints() {
    return Row(
      mainAxisAlignment: .spaceBetween,
      mainAxisSize: .max,
      children: [
        Row(
          spacing: 8,
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    // isStar = !isStar;
                  });
                },
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  padding: .zero,
                ),
                // icon: isStar
                //     ? Icon(Iconsax.star5, color: Colours.white)
                //     : Icon(Iconsax.star5, color: Colours.yellow),
                icon: Icon(Icons.star, color: Colors.white),
              ),
            ),
            Components.textFa('4.6'),
          ],
        ),
        SizedBox(
          width: 32,
          height: 32,
          child: IconButton(
            onPressed: () {
              setState(() {
                // isFavorite = !isFavorite;
              });
            },
            style: IconButton.styleFrom(
              backgroundColor: Colors.grey.shade200,
              padding: .zero,
            ),
            icon:
                //  Icon(Icons.favorite_rounded, color: Colors.white),
                // isFavorite
                // ? Icon(Icons.favorite_rounded, color: Colours.red)
                // : Icon(Icons.favorite_rounded, color: Colors.white),
                Icon(Icons.favorite, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget cover(List<String> images) {
    if (widget.images.isEmpty) {
      return Center(
        child: Container(
          height: 148,
          padding: .all(8),
          decoration: BoxDecoration(
            border: .all(width: 1.4, color: Colors.grey.shade300),
            borderRadius: .circular(12),
          ),
          child: Components.networkImage(
            url: images[selectedItem],
            fit: .contain,
          ),
        ),
      );
    }

    final itemIndex = selectedItem.clamp(0, widget.images.length - 1);

    return Container(
      width: 300,
      height: 148,
      padding: .all(8),
      decoration: BoxDecoration(
        border: .all(width: 1.4, color: Colors.grey.shade300),
        borderRadius: .circular(12),
      ),
      child: Components.networkImage(
        url: widget.images[itemIndex],
        fit: .contain,
      ),
    );
  }

  Widget album(List<String> images) {
    return SizedBox(
      height: 64,
      child: Directionality(
        textDirection: .rtl,
        child: ListView.builder(
          scrollDirection: .horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedItem = index;
                });
              },
              child: imageItem(images[index]),
            );
          },
        ),
      ),
    );
  }

  Widget imageItem(String imageUrl) {
    return Container(
      width: 60,
      height: 60,
      padding: .all(2),
      margin: .symmetric(horizontal: 4),
      decoration: BoxDecoration(
        border: .all(width: 1.4, color: Colors.grey.shade300),
        borderRadius: .circular(12),
      ),
      child: Components.networkImage(url: imageUrl),
    );
  }
}
