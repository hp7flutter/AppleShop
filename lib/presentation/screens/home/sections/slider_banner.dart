import 'dart:async';
import 'package:apple_shop_ir/common/api/api_status.dart';
import 'package:apple_shop_ir/common/components/components.dart';
import 'package:apple_shop_ir/features/Banner/bloc/banner_bloc.dart';
import 'package:apple_shop_ir/features/Banner/bloc/banner_state.dart';
import 'package:apple_shop_ir/features/Banner/model/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderBanners extends StatelessWidget {
  const SliderBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        switch (state) {
          case BannerLoadingState():
            return Components.loadingIndicator();
          case BannerErrorState():
            return Components.errorAlert(state.message);
          case BannerResponseState():
            return SliderBanner(state.response);
        }
        return Components.errorAlert(ApiStatus.noDataToShowError);
      },
    );
  }
}

class SliderBanner extends StatefulWidget {
  const SliderBanner(this.bannerList, {super.key});

  final List<BannerModel> bannerList;

  @override
  State<SliderBanner> createState() => _SliderBannerState();
}

class _SliderBannerState extends State<SliderBanner> {
  late PageController _controller;
  late Timer _timer;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.8);

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPageIndex < widget.bannerList.length - 1) {
        _currentPageIndex++;
      } else {
        _currentPageIndex = 0;
      }

      _controller.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return bannerSlider(widget.bannerList);
  }

  Widget bannerSlider(List<BannerModel> bannerList) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 148,
          child: PageView.builder(
            reverse: true,
            controller: _controller,
            itemCount: widget.bannerList.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: .symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(borderRadius: .circular(20)),
                child: ClipRRect(
                  borderRadius: .circular(20),
                  child: Components.networkImage(
                    radius: 20,
                    url: bannerList[index].thumbnail!,
                    fit: .cover,
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 12,
          child: Container(
            padding: const .symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: .circular(8),
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SmoothPageIndicator(
                controller: _controller,
                count: widget.bannerList.length,
                effect: const ExpandingDotsEffect(
                  expansionFactor: 4,
                  dotWidth: 10,
                  dotHeight: 10,
                  dotColor: Colors.white,
                  activeDotColor: Colors.blue,
                  spacing: 8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
