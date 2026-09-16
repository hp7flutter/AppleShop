import 'package:apple_shop_ir/core/configs/constants/colours.dart';
import 'package:apple_shop_ir/presentation/components/sliver_appbar.dart';
import 'package:apple_shop_ir/presentation/screens/profile/widgets/squircle.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.lightGrey,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBarWidget(title: 'حساب کاربری'),
            const SliverPadding(
              padding: .only(top: 20, bottom: 40),
              sliver: SliverToBoxAdapter(
                child: Column(
                  spacing: 8,
                  children: [
                    Row(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .start,
                      spacing: 8,
                      children: [
                        Text(
                          'مهدی حسن‌پور',
                          style: TextStyle(
                            fontFamily: 'SB',
                            fontSize: 16,
                            color: Color(0xff666666),
                          ),
                        ),
                        Icon(
                          Iconsax.user_tick,
                          size: 20,
                          color: Colours.darkBlue,
                        ),
                      ],
                    ),
                    Text(
                      '09123456789',
                      style: TextStyle(
                        fontFamily: 'SM',
                        fontSize: 14,
                        color: Colours.darkGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: squircleItemsIcons.length,
                (context, index) {
                  if (index == 0) {
                    return squircle(
                      icon: squircleItemsIcons[index],
                      title: squircleItemTitles[index],
                      paddingRight: 26,
                    );
                  } else {
                    return squircle(
                      icon: squircleItemsIcons[index],
                      title: squircleItemTitles[index],
                    );
                  }
                },
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 0,
                mainAxisSpacing: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
