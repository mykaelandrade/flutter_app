import 'package:sample/injector/Injector.dart';
import 'package:sample/ui/view/PicsView.dart';
import 'package:sample/ui/viewmodel/PicsViewModel.dart';
import 'package:sample/usecase/PicsUseCase.dart';

class PicsPresenter {
  set view(PicsView view) {}
  void fetchAllPics() {}
}

class PicsPresenterImpl implements PicsPresenter {
  PicsView _mView;
  PicsViewModel _mViewModel;

  PicsPresenterImpl() {
    this._mViewModel = new PicsViewModel();
  }

  @override
  set view(PicsView view) {
    _mView = view;
    if (this._mView != null) this._mView.render(this._mViewModel);
  }

  @override
  void fetchAllPics() async {
    _mViewModel.pics = PicsUseCase(await Injector.providePicsRepository())
        .fetchAllPics();

    _mViewModel.isLoading = false;
    if (this._mView != null) this._mView.render(this._mViewModel);
  }
}
