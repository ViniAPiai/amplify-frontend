part of 'home.dart';

class _$HomeTabletPage extends StatelessWidget {
  const _$HomeTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SideBar(
        appBar: PreferredSize(
          preferredSize: Size(context.width, 100),
          child: Container(
            color: AppColors.gray,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 16,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: IconButton(
                        onPressed: () => context.read<SideBarBloc>().add(OpenSideBar()),
                        icon: Icon(
                          Icons.menu,
                          color: AppColors.grayBlack,
                          size: 32,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Icon(
                      Icons.calendar_month,
                      color: context.primaryColor,
                      size: 32,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      "Home",
                      style: GoogleFonts.inter(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),
        ),
        child: SizedBox()
    );
  }
}