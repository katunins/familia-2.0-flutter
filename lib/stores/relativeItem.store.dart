import 'package:familia_flutter/models/relative.model.dart';
import 'package:mobx/mobx.dart';

part 'relativeItem.store.g.dart';

class RelativeItemStore = RelativeItemStoreBase with _$RelativeItemStore;

abstract class RelativeItemStoreBase with Store {

  RelativeItemStoreBase(this.data);

  @observable
  RelativeModel data;

  @action
  set(RelativeModel relative)=> data = relative;
}