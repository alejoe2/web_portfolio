part of '../pages.dart';

class Contact extends StatefulWidget {
  const Contact({
    super.key,
  });

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  StatusMail sendMail = StatusMail.none;

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: ( _ ) => ContactFormProvider(),
      child: Builder(builder: (context) {
        
        return Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 400, minWidth: 200, maxWidth: 500),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: const EmailWidget() /* Stack(
            children: [
              Form(
                key: contactFormProvider.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.instance.text( key: "Contact", value:'title'), 
                      style: GoogleFonts.ibmPlexMono( color: tServices.isLight ? PColors.greenSec : PColors.blue, fontSize: 20)
                    ),
                    TextFormField(
                      onChanged: ( value ) => contactFormProvider.contactModel.name = value,
                      validator: ( value ) {
                        if ( value == null || value.isEmpty ) return '';
                        if ( value.length < 3 ) return '';
                        return null;
                      },
                      style: TextStyle( color: tServices.isLight ? PColors.greenSec : PColors.blue ),
                      cursorColor: tServices.isLight ? PColors.greenTer : PColors.black,
                      decoration: customIputDecoUnderLine(tServices, AppLocalizations.instance.text( key: "Contact", value:'name'), Icons.person),
                    ),
    
                    const SizedBox( height: 20 ),

                    TextFormField(
                      onChanged: ( value ) => contactFormProvider.contactModel.email = value,
                      validator: ( value ) {
                        if ( value == null || value.isEmpty ) return '';
                        if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(value))return '';
                        return null;
                      },
                      style: TextStyle( color: tServices.isLight ? PColors.greenSec : PColors.blue ),
                      cursorColor: tServices.isLight ? PColors.greenTer : PColors.black,
                      decoration: customIputDecoUnderLine(tServices, AppLocalizations.instance.text( key: "Contact", value:'email'),Icons.email),
                    ),

                    const SizedBox( height: 20 ),

                    TextFormField(
                      maxLines: 10,
                      minLines: 10,
                      onChanged: ( value ) => contactFormProvider.contactModel.message = value,
                      validator: ( value ) {
                        if ( value == null || value.isEmpty ) return '';
                        if ( value.length < 5 ) return '';
                        return null;
                      },
                      style: TextStyle( color: tServices.isLight ? PColors.greenSec : PColors.blue ),
                      cursorColor: tServices.isLight ? PColors.greenTer : PColors.black,
                      decoration: customIputDecoOutput(tServices, AppLocalizations.instance.text( key: "Contact", value:'message'), Icons.message),
                    ),

                    const SizedBox( height: 20 ),

                    CustonButton(
                      title: AppLocalizations.instance.text( key: "General", value:'send'),
                      disdable: (sendMail == StatusMail.none)? false : true,
                      onPressed: () async {
                        final validForm = contactFormProvider.validateForm();
                        if ( !validForm ) return;
                        sendMail = StatusMail.pending;
                        setState(() {}); 
                        sendMail = await contactFormProvider.sendRegistrationNotification();
                        setState(() {});
                      },
                    ),
                    
                  ],
                ),
              ),
              if (sendMail == StatusMail.pending)
              Container(
                color: PColors.black.withOpacity(0.7),
                child: const LoadingWidget()
              ),
              if (sendMail == StatusMail.sent)
              SendOkWidget(
                complete: () {
                  sendMail = StatusMail.none;
                  setState((){});
                },
              ),
              if (sendMail == StatusMail.error)
              ErrorWidgetAnimate(
                complete: () {
                  sendMail = StatusMail.none;
                  setState((){});
                },
              ),
            ],
          ), */
        );
      }),
    );
  }

  InputDecoration customIputDecoUnderLine(ThemeServices tServices, String title,  IconData icon) {
    return InputDecoration(
      focusedBorder: underLineInput(tServices),
      border: underLineInput(tServices),
      enabledBorder: underLineInput(tServices),
      focusColor: tServices.isLight ? PColors.greenTer : PColors.black,
      iconColor: tServices.isLight ? PColors.greenTer : PColors.black,
      hintText: title,
      hintStyle: TextStyle(color: tServices.isLight ? PColors.greenSec : PColors.blue, fontSize: 14 ),
      label: Text(title, style: GoogleFonts.ibmPlexMono( color: tServices.isLight ? PColors.greenSec : PColors.blue, fontSize: 14) ,),
      icon: Icon(icon)
    );
  }

  InputDecoration customIputDecoOutput(ThemeServices tServices, String title,IconData icon) {
    return InputDecoration(
      focusedBorder: outlineBorderInput(tServices),
      border: outlineBorderInput(tServices),
      enabledBorder: outlineBorderInput(tServices),
      focusColor: tServices.isLight ? PColors.greenTer : PColors.black,
      iconColor: tServices.isLight ? PColors.greenTer : PColors.black,
      hintText: title,
      alignLabelWithHint: true,
      hintStyle: TextStyle(color: tServices.isLight ? PColors.greenSec : PColors.blue, fontSize: 14 ),
      label: Text(title, style: GoogleFonts.ibmPlexMono( color: tServices.isLight ? PColors.greenSec : PColors.blue, fontSize: 14) ,),
      icon: Icon(icon)
    );
  }

  OutlineInputBorder outlineBorderInput(ThemeServices tServices) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: tServices.isLight ? PColors.greenTer : PColors.black
      ), // Color del borde
    );
  }

  UnderlineInputBorder underLineInput(ThemeServices tServices) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: tServices.isLight ? PColors.greenTer : PColors.black
      ), // Color del borde
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