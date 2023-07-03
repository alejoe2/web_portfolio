part of '../pages.dart';


class Presentation extends StatefulWidget {
  const Presentation({
    super.key,
  });

  @override
  State<Presentation> createState() => _PresentationState();
}

class _PresentationState extends State<Presentation> {
  bool isHovered = false, ready = false;
  late Image widgetImage;

  @override
  void initState() {
    super.initState();
    _init();
  }
   _init()async{
    final bytes = await rootBundle.load('assets/img/me.jpg');
    img.Image image = img.decodeJpg(bytes.buffer.asUint8List())!;
    img.Image grayscaleImage = img.colorOffset(image, green: 50);
    widgetImage = Image.memory(img.encodeJpg(grayscaleImage));
    ready = true;
    setState(() {});
   }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final tServices = Provider.of<ThemeServices>(context);

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: size.height),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Container(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: size.width * 0.60,
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(AppLocalizations.instance.text( key: "Presentation", value:'title'), style: GoogleFonts.ibmPlexMono( color: tServices.isLight ? PColors.greenSec : PColors.blue, fontSize: 16)),
            ),
            SizedBox(
              width: size.width * 0.60,
              child: AutoSizeText(
                AppLocalizations.instance.text( key: "Presentation", value:'myName'),
                maxLines: 1,
                style: GoogleFonts.caveat( fontSize: 60, color: tServices.isLight ? PColors.white : PColors.black)
                )
            ),
            SizedBox(
              width: size.width * 0.60,
              child: AutoSizeText(
                AppLocalizations.instance.text( key: "Presentation", value:'infoPre'),
                maxLines: 2,
                style: GoogleFonts.caveat( fontSize: 60, color: tServices.isLight ? PColors.white.withOpacity(0.7) : PColors.black.withOpacity(0.7) )
                )
            ),
            
            Container(
              width: size.width * 0.60,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: AutoSizeText(
                AppLocalizations.instance.text( key: "Presentation", value:'info'),
                maxLines: 4,
                style: GoogleFonts.cabin( fontSize: 25, color: tServices.isLight ? PColors.white : PColors.black)
              ),
            ),
      
            if(ready) Container(
              width: size.width * 0.60,
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 170,
                height: 220,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      bottom: isHovered ? 0 : 5,
                      right: isHovered ? 0 : 5,
                      child: Container(
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: PColors.green),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      top: isHovered ? 0 : 5,
                      left: isHovered ? 0 : 5,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          if (isHovered) 
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/img/me.jpg', width: 150, height: 200)
                            ),
                          if (!isHovered) 
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              width: 150, 
                              height: 200, 
                              child: widgetImage
                            ),
                          ),
                          MouseRegion(
                            onEnter: (_) => setState(() => isHovered = true),
                            onExit: (_) => setState(() => isHovered = false),
                            child: Container(
                              width: 150,
                              height: 200,
                              color: Colors.transparent,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            ),
            
          ],
        ),
      ),
    );
  }
}