part of '../api.dart';

class ApiScene extends ApiBase {
  const ApiScene(super.path);

  Future list({required PageNum page}) {
    return _doPost('scene/list', data: page + {});
  }

  Future types() {
    return _doPost('scene/group');
  }
}
