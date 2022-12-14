import 'package:familia_flutter/models/base_user_data.model.dart';
import 'package:familia_flutter/models/gender.enum.dart';
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

  Future<bool> updateUserPic({required XFile image, required String id}) async {
    List<String> filesToDelete =
        user?.userData.userPic != null ? [user!.userData.userPic!] : [];
    List? imageUrls = await StorageApi()
        .uploadImages(images: [image], filesToDelete: filesToDelete);
    if (imageUrls == null) {
      return false;
    }
    var newUser = await UserService().updateUser({'userPic': imageUrls[0]});

    if (newUser == null) {
      return false;
    }
    setUser(newUser);
    return true;
  }

  Future<String?> updateUserData(BaseUserDataModel userData) async {
    var newUser = await UserService().updateUser(userData.toMap());

    if (newUser != null) {
      setUser(newUser);
    }
    return newUser?.id;
  }

  @observable
  UserModel? user;

  // @computed
  // get hasRequiredUserData => user?.userData.name != null;

  @computed
  bool get isRequiredFilled =>
      user != null &&
      (user!.userData.name != '' && user!.userData.gender != Gender.none);

  @computed
  bool get isParentsNotEmpty =>
      user != null && !user!.userData.parents.isEmpty;

  @action
  setUser(UserModel userModel) {
    user = userModel;
  }

  @action
  resetUser() {
    user = null;
  }
}
