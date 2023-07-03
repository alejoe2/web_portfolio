
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_portfolio/src/models/email/personalization.dart';
import 'package:web_portfolio/src/models/models.dart';
import 'package:web_portfolio/src/services/services.dart';

import '../helpers/helpers.dart';
import '../models/email/address.dart';
import '../models/email/content.dart';


class ContactFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ContactModel contactModel = ContactModel();
  
  validateForm() {
    if ( formKey.currentState!.validate() ) {
      return true;
    } else {
      return false;
    }

  }


  Future<StatusMail> sendRegistrationNotification() async {
    const Address toAddress = Address('echeverrialuish@hotmail.com', 'alejoe2.github.io');
    const Address fromAddress = Address("luisenano2002@gmail.com", "alejoe2.github.io");
    final Content content = Content('text/plain', 
'''\n
Name: ${contactModel.name},
E-mail: ${contactModel.email},\n
Message: ${contactModel.message}
''');
    final subject = '${contactModel.name} alejoe2.github.io';
    const personalization = Personalization([toAddress]);

    final email = Email([personalization], fromAddress, subject, content: [content]);    
    final response = await ApiServices.httpPost(path: 'https://api.sendgrid.com/v3/mail/send', data: jsonEncode(email.toJson()) );

    if (response.statusCode == 202 ){
      return StatusMail.sent;
    }else{
      return StatusMail.error;
    }

    
  }

}
