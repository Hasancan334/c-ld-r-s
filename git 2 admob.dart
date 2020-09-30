import 'package:firebase_admob/firebase_admob.dart';

class Admobislemleri {
  static final appIdCanli = "ca-app-pub-5799565273289643~8570389501";
  static final appIdTest = FirebaseAdMob.testAppId;
  static final String baran1Canli = "ca-app-pub-5799565273289643/9563891066";

  static admobInitialize() {
    FirebaseAdMob.instance.initialize(appId: appIdTest);
  }

  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    childDirected: false,
    testDevices: <String>[], // Android emulators are considered test devices
  );

  static BannerAd buildbannerad() {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      },
    );
  }
}
