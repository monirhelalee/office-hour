import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_hour/app/view/style/textstyles.dart';
import 'package:office_hour/app/view/theme/theme_cubit.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.onTap,
    required this.label,
    required this.iconPath,
    this.onlyIcon = false,
    super.key,
  });

  factory SocialButton.google({
    required VoidCallback onTap,
    bool onlyIcon = false,
  }) {
    return SocialButton(
      onTap: onTap,
      label: 'Sign in with Google',
      iconPath: 'assets/svg/ic_google.svg',
      onlyIcon: onlyIcon,
    );
  }
  factory SocialButton.apple({
    required VoidCallback onTap,
    bool onlyIcon = false,
  }) {
    return SocialButton(
      onTap: onTap,
      label: 'Sign in with Apple',
      iconPath: 'assets/svg/ic_google.svg',
      onlyIcon: onlyIcon,
    );
  }
  factory SocialButton.email({
    required VoidCallback onTap,
    bool onlyIcon = false,
  }) {
    return SocialButton(
      onTap: onTap,
      label: 'Sign in with Email',
      iconPath: 'assets/svg/ic_google.svg',
      onlyIcon: onlyIcon,
    );
  }

  final VoidCallback onTap;
  final String label;
  final String iconPath;
  final bool onlyIcon;

  @override
  Widget build(BuildContext context) {
    if (onlyIcon) {
      return IconButton(
        onPressed: onTap,
        icon: SvgPicture.asset(
          height: 24,
          width: 24,
          iconPath,
        ),
        style: FilledButton.styleFrom(
          backgroundColor: context.colors.surface200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );
    }
    return OutlinedButton.icon(
      onPressed: onTap,
      label: Text(
        label,
        style: TextStyles.titleLarge.copyWith(
          color: context.colors.secondary2nd,
        ),
      ),
      style: FilledButton.styleFrom(
        side: BorderSide(
          color: context.colors.surface200,
        ),
      ),
      icon: SvgPicture.asset(
        height: 24,
        width: 24,
        iconPath,
      ),
    );
  }
}
