import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AppBarW extends StatelessWidget implements PreferredSizeWidget {
  const AppBarW({
    super.key,
    this.titel,
    this.leadingiIcon,
    this.actions,
    this.leadingOnPressed,
    this.showBackArrow = false,
    required this.backgroundColor,
    this.coloricon = Colors.black,
  });

  final Widget? titel;
  final IconData? leadingiIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final bool showBackArrow;
  final backgroundColor;
  final coloricon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        // leading: leadingiIcon,
        // leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: const Icon(Icons.menu),
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //     );
        //   },
        // ),
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Iconsax.arrow_left_3),
                //arrow_square_left
                color: coloricon,
              )
            : leadingiIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed, icon: Icon(leadingiIcon))
                : null,
        title: titel,
        actions: actions,
        // [
        //   Builder(builder: (BuildContext context) {
        //     return IconButton(
        //       icon: const Icon(Iconsax.notification),
        //       onPressed: () {},
        //     );
        //   })
        // ],
      ),
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(20);
  }
  // Size get preferredSize => const Size.fromHeight(65);
}
