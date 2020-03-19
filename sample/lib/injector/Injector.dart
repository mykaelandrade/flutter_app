import 'package:sample/remote/PicDataSource.dart';
import 'package:sample/repository/PicsRepository.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  static Future<PicsRepository> providePicsRepository() async {
    return new PicsRepositoryImpl(new RemoteDataSource());
  }

  Injector._internal();
}
