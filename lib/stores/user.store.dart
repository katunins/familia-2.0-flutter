import 'package:familia_flutter/models/baseUserData.model.dart';
import 'package:familia_flutter/models/user.model.dart';
import 'package:familia_flutter/services/storage.service.dart';
import 'package:familia_flutter/services/user.service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'user.store.g.dart';

var userStore = UserStore();

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {

  init() async {
    var user = await UserService().getUser();

    if (user != null) {
      setUser(user);
    }
  }

  Future<bool> updateUserPic({
    required XFile image
  }) async {

    var imageUrl = await StorageApi().uploadImage(image: image);
    if (imageUrl == null) {
      return false;
    }
    var newUser = await UserService().updateUser({'userPic': imageUrl});

    if (newUser == null){
      return false;
    }
    setUser(newUser);
    return true;
  }

  Future<bool> updateUserData(BaseUserDataModel userData) async {
    Map<String, dynamic> dataObj = {};
    if (userData.name != null) dataObj['name'] = userData.name;
    if (userData.about != null) dataObj['about'] = userData.about;
    var newUser = await UserService().updateUser(dataObj);

    if (newUser == null){
      return false;
    }
    setUser(newUser);
    return true;
  }

  @observable
  UserModel? user;

  @computed
  get hasRequiredUserData => user?.userData?.name != null;

  @action
  setUser(UserModel userModel) {
    user = userModel;
  }

  @action
  resetUser() {
    user = null;
  }
}
