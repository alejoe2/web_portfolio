part of '../pages.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final tServices = Provider.of<ThemeServices>(context);

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: size.height, minWidth: 700),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width * 0.70,
            child: Text(
              AppLocalizations.instance.text( key: "AboutMe", value:'title'),
              style: GoogleFonts.ibmPlexMono( color: tServices.isLight ? PColors.greenSec : PColors.blue, fontSize: 20)
            ),
          ),
          Container(
            width: size.width * 0.50,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              AppLocalizations.instance.text( key: "AboutMe", value:'infoPreAboutMe'),
              textAlign: TextAlign.center,
              style: GoogleFonts.cabin(fontSize: 20, color: tServices.isLight ? PColors.white : PColors.black)
            ),
          ),
          SizedBox(
            width: size.width * 0.70,
            child: (size.width > 750)
            ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: infoAboutMe(tServices)
                ),
                Expanded(
                  child: mySkills(size, tServices)
                ),
              ],
            )
            : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                infoAboutMe(tServices),
                mySkills(size, tServices),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget mySkills(Size size, ThemeServices tServices) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              AppLocalizations.instance.text( key: "AboutMe", value:'titleSkills'),
              textAlign: TextAlign.center,
              style: GoogleFonts.cabin(fontSize: 30, color: tServices.isLight ? PColors.white : PColors.blue, fontWeight: FontWeight.bold)
            ),
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              tagSkills(text: 'HTML'),
              tagSkills(text: 'Flutter'),
              tagSkills(text: 'Dart'),
              tagSkills(text: 'Nest'),
              tagSkills(text: 'C'),
              tagSkills(text: 'GIT'),
              tagSkills(text: 'GitHub'),
            ],
          ),
        ],
      ),
    );
  }

  Widget infoAboutMe(ThemeServices tServices) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          textAbout(
            AppLocalizations.instance.text( key: "AboutMe", value:'infoAboutMe'),
            tServices
          ),
        ],
      ),
    );
  }

  Padding textAbout(String text, ThemeServices tServices) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        text,
        style: GoogleFonts.cabin( fontSize: 16, color: tServices.isLight ? PColors.white : PColors.black)
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
              style: GoogleFonts.cabin(fontSize: 18, color:  PColors.black, fontWeight: FontWeight.bold)
            ),
          )
        );
  }
}