import 'package:sample/model/Pic.dart';
import 'package:sample/repository/PicsRepository.dart';

class PicsUseCase {
  PicsRepository repository;

  PicsUseCase(PicsRepository repository) {
    this.repository = repository;
  }

  Future<List<Pic>> fetchAllPics() async {
    return await repository.fetchAllPics();
  }
}
