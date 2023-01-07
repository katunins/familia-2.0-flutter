import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/common/button.dart';
import 'package:familia_flutter/components/relatives/relatives_list_sheet_component.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../../helpers/util.helper.dart';
import '../../helpers/bottom_sheet.dart';
import '../../routers/app_router.gr.dart';

/// BottomSheet со списком пользователея и родственников, которые можно выбрать
/// excluded - список id, которые нужно исключить из списка
/// onSubmit (userId) - callBack выбора
/// hideAddRelativeButton - скрыть кнопку добавления родственника

class RelativesListSheet extends StatelessWidget {
  const RelativesListSheet({
    Key? key,
    required this.onSelected,
    this.excluded,
    this.hideAddRelativeButton = false,
  }) : super(key: key);

  final Function(String userId) onSelected;
  final List<String>? excluded;
  final bool hideAddRelativeButton;

  @override
  Widget build(BuildContext context) => Observer(builder: (_) {
        var elements = getAllUsers(excluded: excluded);

        addUserCallback() {
          context.router.popAndPush(CreateNewRelativeRouter(
              hideBottomSheetAddRelativeButton: true,
              finishCallback: (relativeId) {
                if (relativeId == null) {
                  return;
                }
                onSelected(relativeId);
                BottomSheetHelper.message(
                    context:
                        GetIt.I<AppRouter>().navigatorKey.currentState!.context,
                    message:
                        'Новый родственник добавлен в качестве родителя. Не забудьте сохранить изменения');
              }));
        }

        return RelativesListSheetComponent(
          relatives: elements,
          onTapElement: (id) {
            onSelected(id);
            Navigator.of(context).pop();
          },
          button: hideAddRelativeButton
              ? null
              : AppButton(
                  title: 'Добавить родтсвенника',
                  onPressed: addUserCallback,
                  type: IAppButtonTypes.secondary),
        );
      });
}
