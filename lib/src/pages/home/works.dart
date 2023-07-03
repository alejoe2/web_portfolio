part of '../pages.dart';

class Work extends StatelessWidget {
  const Work({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tServices = Provider.of<ThemeServices>(context);
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: size.height, minWidth: 700),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.instance.text( key: "Works", value:'title'),
            textAlign: TextAlign.left,
            style: GoogleFonts.ibmPlexMono( color: tServices.isLight ? PColors.greenSec : PColors.blue, fontSize: 20)
          ),
          Container(
            width: size.width * 0.70,
            margin: const EdgeInsets.symmetric(vertical: 50),
            child: (size.width > 750)
            ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: listScreenShootMovil(context),
                  ),
                ),
                Expanded(
                  child: infoAppMovies(tServices)
                ),
              ],
            )
            : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                infoAppMovies(tServices),
                Row(
                  children: listScreenShootMovil(context),
                ),
              ],
            ),
          ),

          Container(
            width: size.width * 0.70,
            margin: const EdgeInsets.symmetric(vertical: 50),
            child: (size.width > 750)
            ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: MarcoPortatil(url: [
                    'https://raw.githubusercontent.com/alejoe2/fl_web_admin_dashboard/master/screenshots/pantalla_1.png',
                    'https://raw.githubusercontent.com/alejoe2/fl_web_admin_dashboard/master/screenshots/pantalla_2.png',
                  ]),
                ),
                Expanded(
                  child: infoWebAppDashboard(tServices)
                ),
              ],
            )
            :Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                infoWebAppDashboard(tServices),
                const MarcoPortatil(url: [
                  'https://raw.githubusercontent.com/alejoe2/fl_web_admin_dashboard/master/screenshots/pantalla_1.png',
                  'https://raw.githubusercontent.com/alejoe2/fl_web_admin_dashboard/master/screenshots/pantalla_2.png',
                ]),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget infoWebAppDashboard(ThemeServices tServices) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              AppLocalizations.instance.text( key: "Works", value:'titleWebDash'),
              style: GoogleFonts.ibmPlexMono( color: tServices.isLight ? PColors.greenSec : PColors.blue, fontSize: 16)
            ),
          ),
          Text(
            AppLocalizations.instance.text( key: "Works", value:'infoWebDash'),
            style: GoogleFonts.cabin( fontSize: 16, color: tServices.isLight ? PColors.white : PColors.black)
          ),
          const SizedBox(height: 10,),
          CustonButton(
            title: AppLocalizations.instance.text( key: "General", value:'goToGitHub'),
            onPressed: () async {
              await launchUrl(Uri.parse('https://github.com/alejoe2/fl_web_admin_dashboard'));
            },
          ),
        ],
      ),
    );
  }

  Widget infoAppMovies(ThemeServices tServices) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            AppLocalizations.instance.text( key: "Works", value:'titleAppMovies'),
            style: GoogleFonts.ibmPlexMono( color: tServices.isLight ? PColors.greenSec : PColors.blue, fontSize: 16)
          ),
        ),
        Text(
          AppLocalizations.instance.text( key: "Works", value:'infoAppMovies'),
          style: GoogleFonts.cabin( fontSize: 16, color: tServices.isLight ? PColors.white : PColors.black)
        ),
        const SizedBox(height: 10,),
        CustonButton(
          title: AppLocalizations.instance.text( key: "General", value:'goToGitHub'),
          onPressed: () async {
            await launchUrl(Uri.parse('https://github.com/alejoe2/fl_app_peliculas'));
          },
        ),
      ],
    );
  }

  List<Widget> listScreenShootMovil(BuildContext context ){
    return [
      marcoMovil('https://raw.githubusercontent.com/alejoe2/fl_app_peliculas/master/Screenshots/Captura_de_pantalla_1.png', context),
      marcoMovil('https://raw.githubusercontent.com/alejoe2/fl_app_peliculas/master/Screenshots/Captura_de_pantalla_2.png', context),
    ];
  }

  Widget marcoMovil(String url, BuildContext context) {

    final size = MediaQuery.of(context).size;
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final scale = (size.width / 2) * pixelRatio / 1000;
    
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            url,
            width: size.width * (scale / 1.7), height: size.height * (scale / 1.7),
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
          Image.asset('assets/img/marco_movil.png', width: size.width * (scale / 1.6), height: size.height * (scale / 1.6),),
        ],
      ),
    );
  }

  Padding textAbout(String text) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        text,
        style: GoogleFonts.cabin( fontSize: 16, color: PColors.white)
      ),
    );
  }

  Container tagSkills({required String text}) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 80,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: PColors.greenSec,
      ),
      child: Center(
        child: Text(
          text, 
          textAlign: TextAlign.center,
          style: GoogleFonts.cabin(fontSize: 18, color: PColors.black, fontWeight: FontWeight.bold)
        ),
      )
    );
  }

  
}

class MarcoPortatil extends StatefulWidget {
  const MarcoPortatil({
    super.key,
    required this.url,
  });

  final List<String> url;

  @override
  State<MarcoPortatil> createState() => _MarcoPortatilState();
}

class _MarcoPortatilState extends State<MarcoPortatil> {
  int index = 0;
  late Timer timer;

  @override
    void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if(mounted){
        setState(() {
          index = (index + 1) % widget.url.length;
        });
      }
    });
  }

  @override
    void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          top: 12,
          child: Container(
            width: size.width * 0.335,
            color: Colors.red,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              switchInCurve: Curves.elasticInOut,
              child: Image.network(
                widget.url[index],
                fit: BoxFit.fill,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          height: size.width * 0.30,
          width: size.width * 0.50,
          child: Image.asset('assets/img/marco_portatil.png', fit: BoxFit.fill)
        ),
      ],
    );
  }
}