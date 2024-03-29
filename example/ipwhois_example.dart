import 'package:ipwhois/ipwhois.dart';

void main() async {
  final resultV4 = await getMyIpInfo();
  final resultV6 = await getMyIpInfo(version: IpVersion.v6);

  print(resultV4); // ip: 5.200.119.128, continentCode: AS, country: Iran, countryCode: IR, countryCode3: IRN, region: Tehran, regionCode: 23, city: Tehran, latitude: 35.7108, longitude: 51.4274, timezone: Asia/Tehran, offset: 12600, asn: 57218, organization: Rightel Communication Service Company PJS
  print(resultV6); // null

  final myIpV4 = await getMyIp();
  print(myIpV4); // 77.73.69.217

  final myIpV6 = await getMyIp(version: IpVersion.v6);
  print(myIpV6); // 2a00:1838:37:21e::d3bc
}
