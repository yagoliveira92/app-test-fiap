abstract class IAppConstantsManager {
  String get apiBaseUrl;
  String get apiKey;
}

class AppConstantsManager implements IAppConstantsManager {
  const AppConstantsManager({
    required String apiBaseUrl,
    required String apiKey,
  })  : _apiBaseUrl = apiBaseUrl,
        _apiKey = apiKey;

  final String _apiBaseUrl;
  final String _apiKey;

  @override
  String get apiBaseUrl => _apiBaseUrl;

  @override
  String get apiKey => _apiKey;
}
