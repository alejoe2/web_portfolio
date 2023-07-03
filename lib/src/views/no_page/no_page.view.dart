part of'./../views.dart';

class NoPageFoundView extends StatelessWidget {

  const NoPageFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppLocalizations.instance.text(key: 'noPage', value: 'noPage'),
        style: GoogleFonts.montserratAlternates(
          fontSize: 50,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}