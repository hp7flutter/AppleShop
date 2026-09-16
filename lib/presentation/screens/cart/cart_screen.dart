import 'package:apple_shop_ir/common/components/components.dart';
import 'package:apple_shop_ir/core/configs/constants/colours.dart';
import 'package:apple_shop_ir/presentation/components/sliver_appbar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.lightGrey,
      floatingActionButtonLocation: .centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: SizedBox(
          width: 240,
          height: 52,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colours.green,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              'ادامه فرآیند خرید',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBarWidget(title: 'سبد خرید'),
            SliverToBoxAdapter(child: cartCard()),
          ],
        ),
      ),
    );
  }

  Widget cartCard() {
    return Container(
      width: 320,
      height: 200,
      margin: .all(12),
      padding: .all(8),
      decoration: BoxDecoration(
        color: Colours.lightGrey,
        borderRadius: .circular(14),
        boxShadow: [
          BoxShadow(
            offset: Offset(-3, -3),
            blurRadius: 6,
            spreadRadius: -2,
            color: Colors.white,
          ),
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 8,
            spreadRadius: -8,
            color: Colours.darkGrey,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: .spaceBetween,
        children: [
          Container(
            width: .infinity,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: .circular(8),
            ),
            child: Center(child: Components.textFa('آیفون 13 پرومکس')),
          ),
          Directionality(
            textDirection: .rtl,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: .circular(12),
                  child: Components.assetImage(
                    image: 'vectors/app_icon.png',
                    width: 88,
                    height: 88,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: .infinity,
            height: 40,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey.shade300),
              ),
            ),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              crossAxisAlignment: .end,
              children: [
                Row(
                  spacing: 4,
                  children: [
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: .zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: .circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: const .only(bottom: 8),
                          child: Icon(
                            Icons.minimize_rounded,
                            color: Colours.darkGrey,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: .zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: .circular(8),
                          ),
                        ),
                        child: Icon(
                          Icons.add_rounded,
                          color: Colours.darkGrey,
                          size: 24,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const .symmetric(horizontal: 12),
                      child: Row(
                        spacing: 12,
                        children: [
                          Components.textFa(
                            '1',
                            style: TextStyle(fontSize: 18),
                          ),
                          Components.textFa(
                            'تعداد:',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: [
                    Components.textFa(
                      'تومان',
                      style: TextStyle(fontSize: 14, height: 2),
                    ),
                    Components.textFa(
                      '123,111,200',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget continueToBuyButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colours.green,
        foregroundColor: Colors.white,
      ),
      child: Row(
        spacing: 4,
        children: [Components.textFa('ادامه فرآیند خرید'), Icon(Icons.check)],
      ),
    );
  }
}
