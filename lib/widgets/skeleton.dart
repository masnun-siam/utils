import 'dart:ui';

import 'package:flutter/material.dart';

class CustomColor {
  static const Color primaryColor = Color(0xFF9A2C92);
  static Color secondaryColor = const Color(0xFFF2E4F1);
  static Color accentColor = const Color(0xFFf8f8f8);
  static Color yellowLightColor = const Color(0xFFFDF5E6);
  static Color redDarkColor = const Color(0xFF2B0100);
  static Color redColor = const Color(0xFFD90404);
  static Color greyColor = const Color(0xFF707070);
  static Color greenColor = const Color(0xFF03A60F);
  static Color greenLightColor = const Color(0xFFE5F6E7);
  static Color blueColor = const Color(0xFF307AFF);
}

class Dimensions {
  static double defaultTextSize = 14.00;
  static double smallTextSize = 12.00;
  static double extraSmallTextSize = 10.00;
  static double largeTextSize = 16.00;
  static double extraLargeTextSize = 20.00;

  static const double defaultPaddingSize = 30.00;
  static const double marginSize = 20.00;
  static const double heightSize = 12.00;
  static const double widthSize = 10.00;
  static const double radius = 10.00;
  static const double buttonHeight = 60.00;

  static double latitude = 38.9647;
  static double longitude = 35.2233;
}

class CustomStyle {
  static var textStyle = TextStyle(
      color: CustomColor.greyColor, fontSize: Dimensions.defaultTextSize);

  static var hintTextStyle = TextStyle(
      color: Colors.grey.withOpacity(0.5),
      fontSize: Dimensions.defaultTextSize);

  static var listStyle = TextStyle(
      color: Colors.white,
      fontSize: Dimensions.defaultTextSize,
      fontWeight: FontWeight.bold);

  static var defaultStyle =
      TextStyle(color: Colors.black, fontSize: Dimensions.largeTextSize);

  static var focusBorder = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: Colors.black.withOpacity(0.1), width: 2.0),
  );

  static var focusErrorBorder = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: Colors.black.withOpacity(0.1), width: 1.0),
  );

  static var searchBox = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.black.withOpacity(0.1), width: 1.0),
  );
}

class _SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;

  /// ignore: unused_field
  static double? safeBlockHorizontal;

  /// ignore: unused_field
  static double? safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight! - _safeAreaVertical) / 100;

    blockSizeHorizontal = (screenWidth! - _safeAreaHorizontal) / 100;
    blockSizeVertical = (screenHeight! - _safeAreaVertical) / 100;
  }
}

double? _blockSize(BuildContext context) {
  return _SizeConfig.blockSizeHorizontal;
}

double? _blockSizeVertical(BuildContext context) {
  return _SizeConfig.blockSizeVertical;
}

double? screenWidth(BuildContext context) {
  _SizeConfig().init(context);
  return _SizeConfig.screenWidth;
}

double? screenHeight(BuildContext context) {
  _SizeConfig().init(context);
  return _SizeConfig.screenHeight;
}

double blockSize(BuildContext context) {
  _SizeConfig().init(context);
  double blockSize = (_blockSizeVertical(context)! + _blockSize(context)! / 2);
  return blockSize;
}

Widget verticalSpaceXSmall(BuildContext context) {
  return SizedBox(
    height: blockSize(context) * 1,
  );
}

Widget verticalSpaceSmall(BuildContext context) {
  return SizedBox(
    height: blockSize(context) * 2,
  );
}

Widget verticalSpaceMedium(BuildContext context) {
  return SizedBox(
    height: blockSize(context) * 5,
  );
}

Widget verticalSpaceLarge(BuildContext context) {
  return SizedBox(
    height: blockSize(context) * 10,
  );
}

Widget horizontalSpaceXSmall(BuildContext context) {
  return SizedBox(
    width: blockSize(context) * 1,
  );
}

Widget horizontalSpaceSmall(BuildContext context) {
  return SizedBox(
    width: blockSize(context) * 2,
  );
}

Widget horizontalSpaceMedium(BuildContext context) {
  return SizedBox(
    width: blockSize(context) * 5,
  );
}

Widget horizontalSpaceLarge(BuildContext context) {
  return SizedBox(
    width: blockSize(context) * 10,
  );
}

class Busy extends StatelessWidget {
  final String? text;

  const Busy({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0,
          ),
          child: Container(
            height: screenHeight(context),
            width: screenWidth(context),
            color: Colors.black26,
          ),
        ),
        Center(
          child: SizedBox(
            width: text != null ? 180.0 : 120.0,
            height: 120.0,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                    strokeWidth: 2.0,
                  ),
                  text != null
                      ? verticalSpaceSmall(context)
                      : const SizedBox.shrink(),
                  text != null
                      ? Text(
                          text!,
                          style: CustomStyle.hintTextStyle,
                          textAlign: TextAlign.center,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Skeleton extends StatelessWidget {
  final bool? resizeToAvoidBottomInset;
  final bool isBusy;
  final Color? backgroundColor;
  final String? appBarTitle;
  final TextStyle? appBarTitleStyle;
  final Widget body;
  final Widget? floatingActionButton;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? belowOverlayChild;
  final List<Widget>? appBarActions;
  final Widget? appBarLeading;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? appBarTitleWidget;
  final double? appbarElevation;
  final BoxConstraints? constraints;
  final bool centerTitle;
  final String? busyText;

  const Skeleton({
    Key? key,
    required this.isBusy,
    this.backgroundColor,
    this.appBarTitle,
    this.appBarTitleStyle,
    this.resizeToAvoidBottomInset,
    required this.body,
    this.floatingActionButton,
    this.appbarElevation,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.belowOverlayChild,
    this.appBarActions,
    this.appBarLeading,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.appBarTitleWidget,
    this.constraints,
    this.centerTitle = false,
    this.busyText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isBusy,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
              resizeToAvoidBottomInset: resizeToAvoidBottomInset,
              backgroundColor: backgroundColor,
              appBar: appBarTitle != null || appBarTitleWidget != null
                  ? AppBar(
                      iconTheme: IconThemeData(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      actionsIconTheme: IconThemeData(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      leading: appBarLeading,
                      actions: appBarActions,
                      elevation: appbarElevation ?? 5,
                      centerTitle: centerTitle,
                      title: appBarTitleWidget ??
                          Text(
                            appBarTitle!,
                            style: appBarTitleStyle ??
                                TextStyle(
                                  fontSize: blockSize(context) * 3,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                    )
                  : null,
              body: Container(
                constraints: constraints ??
                    const BoxConstraints(
                      maxWidth: 768.0,
                    ),
                child: body,
              ),
              floatingActionButton: floatingActionButton,
              floatingActionButtonAnimator: floatingActionButtonAnimator,
              floatingActionButtonLocation: floatingActionButtonLocation,
              drawer: drawer,
              endDrawer: endDrawer,
              bottomNavigationBar: bottomNavigationBar,
              bottomSheet: bottomSheet,
            ),
          ),
          isBusy ? Busy(text: busyText) : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
