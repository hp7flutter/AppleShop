import 'package:apple_shop_ir/core/configs/constants/colours.dart';
import 'package:flutter/material.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    super.key,
    this.title = '',
    this.showBackButton = false,
    this.trailing,
  });

  final String title;
  final Widget? trailing;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return sliverAppBar(context);
  }

  Widget sliverAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.transparent,
      toolbarHeight: 72,
      bottom: appBar(context),
    );
  }

  PreferredSize appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: ClipRRect(
        child: BackdropFilter(
          filter: .blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            height: 72,
            padding: .symmetric(vertical: 4),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: .topCenter,
                end: .bottomCenter,
                colors: [Colors.white10, Colors.transparent],
              ),
            ),
            child: Column(
              mainAxisAlignment: .end,
              mainAxisSize: .min,
              children: [
                Container(
                  width: double.infinity,
                  height: 48,
                  margin: .symmetric(horizontal: 28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: .all(.circular(16)),
                  ),
                  padding: .symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Icon(Icons.apple, color: Colours.darkBlue, size: 32),
                      Text(title),
                      showBackButton == true
                          ? backButton(context)
                          : trailing ?? SizedBox(),
                      // backButton(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget backButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.arrow_forward_ios_outlined,
        size: 20,
        color: Colours.darkBlue,
      ),
    );
  }
}
