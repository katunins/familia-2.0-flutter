import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/common/button.dart';
import 'package:familia_flutter/components/common/image_with_button.dart';
import 'package:familia_flutter/components/common/image_with_upload.dart';
import 'package:familia_flutter/components/common/marked_relatives.dart';
import 'package:familia_flutter/components/icons/app_icon_button.dart';
import 'package:familia_flutter/components/icons/relatives.dart';
import 'package:familia_flutter/components/relatives/relatives_selector_list_sheet.dart';
import 'package:familia_flutter/components/widgets/notes_separator.dart';
import 'package:familia_flutter/helpers/bottom_sheet.dart';
import 'package:familia_flutter/helpers/get_multi_image_picker.dart';
import 'package:familia_flutter/helpers/util.helper.dart';
import 'package:familia_flutter/models/new_note.model.dart';
import 'package:familia_flutter/stores/notes.store.dart';
import 'package:familia_flutter/themes/colors.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import '../../components/common/text_field_widget.dart';
import '../../models/note.model.dart';
import '../../themes/sizes.dart';

class SetNote extends StatefulWidget {
  const SetNote({Key? key, required this.initialData}) : super(key: key);

  final NoteModel initialData;

  @override
  State<SetNote> createState() => _SetNoteState();
}

class _SetNoteState extends State<SetNote> {
  var formKey = GlobalKey<FormState>();

  XFile? mainImage;
  var extraImages = <XFile>[];
  var relatives = <String>[];

  var scrollController = ScrollController();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  void initState() {
    initImages();
    initRelatives();
    initTextEditControllers();
    super.initState();
  }

  initTextEditControllers() {
    titleController.text = widget.initialData.title;
    descriptionController.text = widget.initialData.description;
    titleController.addListener(() => setState(() {}));
    descriptionController.addListener(() => setState(() {}));
    setState(() {});
  }

  initImages() {
    widget.initialData.images.asMap().forEach((index, value) {
      if (index == 0) {
        mainImage = XFile(value);
      } else {
        extraImages.add(XFile(value));
      }
    });
    setState(() {});
  }

  initRelatives() {
    relatives = widget.initialData.relatives;
    setState(() {});
  }

  onMainImageSelected({required XFile image}) {
    mainImage = image;
    setState(() {});

    Future.delayed(const Duration(milliseconds: 300)).then((value) =>
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500), curve: Curves.ease));
  }

  bool getSubmitDisabled() {
    if (allImages.isEmpty && titleController.text.isEmpty) {
      return true;
    }

    if (!listEquals(widget.initialData.relatives, relatives)) {
      return false;
    }

    if (widget.initialData.title != titleController.text) {
      return false;
    }

    if (widget.initialData.description != descriptionController.text) {
      return false;
    }

    if (!listEquals(widget.initialData.images,
        allImages.map((item) => item.path).toList())) {
      return false;
    }

    return true;
  }

  List<XFile> get allImages =>
      mainImage == null ? extraImages : [mainImage!, ...extraImages];

  List<String> getPathsToDelete() {
    var allImagesPaths = allImages.map((item) => item.path).toList();
    return widget.initialData.images
        .where((path) => !allImagesPaths.contains(path))
        .toList();
  }

  onSubmit() async {
    var newNoteData = NewNoteModel(
      title: titleController.text,
      description: descriptionController.text,
      relatives: relatives,
      localImages: allImages,
    );
    var result = widget.initialData.id.isEmpty
        ? await notesStore.create(newNoteData: newNoteData)
        : await notesStore.update(
            newNoteData: newNoteData,
            id: widget.initialData.id,
            pathToDelete: getPathsToDelete());
    if (result) {
      context.router.pop();
    }
  }

  addExtraImages() async {
    var newImages = await getMultiImagePicker();
    extraImages.addAll(newImages);
    setState(() {});
  }

  onExtraImageDelete(index) {
    extraImages.removeAt(index);
    setState(() {});
  }

  onEditRelativesPressed() {
    BottomSheetHelper.show(
        isScrollControlled: true,
        context: context,
        widget: RelativesSelectorListSheet(
          initialSelected: relatives,
          onSaveSelected: (result) {
            relatives = result;
            setState(() {});
          },
        ));
  }

  @override
  Widget build(BuildContext context) {

    Widget submitBlock = Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.marginHorizontal),
      child: Column(
        children: [
          Observer(
              builder: (_) => AppButton(
                title: 'Сохранить',
                onPressed: onSubmit,
                type: IAppButtonTypes.primary,
                disabled: getSubmitDisabled(),
                isLoading: notesStore.isLoading,
              )),
          AppButton(
            title: 'Отменить',
            onPressed: context.router.pop,
            type: IAppButtonTypes.link,
          ),
        ],
      ),
    );

    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          ImageWithUpload(
            path: mainImage?.path,
            onSelected: onMainImageSelected,
          ),
          Container(
              margin: EdgeInsets.only(
                  left: AppSizes.marginHorizontal,
                  right: AppSizes.marginHorizontal,
                  top: AppSizes.marginHorizontal),
              child: relatives.isEmpty
                  ? AppButton(
                      title: 'Отметить родственников',
                      icon: RelativesIcon(color: AppColors.primaryColor),
                      onPressed: onEditRelativesPressed,
                      type: IAppButtonTypes.link)
                  : MarkedRelatives(
                      userPics: getUserPicsList(relatives),
                      iconButton: AppIconButton(
                          onTap: onEditRelativesPressed,
                          icon: Icons.add,
                          borderColor: AppColors.primaryColor),
                    )),
          SizedBox(
            height: AppSizes.marginHorizontal,
          ),
          if (mainImage != null)
            Container(
              margin: EdgeInsets.all(AppSizes.marginHorizontal),
              child: AppButton(
                title: 'Добавить фотографии',
                onPressed: addExtraImages,
                type: IAppButtonTypes.secondary,
                icon: const Icon(Icons.photo_library_outlined),
              ),
            ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: AppSizes.marginHorizontal),
            child: Column(
              children: [
                TextFieldWidget(
                    controller: titleController, labelText: 'Описание'),
                SizedBox(height: AppSizes.inputVerticalMargin),
                TextFieldWidget(
                  controller: descriptionController,
                  minLines: 3,
                  maxLines: 15,
                  labelText: 'Подробное описание',
                  hintText:
                      'Укажите год, место, и какое событие запечатлено на фотографиях',
                ),
              ],
            ),
          ),
          extraImages.length > 3 ? Container(
            margin: EdgeInsets.symmetric(vertical: AppSizes.marginHorizontal),
            child: submitBlock,
          ) : const Separator(),
          ListView.separated(
            primary: false,
            shrinkWrap: true,
            itemCount: extraImages.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) => ImageWithButton(
                path: extraImages[index].path,
                icon: Icons.delete_outline_rounded,
                onTap: () {
                  onExtraImageDelete(index);
                }),
          ),
          if (extraImages.isNotEmpty) const SizedBox(height: 25),
          submitBlock,
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}
