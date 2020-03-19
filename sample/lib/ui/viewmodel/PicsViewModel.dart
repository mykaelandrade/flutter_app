import 'package:sample/model/Pic.dart';

class PicsViewModel {
  bool isLoading;
  Future<List<Pic>> pics;

  PicsViewModel() {
    this.isLoading = true;
    this.pics = null;
  }
}
