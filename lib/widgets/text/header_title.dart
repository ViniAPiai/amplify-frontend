import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:frontend/bloc/side_bar/side_bar_bloc.dart';
import 'package:frontend/bloc/side_bar/side_bar_event.dart';
import 'package:frontend/l10n/app_localizations.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/extension/utils_extension.dart';
import 'package:frontend/widgets/side_bar/side_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HeaderTitle extends StatelessWidget {
  final IconData icon;
  final String title;

  const HeaderTitle({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.isTabletOrDesktop ? 0 : 8,
      children: [
        context.isDesktop ? const SizedBox() : Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: IconButton(
              onPressed: () => context.read<SideBarBloc>().add(OpenSideBar()),
              icon: Icon(
                Icons.menu,
                color: AppColors.grayBlack,
                size: 20,
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Icon(
            icon,
            color: context.primaryColor,
            size: context.isTabletOrDesktop ? 32 : 20,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 6, left: context.isTabletOrDesktop ? 16 : 8),
          child: Text(
            title,
            style: GoogleFonts.inter(color: Colors.black, fontSize: context.isTabletOrDesktop ? 24 : 18, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
