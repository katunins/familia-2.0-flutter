import 'package:familia_flutter/helpers/util.helper.dart';
import 'package:familia_flutter/models/tree_element.dart';

class ParentsModel {
  late String mother;
  late String father;

  ParentsModel({required this.mother, required this.father});

  ParentsModel.createEmpty() {
    mother = '';
    father = '';
  }

  bool get isEmpty => mother == '' && father == '';

  ParentsModel.fromJson(Map<String, dynamic> json) {
    mother = json['mother'];
    father = json['father'];
  }

  toMap() {
    return {'mother': mother, 'father': father};
  }

  List<String> toList() {
    List<String> list = [];
    if (mother != '') {
      list.add(mother);
    }
    if (father != '') {
      list.add(father);
    }
    return list;
  }

  List<TreeElementModel> toTreeElements() {
    var list = <TreeElementModel>[];
    if (mother != '') {
      list.add(getFromAllFamily(mother));
    }
    if (father != '') {
      list.add(getFromAllFamily(father));
    }
    return list;
  }

  bool contains(String id) => toList().contains(id);
}
