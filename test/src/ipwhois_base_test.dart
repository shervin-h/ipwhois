import 'package:ipwhois/ipwhois.dart';
import 'package:test/test.dart';

void main() {
  /// ***** arrange ***** ///
  final mockIpInfoModel = IpInfo(
    ip: '5.200.126.29',
    continentCode: 'AS',
    country: 'Iran',
    countryCode: 'IR',
    countryCode3: 'IRN',
    region: 'Tehran',
    regionCode: '23',
    city: 'Tehran',
    latitude: 35.7108,
    longitude: 51.4274,
    timezone: 'Asia/Tehran',
    offset: 12600,
    asn: 57218,
    organization: 'Rightel Communication Service Company PJS',
  );

  const mockJsonResponse = {
    "ip": "5.200.126.29",
    "continent_code": "AS",
    "country": "Iran",
    "country_code": "IR",
    "country_code3": "IRN",
    "region": "Tehran",
    "region_code": "23",
    "city": "Tehran",
    "latitude": 35.7108,
    "longitude": 51.4274,
    "timezone": "Asia/Tehran",
    "offset": 12600,
    "asn": 57218,
    "organization": "Rightel Communication Service Company PJS"
  };

  test(
    'should return a valid json',
    () {
      /// ***** act ***** ///
      final result = mockIpInfoModel.toJson();

      /// ***** assert ***** ///
      expect(result['ip'], mockIpInfoModel.ip);
      expect(result['city'], mockIpInfoModel.city);
      expect(result['country'], mockIpInfoModel.country);
    },
  );

  test(
    'should return a valid model from json',
    () {
      /// ***** act ***** ///
      final result = IpInfo.fromJson(mockJsonResponse);

      /// ***** assert ***** ///
      expect(result.ip, mockJsonResponse['ip']);
      expect(result.city, mockJsonResponse['city']);
      expect(result.country, mockJsonResponse['country']);
    },
  );

  test(
    'should return desired `IpInfo` model',
    () async {
      /// ***** act ***** ///
      final result = await getMyIpInfo();

      /// ***** assert ***** ///
      expect(result, isA<IpInfo?>());
    },
  );

  test(
    'should return desired `IpInfo` model or null',
    () async {
      /// ***** act ***** ///
      final result = await getMyIpInfo(version: IpVersion.v6);

      /// ***** assert ***** ///
      expect(result, isA<IpInfo?>());
    },
  );
}
