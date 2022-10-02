import 'package:familia_flutter/components/widgets/scaffold.dart';
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

class SetUserDataScreenArgumentsModel {
  final String? title;
  final bool hideGoBack;
  final Future<bool> Function(BaseUserDataModel) dataSubmit;
  final Future<bool> Function({required XFile image}) imageSubmit;
  final void Function()? afterSubmit;
  final BaseUserDataModel? initialData;

  SetUserDataScreenArgumentsModel(
      {this.title,
      this.hideGoBack = false,
      required this.dataSubmit,
      required this.imageSubmit,
      this.afterSubmit,
      this.initialData});
}

class SetUserDataScreen extends StatefulWidget {
  SetUserDataScreen({Key? key}) : super(key: key);

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
      final args = ModalRoute.of(context)!.settings.arguments
          as SetUserDataScreenArgumentsModel;
      nameTextEditingController.text = args.initialData?.name ?? '';
      aboutTextEditingController.text = args.initialData?.about ?? '';
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

  void _submit(SetUserDataScreenArgumentsModel args) async {
    if (_formKey.currentState!.validate()) {}
    if (uploadImage != null) {
      var uploadResult = await args.imageSubmit(image: uploadImage!);
      if (!uploadResult) return;
    }
    var result = await args.dataSubmit(BaseUserDataModel(
        name: nameTextEditingController.text != ''
            ? nameTextEditingController.text
            : null,
        about: aboutTextEditingController.text != ''
            ? aboutTextEditingController.text
            : null));

    if (result && args.afterSubmit != null) {
      args.afterSubmit!();
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
    final args = ModalRoute.of(context)!.settings.arguments
        as SetUserDataScreenArgumentsModel;

    return getScaffold(
        hideUserPick: true,
        title: args.title,
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
                    child: Observer(builder: (_)=>Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 50),
                            child: ImageWithUpload(
                              onUpload: onUpload,
                              isSquare: true,
                              path: uploadImage?.path ??
                                  userStore?.user?.userData?.userPic,
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
                              ElevatedButton(
                                onPressed:
                                canSubmit ? () => _submit(args) : null,
                                child: const Text('Сохранить'),
                              )
                            ],
                          ),
                        )
                      ],
                    ),)),
                const SizedBox(
                  height: 20.0,
                ),
                if (!args.hideGoBack)
                  getLinkButton(
                      text: 'Отменить', onPressed: navigationStore.back),
                if (args.hideGoBack && args.afterSubmit != null)
                  getLinkButton(
                      text: 'Пропустить', onPressed: args.afterSubmit)
              ],
            ),
          ),
        ));
  }
}
