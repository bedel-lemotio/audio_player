// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ErrorStore on _ErrorStore, Store {
  late final _$errorAtom = Atom(name: '_ErrorStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$successAtom =
      Atom(name: '_ErrorStore.success', context: context);

  @override
  String? get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(String? value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$infosAtom = Atom(name: '_ErrorStore.infos', context: context);

  @override
  String? get infos {
    _$infosAtom.reportRead();
    return super.infos;
  }

  @override
  set infos(String? value) {
    _$infosAtom.reportWrite(value, super.infos, () {
      super.infos = value;
    });
  }

  late final _$typeAtom = Atom(name: '_ErrorStore.type', context: context);

  @override
  String? get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(String? value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$_ErrorStoreActionController =
      ActionController(name: '_ErrorStore', context: context);

  @override
  void setErrorMessage(String? error) {
    final _$actionInfo = _$_ErrorStoreActionController.startAction(
        name: '_ErrorStore.setErrorMessage');
    try {
      return super.setErrorMessage(error);
    } finally {
      _$_ErrorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSuccessMessage(String? success) {
    final _$actionInfo = _$_ErrorStoreActionController.startAction(
        name: '_ErrorStore.setSuccessMessage');
    try {
      return super.setSuccessMessage(success);
    } finally {
      _$_ErrorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInfosMessage(String? infos) {
    final _$actionInfo = _$_ErrorStoreActionController.startAction(
        name: '_ErrorStore.setInfosMessage');
    try {
      return super.setInfosMessage(infos);
    } finally {
      _$_ErrorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTypeMessage(String? type) {
    final _$actionInfo = _$_ErrorStoreActionController.startAction(
        name: '_ErrorStore.setTypeMessage');
    try {
      return super.setTypeMessage(type);
    } finally {
      _$_ErrorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetError(String? value) {
    final _$actionInfo = _$_ErrorStoreActionController.startAction(
        name: '_ErrorStore.resetError');
    try {
      return super.resetError(value);
    } finally {
      _$_ErrorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSuccess(String? value) {
    final _$actionInfo = _$_ErrorStoreActionController.startAction(
        name: '_ErrorStore.resetSuccess');
    try {
      return super.resetSuccess(value);
    } finally {
      _$_ErrorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetInfos(String? value) {
    final _$actionInfo = _$_ErrorStoreActionController.startAction(
        name: '_ErrorStore.resetInfos');
    try {
      return super.resetInfos(value);
    } finally {
      _$_ErrorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo =
        _$_ErrorStoreActionController.startAction(name: '_ErrorStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_ErrorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
success: ${success},
infos: ${infos},
type: ${type}
    ''';
  }
}
