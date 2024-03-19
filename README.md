![img](https://github.com/shervin-h/ipwhois/blob/main/assets/ipwhois.jpg)

# ipwhois

By using `ipwhois` package, you can get information about the IP of your Internet connection.
such as IP address v4 and v6, city name, country name, region, latitude and longitude, continent code, time zone, Internet provider organization ....

🌐 🛜 💻 📱

## Install Package
add the following line to your `pubspec.yaml` under `dependencies`:

```yaml
dependencies:
  ipwhois: ^1.0.0
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

first import it
```dart
import 'package:ipwhois/ipwhois.dart';
```

## Usage

now in your dart code, you can use:

```dart
final resultV4 = await getMyIpInfo();
print(resultV4); // ip: 5.200.119.128, continentCode: AS, country: Iran, countryCode: IR, countryCode3: IRN, region: Tehran, regionCode: 23, city: Tehran, latitude: 35.7108, longitude: 51.4274, timezone: Asia/Tehran, offset: 12600, asn: 57218, organization: Rightel Communication Service Company PJS

final resultV6 = await getMyIpInfo(version: IpVersion.v6);
print(resultV6); // null
```

### by Shervin Hassanzadeh

- shervin.hz07@gmail.com
- [linked in](https://www.linkedin.com/in/shervin-hassanzadeh)
