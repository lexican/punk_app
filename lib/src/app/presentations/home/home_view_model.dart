import 'package:motopay_assessment_test/src/app/data/models/punk.dart';
import 'package:motopay_assessment_test/src/app/data/repositories/repository_imp.dart';
import 'package:motopay_assessment_test/src/app/domain/repositories/repository.dart';
import 'package:motopay_assessment_test/src/app/domain/ues_cases/get_punks_usecase/get_punks_usecase.dart';
import 'package:motopay_assessment_test/src/core/app/locator.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final Repository _repository = locator<RepositoryImp>();
  late GetPunksCase _getPunksCase;
  int limit = 25;

  int page = 1;

  final List<Punk> _punks = [];
  List<Punk> get punks => _punks;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  bool _hasReachedMax = false;
  bool get hasReachedMax => _hasReachedMax;

  Future<void> onViewModelReady() async {
    _getPunksCase = GetPunksCase(_repository);
    await fetchPunks();
  }

  Future<void> fetchPunks() async {
    if (_punks.isEmpty) {
      final result = await _getPunksCase.call(page: page);

      result.fold((l) {
        print("Error: $l");
      }, (r) {
        _punks.addAll(r);
        print("Error: ${r[0]}");
        _isLoading = false;
        page++;
        notifyListeners();
      });
    } else {
      if (!_isLoadingMore) {
        _isLoadingMore = true;
        notifyListeners();
      }
      final result = await _getPunksCase.call(page: page);

      result.fold((l) {
        print("Error: $l");
      }, (r) {
        _isLoadingMore = false;
        _punks.addAll(r);
        if (r.length < 25) {
          _hasReachedMax = true;
        }
        notifyListeners();
      });
    }
  }
}
