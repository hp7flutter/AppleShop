import 'package:apple_shop_ir/common/utility/extensions.dart';
import 'package:apple_shop_ir/core/configs/constants/colours.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Components {
  static Widget assetImage({
    String? image,
    double? width,
    double? height,
    double radius = 0,
    BoxFit? fit,
    Alignment alignment = .center,
  }) {
    return ClipRRect(
      borderRadius: .circular(radius),
      child: Image.asset(
        width: width,
        height: height,
        fit: fit,
        'lib/core/assets/images/$image',
      ),
    );
  }

  static Widget loadingIndicator() {
    return Center(
      child: SizedBox(
        width: 32,
        height: 32,
        child: CircularProgressIndicator(color: Colours.darkBlue),
      ),
    );
  }

  static Widget networkImage({
    required String url,
    double? width,
    double? height,
    double radius = 0,
    BoxFit? fit,
    Alignment alignment = .center,
  }) {
    return ClipRRect(
      borderRadius: .circular(radius),
      child: CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        placeholder: (context, url) => Components.loadingIndicator(),
        errorWidget: (context, url, error) =>
            Icon(Icons.broken_image_outlined, color: Colours.darkGrey),
      ),
    );
  }

  static Widget textFa(
    String? text, {
    TextDirection textDirection = .rtl,
    TextAlign textAlign = .center,
    TextStyle? style,
  }) {
    return Directionality(
      textDirection: .rtl,
      child: Text(text!.toPersianFormat(), textAlign: textAlign, style: style),
    );
  }

  static Widget successAlert(String notification) {
    return Container(
      width: 200,
      margin: .symmetric(horizontal: 20),
      padding: .symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        // color: Colors.black12,
        color: Colors.green.withValues(alpha: 0.2),
        borderRadius: .circular(12),
      ),
      child: Row(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        spacing: 8,
        children: [
          Directionality(
            textDirection: .rtl,
            child: Text(
              notification,
              textAlign: .center,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Icon(Icons.check_rounded, color: Colors.green),
        ],
      ),
    );
  }

  static Widget errorAlert(String notification) {
    return Container(
      width: 200,
      margin: .symmetric(horizontal: 20),
      padding: .symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        // color: Colors.black12,
        color: Colors.red.withValues(alpha: 0.2),
        borderRadius: .circular(12),
      ),
      child: Row(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        spacing: 8,
        children: [
          Directionality(
            textDirection: .rtl,
            child: Text(
              notification,
              textAlign: .center,
              style: TextStyle(color: Colors.black54),
            ),
          ),
          Icon(Icons.info_outlined, color: Colors.red),
        ],
      ),
    );
  }

  static Widget textField({
    String title = '',
    TextEditingController? controller,
  }) {
    return SizedBox(
      width: 280,
      height: 42,
      child: Directionality(
        textDirection: .rtl,
        child: TextField(
          controller: controller,
          style: TextStyle(
            fontSize: 14,
            fontWeight: .w400,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.white60),
              borderRadius: .circular(12),
              gapPadding: 4,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.white),
              borderRadius: .circular(12),
              gapPadding: 4,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colours.red),
              borderRadius: .circular(12),
              gapPadding: 4,
            ),
            labelText: title,
            labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: .w300,
              fontSize: 14,
            ),
          ),
          cursorColor: Colors.white,
          cursorErrorColor: Colors.red,
        ),
      ),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
  successDialog(BuildContext context, String dialog) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: textFa(dialog, style: TextStyle(fontSize: 18)),
        behavior: .floating,
        margin: .only(
          top: 50,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).size.height - 100,
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: .circular(12)),
      ),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> errorDialg(
    BuildContext context,
    String dialog,
  ) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: textFa(dialog, style: TextStyle(fontSize: 18)),
        behavior: .floating,
        margin: .only(
          top: 50,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).size.height - 100,
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: .circular(12)),
      ),
    );
  }
}
