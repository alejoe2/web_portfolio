
part of '../widgets.dart';

PreferredSizeWidget appbarCuston ( {
  required void Function()? onTap,
  required BuildContext context,
  required GlobalKey keyAbout, keyWork, keyContact,
  required ScrollController scrollController,
}){
    final Size size = MediaQuery.of(context).size;
    return AppBar(
      
      backgroundColor: PColors.black.withOpacity(0.5),
      leading: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            'LE', 
            style: GoogleFonts.caveat( fontSize: 30, color: PColors.greenSec)
          ),
        ),
      ),
      actions: (size.width < 650 )
        ? [
            Builder(
              builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              ),
            ),
          ]
        : [
          ListMainMenu(
            keyAbout: keyAbout, 
            keyWork: keyWork,
            keyContact: keyContact,
            scrollController: scrollController,
          )
        ],
      );
  }

