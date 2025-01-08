import 'package:flutter/material.dart';
import 'package:solid_project/theme/app_colors.dart';
import 'solid_app_bar.dart';

class SolidScaffold extends StatelessWidget {
  const SolidScaffold({
    super.key,
    this.innerKey,
    this.appBar,
    this.body,
    this.drawer,
    this.drawerEnableOpenDragGesture,
    this.onDrawerChanged,
    this.backgroundColor,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.floatingActionButtonLocation,
    this.hideWorkOrderTimer = false,
    this.removeDeviceBottomPadding = false,
    this.showAppBar = true,
    this.solidBackgroundColor = false,
    this.appBarTopPadding = 0.0,
  });

  final Key? innerKey;
  final Widget? appBar;
  final Widget? body;
  final Widget? drawer;
  final bool? drawerEnableOpenDragGesture;
  final void Function(bool)? onDrawerChanged;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool hideWorkOrderTimer;
  final bool removeDeviceBottomPadding;
  final bool showAppBar;
  final bool solidBackgroundColor;
  final double appBarTopPadding;

  SolidScaffold copyWith({final Widget? body, final double? appBarTopPadding}) {
    return SolidScaffold(
      innerKey: innerKey,
      appBar: appBar,
      body: body,
      drawer: drawer,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
      onDrawerChanged: onDrawerChanged,
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButtonLocation: floatingActionButtonLocation,
      hideWorkOrderTimer: hideWorkOrderTimer,
      removeDeviceBottomPadding: removeDeviceBottomPadding,
      showAppBar: showAppBar,
      solidBackgroundColor: solidBackgroundColor,
      appBarTopPadding: appBarTopPadding ?? this.appBarTopPadding,
    );
  }

  MediaQueryData _mediaQueryData(BuildContext context) {
    final data = MediaQuery.of(context).removePadding(
      removeTop: appBar != null,
    );

    return data;
  }

  double _getPaddingBottom({required BuildContext context}) {
    var deviceBottomPadding = MediaQuery.of(context).padding.bottom;
    if (deviceBottomPadding == 0) {
      deviceBottomPadding = 8;
    }

    return deviceBottomPadding;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: drawer == null,
      child: Scaffold(
        key: innerKey,
        body: Stack(
          children: [
            solidBackgroundColor
                ? Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        transform: GradientRotation(7),
                        colors: [AppColors.bluePrimary, AppColors.greenOs],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  )
                : Container(
                    color: Colors.white,
                  ),
            Column(
              children: [
                if (!showAppBar)
                  SizedBox(
                    height: SolidAppBar.height,
                  )
                else if (appBar != null)
                  Padding(
                    padding: EdgeInsets.only(top: appBarTopPadding),
                    child: appBar!,
                  ),
                if (body != null)
                  MediaQuery(
                    data: _mediaQueryData(context),
                    child: Expanded(
                      child: GestureDetector(
                        child: body,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                  ),
                if (removeDeviceBottomPadding)
                  SizedBox(
                    height: _getPaddingBottom(
                      context: context,
                    ),
                    width: double.infinity,
                  ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: floatingActionButtonLocation,
        floatingActionButton: floatingActionButton,
        drawer: drawer,
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture ?? true,
        onDrawerChanged: onDrawerChanged,
        extendBody: true,
        bottomNavigationBar: bottomNavigationBar != null
            ? SafeArea(
                left: false,
                right: false,
                top: false,
                child: bottomNavigationBar!,
              )
            : null,
      ),
    );
  }
}
