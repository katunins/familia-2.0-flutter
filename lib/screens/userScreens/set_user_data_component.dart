import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/common/update_parents.dart';
import 'package:familia_flutter/components/common/button.dart';
import 'package:familia_flutter/components/common/gender_selector.dart';
import 'package:familia_flutter/helpers/util.helper.dart';
import 'package:familia_flutter/models/base_user_data.model.dart';
import 'package:familia_flutter/models/parents.model.dart';
import 'package:familia_flutter/themes/margins.theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../helpers/bottom_sheet.dart';
import '../../components/common/image_with_upload.dart';
import '../../components/common/text_field_widget.dart';
import '../../models/gender.enum.dart';
import '../../themes/sizes.dart';

/// Экран редактировани пользователя или родственника
/// title - название в header
/// canSkip - показывать ли кнопку пропустить
/// dataSaveFunction - callBack для кнопки Сохранить
/// imageSubmit - callBack для обновления userPic
/// initialData - изначальные данные
/// aboutLabelText, aboutHintText - поле о себе (подсказка и лейбл)
/// id - пользователя, которого редактируем
/// hideBottomSheetAddRelativeButton - скрывает кнопку добавить родтсвенника в bottomSheet при выборе родителя

class SetUserDataComponent extends StatefulWidget {
  const SetUserDataComponent(
      {Key? key,
        this.id,
      this.canSkip = false,
      required this.dataSaveFunction,
      required this.imageSubmit,
      this.afterSubmit,
      required this.initialData,
      required this.aboutLabelText,
      required this.aboutHintText, required this.hideBottomSheetAddRelativeButton})
      : super(key: key);

  final bool canSkip;
  final Future<String?> Function(BaseUserDataModel) dataSaveFunction;
  final Future<bool> Function({required XFile image, required String id})
      imageSubmit;
  final void Function({String? resultId})? afterSubmit;
  final BaseUserDataModel initialData;
  final String aboutLabelText;
  final String aboutHintText;
  final String? id;
  final bool hideBottomSheetAddRelativeButton;

  @override
  State<SetUserDataComponent> createState() => _SetUserDataComponentState();
}

class _SetUserDataComponentState extends State<SetUserDataComponent> {
  final scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final aboutController = TextEditingController();

  Gender gender = Gender.none;
  XFile? uploadImage;
  String mother = '';
  String father = '';

  String? genderErrorText;

  bool isSaveDisabled() {
    if (nameController.text != widget.initialData.name) {
      return false;
    }
    if (aboutController.text != widget.initialData.about) {
      return false;
    }

    if (gender != widget.initialData.gender) {
      return false;
    }

    if (uploadImage != null) {
      return false;
    }

    bool isSameParents = isSameParentsModels(widget.initialData.parents,
        ParentsModel(mother: mother, father: father));
    if (!isSameParents) {
      return false;
    }

    return true;
  }

  bool isRequired() => nameController.text == '' || gender == Gender.none;

  @override
  void initState() {
    nameController.text = widget.initialData.name;
    aboutController.text = widget.initialData.about;

    nameController.addListener((){
      setState(() {});
    });
    aboutController.addListener((){
      setState(() {});
    });

    mother = widget.initialData.parents.mother;
    father = widget.initialData.parents.father;
    gender = widget.initialData.gender;

    super.initState();
  }

  bool validateForm(){
    if (!_formKey.currentState!.validate()) {
      return false;
    }

    if (gender == Gender.none) {
      genderErrorText = 'Выберете пол';
      setState(() {});
      return false;
    }

    if (gender == Gender.none) {
      genderErrorText = 'Выберете пол';
      setState(() {});
      return false;
    }
    return true;
  }

  void _submit() async {

    if (!validateForm()){
      return;
    }

    var resultId = await widget.dataSaveFunction(BaseUserDataModel(
        name: nameController.text,
        about: aboutController.text,
        gender: gender,
        parents: ParentsModel(mother: mother, father: father)));

    if (resultId != null) {
      if (uploadImage != null) {
        var uploadResult =
            await widget.imageSubmit(image: uploadImage!, id: resultId);
        if (!uploadResult) {
          BottomSheetHelper.message(
              context: context, message: 'Не удалось обновить фотографию');
        }
      }

      if (widget.afterSubmit != null) {
        widget.afterSubmit!(resultId: resultId);
      }
    }
  }

  onUpload({required XFile image}) {
    uploadImage = image;
    setState(() {});

    Future.delayed(const Duration(milliseconds: 300)).then((value) =>
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500), curve: Curves.ease));
  }

  /// oldParentId - id предыдущего родителя, которого нужно заменить на newParentId
  /// если oldParentId == '', то меняем устанавливаем первого не заполненого родителя
  onParentSelected({required String oldParentId, required String newParentId}) {
    if (oldParentId == '') {
      if (father == '') {
        father = newParentId;
        setState(() {});
        return;
      }
      if (mother == '') {
        mother = newParentId;
        setState(() {});
        return;
      }
    }

    if (father == oldParentId) {
      father = newParentId;
      setState(() {});
      if (oldParentId == '') {
        return;
      }
    }

    if (mother == oldParentId) {
      mother = newParentId;
      setState(() {});
      if (oldParentId == '') {
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
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
                              path: uploadImage?.path ?? widget.initialData?.userPic,
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
                                    controller: nameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Заполните Имя';
                                      }
                                      return null;
                                    },
                                    labelText: 'Фамилия Имя'),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: AppSizes.inputVerticalMargin),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GenderSelector(
                                      value: gender,
                                      error: genderErrorText,
                                      onChanged: (val) {
                                        gender = val ?? Gender.none;
                                        setState(() {});
                                      },
                                    ),
                                    if (genderErrorText != null)
                                      Container(
                                        padding: const EdgeInsets.only(top: 10, left: 20),
                                        child: const Text(
                                          'Выберете пол',
                                          style: TextStyle(
                                              color: Colors.red,
                                            fontSize: 13
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: AppSizes.inputVerticalMargin),
                                  child: TextFieldWidget(
                                    controller: aboutController,
                                    minLines: 3,
                                    maxLines: 15,
                                    labelText: widget.aboutLabelText,
                                    hintText: widget.aboutHintText,
                                  )),
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: AppSizes.inputVerticalMargin),
                                  child: UpdateParents(
                                    hideBottomSheetAddRelativeButton:widget.hideBottomSheetAddRelativeButton,
                                    childId: widget.id,
                                    parents: ParentsModel(
                                        mother: mother, father: father),
                                    onSelected: onParentSelected,
                                  )),
                              AppButton(
                                title: 'Сохранить',
                                type: IAppButtonTypes.primary,
                                onPressed: _submit,
                                disabled: isSaveDisabled(),
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
                                      onPressed: context.router.pop),
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        );
  }
}