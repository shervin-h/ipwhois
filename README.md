![img](https://github.com/shervin-h/ipwhois/blob/main/assets/ipwhois.jpg?raw=true)

# ipwhois

[![pub package](https://img.shields.io/pub/v/ipwhois.svg)](https://pub.dev/packages/ipwhois)

By using `ipwhois` package, you can get information about the IP of your Internet connection.
such as IP address v4 and v6, city name, country name, region, latitude and longitude, continent code, timezone, Internet provider organization ....
  - After the answer comes and the country or city is specified, you can render different designs based on the type of country or city.
  - Changing the language of the application by identifying different IPs.

🌐 🛜 💻 📱

## Install Package
add the following line to your `pubspec.yaml` under `dependencies`:

```yaml
dependencies:
  ipwhois: ^1.1.0
```

then run:

```
dart pub get
```

or

```
flutter pub get
```

## Getting started

### Android

add this permission to your `<project root>/android/app/src/main/AndroidManifest.xml`

```xml

<uses-permission android:name="android.permission.INTERNET"/>
```

import it
```dart
import 'package:ipwhois/ipwhois.dart';
```

## Usage

now in your dart code, you can use:

```dart
final IpInfo? resultV4 = await getMyIpInfo();
print(resultV4); // ip: 5.200.119.128, continentCode: AS, country: Iran, countryCode: IR, countryCode3: IRN, region: Tehran, regionCode: 23, city: Tehran, latitude: 35.7108, longitude: 51.4274, timezone: Asia/Tehran, offset: 12600, asn: 57218, organization: Rightel Communication Service Company PJS

if (resultV4 != null) {
  print(resultV4!.ip);  // ip: 5.200.119.128
  print(resultV4.city);  // Tehran
  print(resultV4.country);  // Iran
  print(resultV4.countryCode);  // IR
  print(resultV4.latitude);  // 35.7108
  print(resultV4.longitude);  // 51.4274
  print(resultV4.continentCode);  // AS
  print(resultV4.region);  // Tehran
  print(resultV4.regionCode);   // 23
  print(resultV4.organization);  // Rightel Communication Service Company PJS
}

final resultV6 = await getMyIpInfo(version: IpVersion.v6);
print(resultV6); // null
```

you can only request to get the IP

```dart
final String? myIpV4 = await getMyIp();
print(myIpV4);  // 77.73.69.217

final String? myIpV6 = await getMyIp(version: IpVersion.v6);
print(myIpV6);  // 2a00:1838:37:21e::d3bc
```

### by Shervin Hassanzadeh

contact me at
  <br>

  <a href="https://www.linkedin.com/in/shervin-hassanzadeh/">
    <img alt="linkedin" src="https://img.shields.io/badge/linkedin-0077B5.svg?style=flat-squar&logo=linkedin&logoColor=white"/>
  </a>
  <a href="mailto:shervin.hz07@gmail.com">
    <img alt="Email" src="https://img.shields.io/badge/Email-D14836?style=flat-squar&logo=gmail&logoColor=white"/>
  </a>
  <a href="https://t.me/shervin_hz07">
    <img alt="telegram" src="https://img.shields.io/badge/Telegram-2B9FD1?style=flat-squar&logo=telegram&logoColor=white" />
  </a>
  <a href="https://github.com/shervin-h">
    <img alt="github" src="https://img.shields.io/badge/github-121011.svg?style=flat-squar&logo=github&logoColor=white"/>
  </a>
  <a href="https://stackoverflow.com/users/13066224/shervin">
    <img alt="stackoverflow" src="https://img.shields.io/badge/Stackoverflow-ef8236?style=flat-squar&logo=stackoverflow&logoColor=white" />
  </a>

  <br>
