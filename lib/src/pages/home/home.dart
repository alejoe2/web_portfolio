part of '../pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ready = false;
  
  @override
  Widget build(BuildContext context) {
    
    final tServices = Provider.of<ThemeServices>(context);
    final ScrollController scrollController = ScrollController();
    final GlobalKey keyAbout = GlobalKey();
    final GlobalKey keyWork = GlobalKey();
    final GlobalKey keyContact = GlobalKey();

    return Stack(
      children: [
        Scaffold(
          endDrawer: MyDrawer(
            keyAbout: keyAbout, 
            keyWork: keyWork, 
            keyContact: keyContact,
            scrollController: scrollController,
          ),
          appBar: appbarCuston( 
            onTap: () => setState(() { ready = false; }),
            context: context,
            keyAbout: keyAbout, 
            keyWork: keyWork,
            keyContact: keyContact,
            scrollController: scrollController,
          ),
          backgroundColor: (tServices.isLight)? PColors.black : PColors.white,
          body: Stack(
            children: [
              PrincipalBody(
                scrollController: scrollController,
                keyAbout: keyAbout,
                keyWork: keyWork,
                keyContact: keyContact,
              ),
              const Positioned.fill(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconsSocials()
                ),
              ),
            ],
          ),
        ),
        if (!ready) 
          SplashPage(
            complete: () => setState(() { ready = true; }),
        )
      ],
    );
  }
}

class PrincipalBody extends StatelessWidget {
  final ScrollController scrollController;
  final GlobalKey keyAbout, keyWork, keyContact;
  const PrincipalBody({
    super.key, 
    required this.scrollController, 
    required this.keyAbout, 
    required this.keyWork, 
    required this.keyContact,
  });

  @override
  Widget build(BuildContext context) {
  
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Presentation(),
          AboutMe(key: keyAbout),
          Work(key: keyWork),
          Contact(key: keyContact),
        ],
      )
    );
  }
}

class IconsSocials extends StatelessWidget {
  const IconsSocials({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children:  [
          IconButtonCustom(
            onTap: () async => await launchUrl(Uri.parse('https://github.com/alejoe2/')),
            icon: 'ic_github.svg'
            ),
          IconButtonCustom(
            onTap: () async => await launchUrl(Uri.parse('https://www.linkedin.com/in/luis-alejandro-echeverria-hernandez-5669ba9a/')),
            icon: 'ic_linkedin.svg'
            ),
        ],
      ),
    );
  }
}

