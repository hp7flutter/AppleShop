import 'dart:ui';
import 'package:apple_shop_ir/common/components/components.dart';
import 'package:apple_shop_ir/core/configs/constants/colours.dart';
import 'package:apple_shop_ir/features/Auth/bloc/auth_bloc.dart';
import 'package:apple_shop_ir/features/Auth/bloc/auth_event.dart';
import 'package:apple_shop_ir/features/Auth/bloc/auth_state.dart';
import 'package:apple_shop_ir/presentation/screens/enter/widgets/imageScaleAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slide_to_act/slide_to_act.dart';

class EnterScreen extends StatelessWidget {
  EnterScreen({super.key});

  final ValueNotifier<bool> enterStatus = ValueNotifier(false);
  final ValueNotifier<bool> isUser = ValueNotifier(true);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colours.lightBlue, Colours.darkBlue],
          begin: .topCenter,
          end: .bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Column(children: [upSide(context), downSide(context)]),
          ),
        ),
      ),
    );
  }

  Widget loginBuilder(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        switch (state) {
          case AuthInitialState():
            return const Text(
              'ورود',
              style: TextStyle(color: Colors.white, fontSize: 20),
            );
          case AuthLoadingState():
            return Components.loadingIndicator();
          case AuthSuccessState():
            return Components.successAlert(state.message);
          case AuthErrorState():
            return Row(
              mainAxisAlignment: .center,
              mainAxisSize: .min,
              children: [Components.errorAlert(state.message)],
            );
        }
        return Text('وضعیت نامشخص');
      },
    );
  }

  Widget registerBuilder(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        switch (state) {
          case AuthInitialState():
            return const Text(
              'ثبت نام',
              style: TextStyle(color: Colors.white, fontSize: 20),
            );
          case AuthLoadingState():
            return Components.loadingIndicator();
          case AuthSuccessState():
            return Components.successAlert(state.message);
          case AuthErrorState():
            return Row(
              mainAxisAlignment: .center,
              mainAxisSize: .min,
              children: [Components.errorAlert(state.message)],
            );
        }
        return Text('وضعیت نامشخص');
      },
    );
  }

  Widget loginSection(BuildContext context) {
    return Column(
      mainAxisSize: .max,
      mainAxisAlignment: .start,
      crossAxisAlignment: .center,
      spacing: 20,
      children: [
        loginBuilder(context),
        Components.textField(
          title: 'نام کاربری:',
          controller: usernameController,
        ),
        Components.textField(
          title: 'رمز عبور:',
          controller: passwordController,
        ),
        enterButton('ورود', () {
          context.read<AuthBloc>().add(
            AuthLoginEvent(
              username: usernameController.text,
              password: passwordController.text,
            ),
          );
        }),
        SizedBox(height: 42),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            TextButton(
              onPressed: () {
                isUser.value = false;
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white10,
                foregroundColor: Colors.white,
              ),
              child: const Text('ثبت نام'),
            ),
            Components.textFa(
              'حساب کاربری ندارید؟',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  Widget registerSection(BuildContext context) {
    return Column(
      mainAxisSize: .max,
      mainAxisAlignment: .start,
      crossAxisAlignment: .center,
      spacing: 20,
      children: [
        registerBuilder(context),
        Components.textField(
          title: 'نام کاربری:',
          controller: usernameController,
        ),
        Components.textField(
          title: 'رمز عبور:',
          controller: passwordController,
        ),
        Components.textField(
          title: 'تکرار رمز عبور:',
          controller: passwordConfirmController,
        ),
        enterButton('ثبت نام', () {
          context.read<AuthBloc>().add(
            AuthRegisterEvent(
              username: usernameController.text,
              password: passwordController.text,
              passwordConfirm: passwordConfirmController.text,
            ),
          );
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            TextButton(
              onPressed: () {
                isUser.value = true;
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white10,
                foregroundColor: Colors.white,
              ),
              child: const Text('ورود'),
            ),
            Components.textFa(
              'حساب کاربری دارید؟',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  Widget enterSection(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder(
        valueListenable: isUser,
        builder: (context, value, cuild) {
          switch (value) {
            case true:
              return loginSection(context);
            case false:
              return registerSection(context);
          }
        },
      ),
    );
  }

  Widget enterButton(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.6, color: Colors.white60),
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colours.darkBlue.withValues(alpha: 0.9),
              Colours.lightBlue.withValues(alpha: 0.9),
            ],
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 8,
              spreadRadius: -2,
              color: Colors.white,
            ),
          ],
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  Future buttomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (context) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.55,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: .topCenter,
                  end: .bottomCenter,
                  colors: [Colors.white10, Colours.darkBlue],
                ),
              ),
              child: enterSection(context),
            ),
          ),
        );
      },
    );
  }

  Widget downSide(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          ImageScaleAnimation(
            image: 'vectors/stars_pattern.png',
            seconds: 4,
            begin: 1,
            end: 2,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'اوج هیـجـان \n با خرید محصولات \n !اپل',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontFamily: 'SM',
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SlideAction(
                  borderRadius: 20,
                  innerColor: Colors.blue,
                  outerColor: Colours.lightGrey,
                  text: '!بزن بریم',
                  textStyle: const TextStyle(
                    fontFamily: 'SM',
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                  elevation: 2,
                  sliderRotate: true,
                  submittedIcon: const Icon(
                    Icons.apple,
                    size: 32,
                    color: Colors.blue,
                  ),
                  onSubmit: () {
                    return buttomSheet(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget upSide(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: ImageScaleAnimation(
              image: 'vectors/splash_circles_effect.png',
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.155,
            left: 0,
            bottom: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                spacing: 8,
                children: [
                  Components.assetImage(image: 'vectors/apple_logo.png'),
                  Components.assetImage(image: 'vectors/apple_shop.png'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
