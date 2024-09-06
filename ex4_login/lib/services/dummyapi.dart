class StatusErrorException {
  final int statusCode;
  const StatusErrorException(this.statusCode);
}

abstract class DummyAPI {
  static const apiServer = 'dummyjson.com';
  static const apiUrl = '';
}