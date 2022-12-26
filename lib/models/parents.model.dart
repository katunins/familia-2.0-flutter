class ParentsModel {
  late String mother;
  late String father;

  ParentsModel({required this.mother, required this.father});

  ParentsModel.createEmpty(){
    mother = '';
    father = '';
  }

  ParentsModel.fromJson(Map<String, dynamic> json) {
    mother = json['mother'];
    father = json['father'];
  }

  toMap() {
    return {'mother': mother, 'father': father};
  }

  List<String> toIdsList() {
    List<String> list = [];
    if (mother != '') {
      list.add(mother);
    }
    if (father != '') {
      list.add(father);
    }
    return list;
  }
}
