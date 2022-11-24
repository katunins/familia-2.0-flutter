import 'package:mobx/mobx.dart';

import '../models/gender.enum.dart';

part 'genderSelector.controller.g.dart';

class GenderSelectorController = GenderSelectorControllerBase with _$GenderSelectorController;

abstract class GenderSelectorControllerBase with Store {
  @observable
  Gender? _gender;

  @observable
  var
  isError = false;

  @computed
  Gender? get gender => _gender;

  @action
  bool validate(){
    if (_gender == null) {
      isError = true;
    }
    return isError;
  }

  @action
  setGender(Gender? value) {
    if (value != null) {
      isError = false;
      _gender = value;
    }
  }
}