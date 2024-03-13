import 'package:flutter/material.dart';
import 'package:ser/components/constant/them.dart';
import 'package:dropdown_search/dropdown_search.dart';

class LocationSettingPage extends StatelessWidget {
  const LocationSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            MyDropdown(),
            MyDropdown(),
            SizedBox(
              height: 30,
            ),
            TextField(
              maxLines: 10,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> lc = [
  "Strineet 1",
  "Strineet 2",
  "Strineet 3",
];

class MyDropdown extends StatelessWidget {
  const MyDropdown({super.key});
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      // selectedItem: list.first,

      popupProps: const PopupProps.menu(),
      items: lc,
      itemAsString: (item) => item,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MyThem.secondaryColor)),
          suffixIconColor: MyThem.secondaryColor,
          labelText: "Loction",
          labelStyle: MyThem.nfontStyle.copyWith(
              color: MyThem.secondaryColor, fontWeight: FontWeight.bold),
          hintText: "Loc",
        ),
      ),
      onChanged: (value) {},
    );
  }
}
