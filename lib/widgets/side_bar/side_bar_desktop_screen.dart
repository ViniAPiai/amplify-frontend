part of 'side_bar_screen.dart';

class _$SideBarDesktopScreen extends StatefulWidget {
  const _$SideBarDesktopScreen({super.key});

  @override
  createState() => _SideBarDesktopScreen();
}

class _SideBarDesktopScreen extends State<_$SideBarDesktopScreen> {
  @override
  Widget build(BuildContext context) {
    SideBarProvider provider = Provider.of<SideBarProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 64,
            height: context.mqHeight,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.fromLTRB(8, 32, 0, 16),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 32,
              children: [
                SideBarItem(name: '1', provider: provider, icon: FontAwesomeIcons.bars,),
                SideBarItem(name: '2', provider: provider, icon: FontAwesomeIcons.bookMedical,),
                SideBarItem(name: '3', provider: provider, icon: FontAwesomeIcons.tooth,),
                Expanded(child: Container()),
                CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Center(
                    child: Text("V"),
                  ),
                ),
                IconButton(
                  onPressed: () {
                  },
                  icon: Icon(FontAwesomeIcons.signOut),
                  iconSize: 32,
                  color: Colors.white,
                  style: IconButton.styleFrom(
                      fixedSize: Size(100, 24),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(12), right: Radius.circular(-12)))),
                )
              ],
            )
          ),
          Expanded(
              child: Center(
            child: Text('Olá'),
          ))
        ],
      ),
    );
  }
}
