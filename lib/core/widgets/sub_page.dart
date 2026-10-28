import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_icons.dart';
import '../localization/app_strings.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';
import 'app_background/app_background.dart';
import 'press_scale.dart';

class SubPage extends StatelessWidget {
  const SubPage({
    super.key,
    required this.title,
    required this.children,
    this.gap = 18,
    this.bottom,
  });

  final String title;
  final List<Widget> children;
  final double gap;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    final footer = bottom;
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 9, 18, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Semantics(
                      button: true,
                      label: context.tr(AppStrings.back),
                      child: PressScale(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: 44,
                          height: 44,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.s1,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.line2),
                          ),
                          child: Transform.flip(
                            flipX:
                                Directionality.of(context) == TextDirection.ltr,
                            child: SvgPicture.asset(
                              AppIcons.back,
                              width: 22,
                              height: 22,
                              colorFilter: ColorFilter.mode(
                                AppColors.tx,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(child: Text(title, style: AppText.pageTitle)),
                  ],
                ),
                SizedBox(height: gap),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: children.length,
                    separatorBuilder: (_, _) => SizedBox(height: gap),
                    itemBuilder: (_, i) => children[i],
                  ),
                ),
                if (footer != null) ...[SizedBox(height: gap), footer],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
