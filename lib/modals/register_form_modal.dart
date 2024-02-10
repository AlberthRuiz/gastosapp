import 'package:flutter/material.dart';
import 'package:gastosapp/utils/data_general.dart';
import 'package:gastosapp/widgets/item_type_widget.dart';
import 'package:gastosapp/widgets/textfield_normal_widget.dart';
import 'package:intl/intl.dart';

class Registermodal extends StatefulWidget {
  const Registermodal({super.key});

  @override
  State<Registermodal> createState() => _RegistermodalState();
}

class _RegistermodalState extends State<Registermodal> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  String? typeSelected;
  showDateTimePicker() async {
    DateTime? datepicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: Color(0xff101321),
              ),
              dialogTheme: DialogTheme(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              )),
          child: child!,
        );
      },
    );
    if (datepicker != null) {
      final DateFormat _formatter = DateFormat("dd/MM/yyyy");
      _dateController.text = _formatter.format(datepicker);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(34),
          topRight: Radius.circular(34),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Registrar salida",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Divider(),
          TextFieldNormalWidget(
            hintText: "Ingresa un título",
            controller: _titleController,
            // isDatePicket: false,
          ),
          TextFieldNormalWidget(
            controller: _priceController,
            hintText: "Ingresa el precio",
            isNumber: true,
            // isDatePicket: false,
          ),
          TextFieldNormalWidget(
            controller: _dateController,
            hintText: "Selecciona la fecha",
            // isNumber: false,
            isDatePicket: true,
            onTap: () {
              showDateTimePicker();
            },
          ),
          SizedBox(
            height: 16,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8.0,
            runSpacing: 10.0,
            children: types
                .map((e) => ItemTypeGastoWidget(
                      title: e["name"],
                      assetPath: e["image"],
                      isSelected: e["name"] == typeSelected,
                      onTap: () {
                        typeSelected = e["name"];
                        setState(() {});
                      },
                    ))
                .toList(),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff101321),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Agregar",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
