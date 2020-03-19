import 'package:sample/model/Pic.dart';
import 'package:sample/remote/PicDataSource.dart';

abstract class PicsRepository {
  Future<List<Pic>> fetchAllPics();
}

class PicsRepositoryImpl implements PicsRepository {
  RemoteDataSource remoteDataSource;

  PicsRepositoryImpl(RemoteDataSource remoteDataSource) {
    this.remoteDataSource = remoteDataSource;
  }

  @override
  Future<List<Pic>> fetchAllPics() async {
    return await remoteDataSource.getPics();
  }
}
