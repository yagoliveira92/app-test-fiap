enum EnvironmentEnum {
  production(
    type: 'production',
    apiBaseUrl: 'https://gist.githubusercontent.com/viniciosneves/',
  ),
  development(
    type: 'development',
    apiBaseUrl: 'https://gist.githubusercontent.com/viniciosneves/',
  );

  const EnvironmentEnum({
    required this.type,
    required this.apiBaseUrl,
  });

  final String type;
  final String apiBaseUrl;

  EnvironmentEnum envFromString(String value) {
    switch (value) {
      case "PROD":
        return EnvironmentEnum.production;
      case "DEV":
        return EnvironmentEnum.development;
      default:
        throw ArgumentError("Invalid status string: $value");
    }
  }
}

extension EnvironmentsEnumMethods on EnvironmentEnum {
  static EnvironmentEnum envFromString(String value) {
    switch (value) {
      case "PROD":
        return EnvironmentEnum.production;
      case "DEV":
        return EnvironmentEnum.development;
      default:
        throw ArgumentError("Invalid status string: $value");
    }
  }
}
