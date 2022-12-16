import 'package:familia_flutter/components/updateParents.dart';
import 'package:familia_flutter/components/widgets/button.dart';
import 'package:familia_flutter/components/widgets/genderSwitch.dart';
import 'package:familia_flutter/components/widgets/getScaffold.dart';
import 'package:familia_flutter/helpers/get.helper.dart';
import 'package:familia_flutter/models/baseUserData.model.dart';
import 'package:familia_flutter/models/parents.model.dart';
import 'package:familia_flutter/stores/app.store.dart';
import 'package:familia_flutter/themes/margins.theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/imageWithUpload.dart';
import '../../components/widgets/textFieldWidget.dart';
import '../../stores/genderSelector.controller.dart';
import '../../themes/sizes.dart';

class SetUserDataScreen extends StatefulWidget {
  const SetUserDataScreen(
      {Key? key,
      this.title,
      this.canSkip = false,
      required this.dataSaveFunction,
      required this.imageSubmit,
      this.afterSubmit,
      this.isRelativeMode = false,
      this.isNewUser = false,
      this.initialData})
      : super(key: key);

  final String? title;
  final bool canSkip;
  final Future<String?> Function(BaseUserDataModel) dataSaveFunction;
  final Future<bool> Function({required XFile image, required String id})
      imageSubmit;
  final void Function()? afterSubmit;
  final BaseUserDataModel? initialData;
  final bool isRelativeMode;
  final bool isNewUser;

  static const routeName = '/setUserDataScreen';

  @override
  State<SetUserDataScreen> createState() => _SetUserDataScreenState();
}

class _SetUserDataScreenState extends State<SetUserDataScreen> {
  final scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  final nameTextEditingController = TextEditingController();
  final aboutTextEditingController = TextEditingController();
  final genderSelectorController = GenderSelectorController();
  var canSubmit = false;

  XFile? uploadImage;
  ParentsModel? parents;

  @override
  void initState() {
    //TODO если нет проблем с формой, то можно убрать
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   genderSelectorController.setGender(widget.initialData?.gender);
    //   nameTextEditingController.text = widget.initialData?.name ?? '';
    //   aboutTextEditingController.text = widget.initialData?.about ?? '';
    //   parents = widget.initialData?.parents;
    //   setState(() {});
    // });

    genderSelectorController.setGender(widget.initialData?.gender);
    nameTextEditingController.text = widget.initialData?.name ?? '';
    aboutTextEditingController.text = widget.initialData?.about ?? '';
    parents = ParentsModel(
      mother: widget.initialData?.parents?.mother,
      father: widget.initialData?.parents?.father,
    );

    if (widget.isNewUser) {
      canSubmit = true;
    }
    setState(() {});
    super.initState();
  }

  void updateCanSubmit() {
    if (widget.isNewUser) {
      return;
    }

    var res = false;
    if (nameTextEditingController.text.isNotEmpty &&
        nameTextEditingController.text != widget.initialData?.name) {
      res = true;
    }
    if (aboutTextEditingController.text != widget.initialData?.about) {
      res = true;
    }
    if (genderSelectorController.gender != widget.initialData?.gender) {
      res = true;
    }
    if (uploadImage != null) {
      res = true;
    }
    setState(() {
      canSubmit = res;
    });
  }

  void _submit() async {
    _formKey.currentState!.validate();
    if (genderSelectorController.validate()) {
      return;
    }
    var resultId = await widget.dataSaveFunction(
      BaseUserDataModel(
          name: nameTextEditingController.text,
          about: aboutTextEditingController.text != ''
              ? aboutTextEditingController.text
              : null,
          gender: genderSelectorController.gender),
    );

    if (resultId != null) {
      if (uploadImage != null) {
        var uploadResult =
            await widget.imageSubmit(image: uploadImage!, id: resultId);
        if (!uploadResult) {
          showPopup(middleText: 'Ну удалось обновить фотографию.');
        }
      }

      if (widget.afterSubmit != null) {
        widget.afterSubmit!();
      }
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

  onParentSelected({required String oldParentId, required String newParentId}) {
    if (parents!.father == oldParentId) {
      parents!.father = newParentId;
      // parents!.setFather(newParentId);
    }

    if (parents!.mother == oldParentId) {
      parents!.mother = newParentId;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var userPic = widget.initialData?.userPic;

    return AppScaffold(
        title: widget.title,
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
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 50),
                            child: ImageWithUpload(
                              onUpload: onUpload,
                              isSquare: true,
                              path: uploadImage?.path ?? userPic,
                            )),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: marginHorizontal),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: AppSizes.inputVerticalMargin,
                                ),
                                child: TextFieldWidget(
                                    controller: nameTextEditingController,
                                    onChanged: (_) => updateCanSubmit(),
                                    validator: (val) => val == ''
                                        ? 'Заполните обязательные поля'
                                        : null,
                                    labelText: 'Фамилия Имя'),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: AppSizes.inputVerticalMargin),
                                child: GenderSelector(
                                  controller: genderSelectorController,
                                  onChanged: (_) => updateCanSubmit(),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: AppSizes.inputVerticalMargin),
                                child: TextFieldWidget(
                                    controller: aboutTextEditingController,
                                    minLines: 3,
                                    maxLines: 15,
                                    onChanged: (_) => updateCanSubmit(),
                                    labelText: widget.isRelativeMode
                                        ? 'Расскажите о родственнике'
                                        : 'Расскажите о себе',
                                    hintText: widget.isRelativeMode
                                        ? 'Кратко опишите ключевые события из жизни человека, его профессию, особенности'
                                        : 'Укажите когда и где вы родились, а также опишите какие то важные события вашей жизни'),
                              ),
                              //TODO не работает обновление родителя при его смене
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: AppSizes.inputVerticalMargin),
                                  child: UpdateParents(
                                    parents: parents,
                                    onSelected: onParentSelected,
                                  )),
                              AppButton(
                                title: 'Сохранить',
                                type: IAppButtonTypes.primary,
                                onPressed: _submit,
                                disabled: !canSubmit,
                              ),
                              // TODO разобраться с возможностью пропускать заполнение основного профиля
                              widget.canSkip
                                  ? AppButton(
                                      title: 'Пропустить',
                                      type: IAppButtonTypes.link,
                                      onPressed: widget.afterSubmit)
                                  : AppButton(
                                      title: 'Отменить',
                                      type: IAppButtonTypes.secondary,
                                      onPressed: Navigator.of(context).pop),
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
