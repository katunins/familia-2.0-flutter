import 'package:familia_flutter/components/widgets/getScaffold.dart';
import 'package:familia_flutter/components/widgets/primaryButton.dart';
import 'package:familia_flutter/models/baseUserData.model.dart';
import 'package:familia_flutter/stores/navigation.store.dart';
import 'package:familia_flutter/stores/user.store.dart';
import 'package:familia_flutter/themes/margins.theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/imageWithUpload.dart';
import '../../components/widgets/formTextField.dart';
import '../../components/widgets/linkButton.dart';
import '../../themes/sizes.dart';

class SetUserDataScreen extends StatefulWidget {
  const SetUserDataScreen(
      {Key? key,
      this.title,
      this.hideGoBack = false,
      required this.dataSubmit,
      required this.imageSubmit,
      this.afterSubmit,
      this.initialData})
      : super(key: key);

  final String? title;
  final bool hideGoBack;
  final Future<bool> Function(BaseUserDataModel) dataSubmit;
  final Future<bool> Function({required XFile image}) imageSubmit;
  final void Function()? afterSubmit;
  final BaseUserDataModel? initialData;

  static const routeName = '/setUserDataScreen';

  @override
  State<SetUserDataScreen> createState() => _SetUserDataScreenState();
}

class _SetUserDataScreenState extends State<SetUserDataScreen> {
  final scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  final nameTextEditingController = TextEditingController();
  final aboutTextEditingController = TextEditingController();
  var canSubmit = false;
  XFile? uploadImage;

  @override
  void initState() {
    super.initState();

    () async {
      await Future.delayed(Duration.zero);
      // final widget = ModalRoute.of(context)!.settings.arguments
      //     as SetUserDataScreenArgumentsModel;
      nameTextEditingController.text = widget.initialData?.name ?? '';
      aboutTextEditingController.text = widget.initialData?.about ?? '';
    }();
  }

  void updateCanSubmit() {
    var res = nameTextEditingController.text.isNotEmpty;
    if (uploadImage != null) {
      res = true;
    }
    setState(() {
      canSubmit = res;
    });
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {}
    if (uploadImage != null) {
      var uploadResult = await widget.imageSubmit(image: uploadImage!);
      if (!uploadResult) return;
    }
    var result = await widget.dataSubmit(BaseUserDataModel(
        name: nameTextEditingController.text != ''
            ? nameTextEditingController.text
            : null,
        about: aboutTextEditingController.text != ''
            ? aboutTextEditingController.text
            : null));

    if (result && widget.afterSubmit != null) {
      widget.afterSubmit!();
    }
  }

  onUpload({required XFile image}) {
    setState(() {
      uploadImage = image;
    });
    updateCanSubmit();

    Future.delayed(const Duration(milliseconds: 300)).then((value) =>
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500), curve: Curves.ease));
  }

  @override
  Widget build(BuildContext context) {

    return getScaffold(
        title: 'Редактирование профиля',
        hideUserPick: true,
        hideNavigationBar: true,
        body: SingleChildScrollView(
          controller: scrollController,
          child: Container(
            padding: const EdgeInsets.only(bottom: 50),
            constraints: maxWidthConstraints,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                    key: _formKey,
                    child: Observer(
                      builder: (_) {
                        var userPic = userStore?.user?.userData?.userPic;
                       return Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(bottom: 50),
                                child: ImageWithUpload(
                                  onUpload: onUpload,
                                  isSquare: true,
                                  path: uploadImage?.path ?? userPic,
                                )),
                            Container(
                              margin: marginHorizontal,
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      bottom: AppSizes.inputVerticalMargin,
                                    ),
                                    child: getTextFormField(
                                        controller: nameTextEditingController,
                                        updateCanSubmit: updateCanSubmit,
                                        labelText: 'Фамилия Имя'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: AppSizes.inputVerticalMargin),
                                    child: getTextFormField(
                                        controller: aboutTextEditingController,
                                        minLines: 3,
                                        maxLines: 15,
                                        updateCanSubmit: updateCanSubmit,
                                        labelText: 'Расскажите о себе',
                                        hintText:
                                            'Укажите когда и где вы родились, а также опишите какие то важные события вашей жизни'),
                                  ),
                                  getPrimaryButton(
                                      title: 'Сохранить',
                                      onPressed: canSubmit ? _submit : null,
                                      isLockedOnLoading: true),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                if (!widget.hideGoBack)
                  getLinkButton(
                      text: 'Отменить', onPressed: Navigator.of(context).pop),
                if (widget.hideGoBack && widget.afterSubmit != null)
                  getLinkButton(
                      text: 'Пропустить', onPressed: widget.afterSubmit)
              ],
            ),
          ),
        ));
  }
}
