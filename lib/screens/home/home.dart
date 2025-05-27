import 'package:flutter/material.dart';
import 'package:frontend/configs/sign_in_required_redirect_query.dart';
import 'package:frontend/widgets/side_bar/side_bar.dart';
import 'package:katana_router/katana_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'home.page.dart';
part 'home.provider.dart';
part 'home.mobile.dart';
part 'home.tablet.dart';
part 'home.desktop.dart';

@PagePath("/home", redirect: [SignInRequiredRedirectQuery()])
class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @pageRouteQuery
  static const query = _$HomePageQuery();

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$HomeMobilePage(),
      tablet: (context) => _$HomeTabletPage(),
      desktop: (context) => _$HomeDesktopPage(),
    );
  }
}