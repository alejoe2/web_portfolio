
import 'boolean_setting.dart';
import 'footer.dart';
import 'spam_check.dart';

class MailSettings {
  const MailSettings({
    this.bypassManagementList,
    this.footer,
    this.sandboxMode,
    this.spamCheck,
  });

  final BooleanSetting? bypassManagementList;
  final Footer? footer;
  final BooleanSetting? sandboxMode;
  final SpamCheck? spamCheck;

  Map<String, dynamic> toJson() => {
        'bypass_list_management': bypassManagementList,
        'footer': footer,
        'sandbox_mode': sandboxMode,
        'spam_check': spamCheck,
      };
}
