import 'package:flutter/material.dart';
// import 'package:jobick_shafeeque/core/base_model.dart';

class AddNewJobViewModel {
  String? _selectedJobCategory;
  final List<String> _jobCategoryResp = [
    'QA Manager',
    'IT Manager',
    'System Analyst'
  ];
  List<DropdownMenuItem<String>> _dropdownMenuItemsJobCategory = [];

  void changeJobCategory(String? value) {
    _selectedJobCategory = value!;
  }

  void loadJobCategories() {
    _dropdownMenuItemsJobCategory =
        buildDropdownMenuItemsJobCategory(_jobCategoryResp);
  }

  List<DropdownMenuItem<String>> buildDropdownMenuItemsJobCategory(List items) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String item in items) {
      dropDownItems.add(
        DropdownMenuItem(
          value: item,
          child: Text(
            item,
          ),
        ),
      );
    }
    return dropDownItems;
  }

  String? get selectedJobCategory => _selectedJobCategory;

  List<DropdownMenuItem<String>> get dropdownMenuItemsJobCategory =>
      _dropdownMenuItemsJobCategory;

  String? _selectedJobType;
  final List<String> _jobTypeResp = ['Part-Time', 'Full-Time', 'Freelancer'];
  List<DropdownMenuItem<String>> _dropdownMenuItemsJobType = [];

  void changeJobType(String? value) {
    _selectedJobType = value!;
  }

  void loadJobTypes() {
    _dropdownMenuItemsJobType = buildDropdownMenuItemsJobType(_jobTypeResp);
  }

  List<DropdownMenuItem<String>> buildDropdownMenuItemsJobType(List items) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String item in items) {
      dropDownItems.add(
        DropdownMenuItem(
          value: item,
          child: Text(
            item,
          ),
        ),
      );
    }
    return dropDownItems;
  }

  String? get selectedJobType => _selectedJobType;

  List<DropdownMenuItem<String>> get dropdownMenuItemsJobType =>
      _dropdownMenuItemsJobType;
}
