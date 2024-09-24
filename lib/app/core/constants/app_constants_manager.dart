abstract class AppConstantsManager {
  String get apiBaseUrl;
}

class AppConstantsManagerImpl implements AppConstantsManager {
  const AppConstantsManagerImpl({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;

  final String _apiBaseUrl;

  @override
  String get apiBaseUrl => _apiBaseUrl;
}
