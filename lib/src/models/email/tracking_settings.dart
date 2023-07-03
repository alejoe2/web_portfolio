import 'click_tracking.dart';
import 'google_analytics.dart';
import 'open_tracking.dart';
import 'subscription_tracking.dart';

class TrackingSettings {
  const TrackingSettings({
    this.clickTracking,
    this.openTracking,
    this.subscriptionTracking,
    this.ganalytics,
  });

  final ClickTracking? clickTracking;
  final OpenTracking? openTracking;
  final SubscriptionTracking? subscriptionTracking;
  final GoogleAnalytics? ganalytics;

  Map<String, dynamic> toJson() => {
        'click_tracking': clickTracking?.toJson(),
        'open_tracking': openTracking?.toJson(),
        'subscription_tracking': subscriptionTracking?.toJson(),
        'ganalytics': ganalytics?.toJson(),
      };
}
