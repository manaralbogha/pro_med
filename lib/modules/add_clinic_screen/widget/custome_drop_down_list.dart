import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/cubit/cubit.dart';
import '../../../controller/cubit/states.dart';

class CustomDropDownList extends StatefulWidget {
  final double? width;
  final List<String> items;
  final String hintText;
  final String? typeTime;
  final String? type;
  final int? index;
  //final void Function(String?)? onChanged;
  String? selectedOption;
  CustomDropDownList({
    super.key,
    this.width,
    required this.items,
    this.typeTime,
    this.type,
    required this.hintText,
    this.index,

    // required this.onChanged,
    required this.selectedOption,
  });

  @override
  State<CustomDropDownList> createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          return Material(
            elevation: 8,
            shadowColor: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.only(right: 5, left: 24),
              width: widget.width ?? MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Color(0xffE0E0E0),
                ),
              ),
              child: Center(
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(8),
                  isExpanded: true,
                  icon: const Icon(
                    Icons.expand_more,
                    size: 40,
                    color: Color(0xff34AFE0),
                  ),
                  value: widget.selectedOption,
                  onChanged: (newValue) {
                    setState(() {
                      widget.selectedOption = newValue;
                      if (widget.typeTime == "from") {
                        cubit.dayTime[cubit.day[widget.index!.toInt()]]![
                            "from"] = widget.selectedOption.toString();
                      } else if (widget.typeTime == "to") {
                        cubit.dayTime[cubit.day[widget.index!.toInt()]]!["to"] =
                            widget.selectedOption.toString();
                      } else if (widget.type == "Specialty") {
                        cubit.selectedSpecialty = widget.selectedOption;
                      } else if (widget.type == "Country") {
                        cubit.selectedCountry = widget.selectedOption;
                      } else if (widget.type == "City") {
                        cubit.selectedCity = widget.selectedOption;
                      }
                      print(cubit.dayTime);
                      print(cubit.selectedSpecialty);
                      print(cubit.selectedCountry);
                      print(cubit.selectedCity);
                    });
                    // cubit.itemSelected(newValue, widget.selectedOption);
                  },
                  items: widget.items.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  hint: Text(
                    widget.hintText,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  underline: const SizedBox(),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
