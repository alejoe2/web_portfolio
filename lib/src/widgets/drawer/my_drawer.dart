part of '../widgets.dart';

class MyDrawer extends StatefulWidget {

  final ScrollController scrollController;
  final GlobalKey keyAbout, keyWork, keyContact;

  const MyDrawer({
    super.key, 
    required this.scrollController, 
    required this.keyAbout, 
    required this.keyWork, 
    required this.keyContact,
  }); 

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
    @override
    Widget build(BuildContext context) {
      final tServices = Provider.of<ThemeServices>(context);

        return Drawer(
          backgroundColor: tServices.isLight ? PColors.black : PColors.black,
          child: Column(
            children: [
              ListMainMenu(
                keyAbout: widget.keyAbout, 
                keyWork: widget.keyWork,
                keyContact: widget.keyContact,
                scrollController: widget.scrollController,
              ),
            ],
          )
        );
    }
}

class ListMainMenu extends StatefulWidget {
  final ScrollController scrollController;
  final GlobalKey keyAbout, keyWork, keyContact;
  
  const ListMainMenu({
    super.key, 
    required this.scrollController, 
    required this.keyAbout, 
    required this.keyWork, 
    required this.keyContact
  });

  @override
  State<ListMainMenu> createState() => _ListMainMenuState();
}

class _ListMainMenuState extends State<ListMainMenu> {
  @override
  Widget build(BuildContext context) {
    final tServices = Provider.of<ThemeServices>(context);
    final Size size = MediaQuery.of(context).size;
    final globalServices = Provider.of<GlobalServices>(context);

    if (size.width >= 650 && Scaffold.of(context).isEndDrawerOpen){
      Scaffold.of(context).closeEndDrawer();
      
    }

    return (size.width < 650 )
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center, 
            children: listMenu(tServices, globalServices) 
          )
        : Row( children: listMenu(tServices, globalServices) ) ;
  }

  List<Widget> listMenu(ThemeServices tServices, GlobalServices globalServices ) {


    return [
      LinkMenu(
        text: AppLocalizations.instance.text( key: "AboutMe", value:'title'), 
        scrollController: widget.scrollController, 
        keyTo: widget.keyAbout 
      ),
      LinkMenu( 
        text: AppLocalizations.instance.text( key: "Works", value:'title'), 
        scrollController: widget.scrollController,  
        keyTo: widget.keyWork 
      ),
      LinkMenu( 
        text: AppLocalizations.instance.text( key: "Contact", value:'title'), 
        scrollController: widget.scrollController,  
        keyTo: widget.keyContact
      ),
      if (tServices.isLight) 
        IconButtonCustom(
          onTap: () => tServices.setTheme(data: ThemeSelect.dark),
          icon:'ic_sum.svg', 
          height: 20, 
          width: 20,
        ),
      if (!tServices.isLight) 
        IconButtonCustom(
          onTap: () => tServices.setTheme(data: ThemeSelect.light),
          icon:'ic_moon.svg', 
          height: 20, 
          width: 20
      ),
      IconButtonCustom(
        onTap: () async {
          if (globalServices.locale == const Locale('es', "ES"))
          {
            globalServices.setlocale( const Locale('en', "EN"));
          }else{
            globalServices.setlocale( const Locale('es', "ES"));
          }
          setState(() {}); 
          await Future.delayed( const Duration( milliseconds: 200 ) );
          tServices.setTheme(data: tServices.theme);
        },
        themeColor: false,
        icon: globalServices.locale == const Locale('es', "ES") ? 'ic_esp.svg' : 'ic_eng.svg', 
        height: 20, 
        width: 20
      ),
      const SizedBox(width: 20),
    ];
  }
}

class LinkMenu extends StatefulWidget {
  final ScrollController scrollController;
  final GlobalKey keyTo;
  final String text;
  const LinkMenu({
    super.key, 
    required this.text, 
    required this.scrollController, 
    required this.keyTo,
  });

  @override
  State<LinkMenu> createState() => _LinkMenuState();
}

class _LinkMenuState extends State<LinkMenu> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.text, 
              style: GoogleFonts.ibmPlexMono( color: isHovered ? PColors.greenSec : PColors.white)
            ),
          ),
          onTap: () async {
            if (Scaffold.of(context).isDrawerOpen) { 
              Scaffold.of(context).closeEndDrawer();
            }
            await Scrollable.ensureVisible(
              widget.keyTo.currentContext!,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          },
      
        ),
      )
    );
  }
}