# Foursquare OAuth for Flutter
This is a Flutter plugin for Foursquare OAuth authentication.

## Getting Started
Add this git as a dependency in `pubspec.yaml` of your Flutter project.
```yaml
dependencies:
  foursquare_oauth:
    git: git://github.com/matthewhuie/foursquare-oauth-flutter.git
```

Import and implement the package into your project.
```dart
import 'package:foursquare_oauth/foursquare_oauth.dart';

...

Future<void> authenticate() async {
  String accessToken;
  try {
    accessToken = await FoursquareOAuth.authenticate(
      'FOURSQUARE_CLIENT_ID',
      'FOURSQUARE_CLIENT_SECRET');
  } on PlatformException {
    setState(() {
      _message = 'Error!';
    });
  }
  // Do something with accessToken
}
```

## TODO
- [x] Base Flutter project
- [x] Basic Android implementation
- [ ] Basic iOS implementation
- [x] Basic example Flutter app
- [ ] Deeper Android/iOS implementation
- [ ] More documentation

## Links
- https://enterprise.foursquare.com/products/places
- https://developer.foursquare.com/places-api
