import 'package:flutter/material.dart';
import 'package:jobick_shafeeque/core/moor_database/moor_database.dart';
import 'package:jobick_shafeeque/core/repositories/add_new_job_repository.dart';
import 'package:jobick_shafeeque/ui/views/add_new_job_view.dart';
import 'package:intl/intl.dart';
import 'base_model.dart';
import 'package:drift/drift.dart' as dr;

class AddNewJobViewModel extends BaseModel {
  final AddNewJobRepository repository;
  final AppDatabase db;
  AddNewJobViewModel({required this.repository,required this.db});



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


  void initialize(bool isEditMode,Job? tableData) {
    loadJobTypes();
    if (isEditMode) {
      _postedDateController.text = tableData!.columnPostedDate;
      _lastDateToApplyController.text = tableData.columnLastDateToApply;
      _closeDateController.text = tableData.columnCloseDate;
      _positionController.text = tableData.columnPosition;
      changeJobType(tableData.columnType);
      _character = tableData.columnStatus=='Active'?RadioValues.active:RadioValues.inActive;
    }
  }


  final _format = DateFormat("yyyy-MM-dd");

  get format => _format;
  final _form = GlobalKey<FormState>();
  final TextEditingController _postedDateController = TextEditingController();
  final TextEditingController _lastDateToApplyController = TextEditingController();
  final TextEditingController _closeDateController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  RadioValues _character = RadioValues.active;

  void disposeCall() {
    _postedDateController.dispose();
    _lastDateToApplyController.dispose();
    _closeDateController.dispose();
    _positionController.dispose();
  }

  get form => _form;

  TextEditingController get postedDateController => _postedDateController;

  TextEditingController get lastDateToApplyController =>
      _lastDateToApplyController;

  TextEditingController get closeDateController => _closeDateController;

  TextEditingController get positionController => _positionController;

  RadioValues get character => _character;


  void addOrEdit(bool isEditMode,Job? tableData,BuildContext context) {
    if (!_form.currentState!.validate()) {
      // notifyListeners();
      return;
    }
    if (isEditMode) {
      db
          .updateTask(Job(
          columnId: tableData!.columnId,
          columnPosition: positionController.text,
          columnType: selectedJobType!,
          columnPostedDate: postedDateController.text,
          columnLastDateToApply: lastDateToApplyController.text,
          columnCloseDate: closeDateController.text,
          columnStatus: character.index == 0
              ? 'Active'
              : 'InActive',
          columnActions: '',
      columnIsTitle: false,
      ))
          .then(
              (value) => Navigator.of(context).pop(true));
    } else {
      db
          .insertTask(JobsCompanion(
          columnPosition: dr.Value(positionController.text),
          columnType: dr.Value(selectedJobType!),
          columnPostedDate: dr.Value(postedDateController.text),
          columnLastDateToApply: dr.Value(lastDateToApplyController.text),
          columnCloseDate: dr.Value(closeDateController.text),
          columnStatus: dr.Value(character.index == 0
              ? 'Active'
              : 'InActive'),
          columnActions: const dr.Value('')))
          .then(
              (value) => Navigator.of(context).pop(true));
    }
  }

  void updateRadioValue(RadioValues? value) {
    _character = value!;
    notifyListeners();
  }
}
