import 'package:OfferApp/src/model/categoria.dart';
import 'package:flutter/material.dart';
import 'package:category_picker/category_picker.dart';
import 'package:category_picker/category_picker_item.dart';

class CategoriesSwiper extends StatelessWidget {
  final List<Categoria> categoria;
  final List<CategoryPickerItem> elementos = [];

  CategoriesSwiper({@required this.categoria});
  @override
  Widget build(BuildContext context) {
    for (var item in categoria) {
      final card = CategoryPickerItem(
        value: item.getName(),
      );
      elementos.add(card);
    }
    return CategoryPicker(
      unselectedItemBorderColor: Colors.transparent,
      selectedItemTextLightThemeColor: Colors.black,
      unselectedItemColor: Colors.white,
      selectedItemColor: Color.fromRGBO(82, 78, 255, 1),
      unselectedItemTextLightThemeColor: Colors.black26,
      items: elementos,
      itemHeight: 35,
      itemLabelFontSize: 16,
      itemMargin: const EdgeInsets.only(right: 11),
      onValueChanged: (value) {},
    );
  }
}
