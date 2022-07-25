import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';


part 'error_store.g.dart';

@singleton
class ErrorStore = _ErrorStore with _$ErrorStore;

abstract class _ErrorStore with Store {

  // disposers
  List<ReactionDisposer>? _disposers;

  // constructor:---------------------------------------------------------------
  _ErrorStore() {
    _disposers = [
      reaction((_) => infos, resetInfos, delay: 400),
      reaction((_) => success, resetSuccess, delay: 400),
      reaction((_) => error, resetError, delay: 800),
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String? error;

  @observable
  String? success;

  @observable
  String? infos;

  @observable
  String? type;

  // actions:-------------------------------------------------------------------
  @action
  void setErrorMessage(String? error) {
    this.error = error;
  }

  @action
  void setSuccessMessage(String? success) {
    this.success = success;
  }

  @action
  void setInfosMessage(String? infos) {
    this.infos = infos;
  }

  @action
  void setTypeMessage(String? type) {
    this.type = type;
  }


  @action
  void resetError(String? value) {
    print('calling reset error');
    error = null;
  }

  @action
  void resetSuccess(String? value) {
    print('calling reset success');
    success = null;
  }

  @action
  void resetInfos(String? value) {
    print('calling reset infos');
    infos = null;
  }

  // dispose:-------------------------------------------------------------------
  @action
  dispose() {
    for (final d in _disposers!) {
      d();
    }
  }
}