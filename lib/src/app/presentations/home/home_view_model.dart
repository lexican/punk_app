import 'package:flutter/material.dart';
import 'package:motopay_assessment_test/src/app/data/models/punk.dart';
import 'package:motopay_assessment_test/src/app/data/repositories/repository_imp.dart';
import 'package:motopay_assessment_test/src/app/domain/repositories/repository.dart';
import 'package:motopay_assessment_test/src/app/domain/ues_cases/get_punks_usecase/get_punks_usecase.dart';
import 'package:motopay_assessment_test/src/core/app/locator.dart';
import 'package:motopay_assessment_test/src/core/services/connectivity_service.dart';
import 'package:motopay_assessment_test/src/core/utils/app_utils.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final Repository _repository = locator<RepositoryImp>();

  final ConnectivityService _connectivityService =
      locator<ConnectivityService>();

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

  bool _hasInternetConnection = true;
  bool get hasInternetConnection => _hasInternetConnection;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  Future<void> onViewModelReady() async {
    _connectivityService.connectionStream?.stream.listen((hasConnection) {
      _hasInternetConnection = hasConnection;

      if (!hasConnection) {
        showSnackBar("No Internet", Colors.red);
      }
      notifyListeners();
    });
    _getPunksCase = GetPunksCase(_repository);
    await fetchPunks();
  }

  Future<void> fetchPunks() async {
    if (_punks.isEmpty) {
      final result = await _getPunksCase.call(page: page);

      result.fold((l) {
        _isLoading = false;
        _errorMessage = l;
        notifyListeners();
      }, (r) {
        _punks.addAll(r);
        _isLoading = false;
        page++;
        if (_errorMessage.isNotEmpty) {
          _errorMessage = "";
        }
        notifyListeners();
      });
    } else {
      if (!_isLoadingMore) {
        _isLoadingMore = true;
        notifyListeners();
      }
      final result = await _getPunksCase.call(page: page);

      result.fold((l) {
        _errorMessage = l;
        _isLoadingMore = false;
        notifyListeners();
        showSnackBar(l, Colors.red);
      }, (r) {
        _isLoadingMore = false;
        _punks.addAll(r);
        if (r.length < 25) {
          _hasReachedMax = true;
        }
        if (_errorMessage.isNotEmpty) {
          _errorMessage = "";
        }
        notifyListeners();
      });
    }
  }
}
