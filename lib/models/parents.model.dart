class ParentsModel {
  String? mother;
  String? father;

  ParentsModel({this.mother, this.father});

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
      list.add(mother!);
    }
    if (father != '') {
      list.add(father!);
    }
    return list;
  }
}
