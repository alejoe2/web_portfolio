part of '../widgets.dart';

class CustonButton extends StatelessWidget {
  final String title;
  final bool disdable;
  final void Function()? onPressed;
  const CustonButton({
    super.key, 
    required this.title, 
    this.onPressed, 
    this.disdable = false,
  });

  @override
  Widget build(BuildContext context) {
    final tServices = Provider.of<ThemeServices>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: disdable? null : onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          side: BorderSide(color: tServices.isLight ? (disdable)? PColors.greenSec.withOpacity(0.4) : PColors.greenSec : (disdable)? PColors.blue.withOpacity(0.4) : PColors.blue, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(title, style: GoogleFonts.ibmPlexMono( color: tServices.isLight ? (disdable)? PColors.greenSec.withOpacity(0.4) : PColors.greenSec : (disdable)? PColors.blue.withOpacity(0.4) : PColors.blue, fontSize: 16),),
        ),
      ),
    );
  }
}