import '../models/remote_data.dart';
import '../models/endpoint.dart';

abstract class RemoteDataManager {
  Future<RemoteData> request({required Endpoint endpoint});
}
