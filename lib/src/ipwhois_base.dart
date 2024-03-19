import 'dart:convert';

import 'package:http/http.dart' as http;

/// ## [IpVersion] Enum Documentation
///
/// The `IpVersion` enum represents the Internet Protocol (IP) version.
///
/// Enum Values:
///
/// - `v4`: Represents IPv4 (Internet Protocol version 4).
/// - `v6`: Represents IPv6 (Internet Protocol version 6).
///
/// Usage Example:
///
/// ```dart
/// // Creating a variable of type IpVersion
/// IpVersion version = IpVersion.v4;
///
/// // Switching based on the IP version
/// switch (version) {
///   case IpVersion.v4:
///     print('Using IPv4');
///     break;
///   case IpVersion.v6:
///     print('Using IPv6');
///     break;
/// }
/// ```
///
/// Notes:
///
/// - This enum provides a convenient way to represent the two major versions of the Internet Protocol.
/// - Developers can use this enum to specify the version of IP address used in networking applications.
enum IpVersion {
  /// Represents IPv4 (Internet Protocol version 4).
  v4,

  /// Represents IPv6 (Internet Protocol version 6).
  v6,
}

/// ## [IpInfo] Class Documentation
///
/// The `IpInfo` class represents information about an IP address, including its geographical
/// location, timezone, and organization.
///
/// Fields:
///
/// - `ip`: The IP address.
/// - `continentCode`: The continent code.
/// - `country`: The name of the country.
/// - `countryCode`: The ISO 3166-1 alpha-2 country code.
/// - `countryCode3`: The ISO 3166-1 alpha-3 country code.
/// - `region`: The name of the region (e.g., state, province).
/// - `regionCode`: The code of the region.
/// - `city`: The name of the city.
/// - `latitude`: The latitude coordinate.
/// - `longitude`: The longitude coordinate.
/// - `timezone`: The timezone of the location.
/// - `offset`: The offset from UTC.
/// - `asn`: The Autonomous System Number.
/// - `organization`: The organization associated with the IP address.
///
/// Constructor:
///
/// - The constructor initializes an `IpInfo` object with the provided parameters.
///
/// Methods:
///
/// - `fromJson`: Creates an `IpInfo` object from a JSON map.
/// - `toJson`: Converts the `IpInfo` object to a JSON map.
///
/// Usage Example:
///
/// ```dart
/// // Creating an IpInfo object from JSON
/// final ipInfo = IpInfo.fromJson({
///   'ip': '192.168.1.1',
///   'country': 'United States',
///   'countryCode': 'US',
///   'region': 'California',
///   // Other fields...
/// });
///
/// // Accessing fields of the IpInfo object
/// print('IP Address: ${ipInfo.ip}');
/// print('Country: ${ipInfo.country}');
/// print('City: ${ipInfo.city}');
/// ```
///
/// Notes:
///
/// - This class provides a structured representation of IP address information, making it easier
///   to work with and access specific details.
class IpInfo {
  final String? ip;
  final String? continentCode;
  final String? country;
  final String? countryCode;
  final String? countryCode3;
  final String? region;
  final String? regionCode;
  final String? city;
  final num? latitude;
  final num? longitude;
  final String? timezone;
  final num? offset;
  final num? asn;
  final String? organization;

  IpInfo({
    this.ip,
    this.continentCode,
    this.country,
    this.countryCode,
    this.countryCode3,
    this.region,
    this.regionCode,
    this.city,
    this.latitude,
    this.longitude,
    this.timezone,
    this.offset,
    this.asn,
    this.organization,
  });

  IpInfo.fromJson(Map<String, dynamic> json)
      : ip = json['ip'],
        continentCode = json['continent_code'],
        country = json['country'],
        countryCode = json['country_code'],
        countryCode3 = json['country_code3'],
        region = json['region'],
        regionCode = json['region_code'],
        city = json['city'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        timezone = json['timezone'],
        offset = json['offset'],
        asn = json['asn'],
        organization = json['organization'];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json['ip'] = ip;
    json['continent_code'] = continentCode;
    json['country'] = country;
    json['country_code'] = countryCode;
    json['country_code3'] = countryCode3;
    json['region'] = region;
    json['region_code'] = regionCode;
    json['city'] = city;
    json['latitude'] = latitude;
    json['longitude'] = longitude;
    json['timezone'] = timezone;
    json['offset'] = offset;
    json['asn'] = asn;
    json['organization'] = organization;

    return json;
  }

  @override
  String toString() {
    return 'ip: $ip, continentCode: $continentCode, country: $country, countryCode: $countryCode, countryCode3: $countryCode3, region: $region, regionCode: $regionCode, city: $city, latitude: $latitude, longitude: $longitude, timezone: $timezone, offset: $offset, asn: $asn, organization: $organization';
  }
}

/// ## getMyIpInfo Function Documentation
///
/// The `getMyIpInfo` function retrieves geographical information about the user's IP address
/// from an external API based on the specified IP version.
///
/// Parameters:
///
/// - `version`: Specifies the IP version (IPv4 or IPv6). Defaults to IPv4.
///
/// Returns:
///
/// - A `Future` that resolves to an `IpInfo` object containing information about the user's IP
///   address, or `null` if the request fails.
///
/// Usage Example:
///
/// ```dart
/// final ipInfo = await getMyIpInfo();
/// if (ipInfo != null) {
///   print('Your IP Address: ${ipInfo.ip}');
///   print('Your Country: ${ipInfo.country}');
///   print('Your City: ${ipInfo.city}');
/// } else {
///   print('Failed to fetch IP information.');
/// }
/// ```
///
/// Notes:
///
/// - This function sends an HTTP GET request to the 'https://ip{version}.seeip.org/geoip' URL,
///   where {version} is replaced with '4' or '6' based on the specified IP version.
///     -- https://api.seeip.org/geoip
///     -- https://ipv4.seeip.org/geoip
///     -- https://ipv6.seeip.org/geoip
/// - The response from the API is expected to be a JSON object containing geographical information
///   about the IP address.
/// - If the request is successful (HTTP status code 200), the function returns an `IpInfo` object
///   populated with the retrieved data. Otherwise, it returns `null`.
/// - Any errors that occur during the HTTP request are caught and logged, and the function returns
///   `null`.
Future<IpInfo?> getMyIpInfo({IpVersion version = IpVersion.v4}) async {
  try {
    final http.Response response =
        await http.get(Uri.parse('https://ip${version.name}.seeip.org/geoip'));
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return IpInfo.fromJson(jsonResponse);
    } else {
      return null;
    }
  } catch (e) {
    print(e.toString());
    return null;
  }
}
