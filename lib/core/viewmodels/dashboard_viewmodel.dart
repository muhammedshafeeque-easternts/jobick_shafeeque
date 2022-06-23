import 'package:flutter/material.dart';
import 'package:jobick_shafeeque/core/models/table_model.dart';
import 'package:jobick_shafeeque/core/repositories/dashboard_repository.dart';
import 'package:jobick_shafeeque/core/res/db.dart';
import 'base_model.dart';

class DashBoardViewModel extends BaseModel {
  final DashBoardRepository repository;
  final Db db;
  DashBoardViewModel({required this.repository, required this.db});



  List<TableModel>? _tableValues;



  void initialize() {
    db.getAllJobs().then((value) {
      if (value.isNotEmpty) {
        _tableValues = value;
        notifyListeners();
      } else {
        db.addJob(TableModel(
            position: "Position",
            type: "Type",
            postedDate: "Posted Date",
            lastDateToApply: 'Last Date To Apply',
            closeDate: 'Close Date',
            status: 'Status',
            actions: 'Actions',
            isTitle: true));
        db.getAllJobs().then((value) {
          _tableValues = value;
          notifyListeners();
        });
      }
    });
  }

  List<TableModel>? get tableValues => _tableValues;

  void getAllJobs() {
    db.getAllJobs().then((value) {
      _tableValues = value;
      notifyListeners();
    });
  }

  void deleteJob(TableModel item) {
    db.deleteJob(item.id!).then((value) {
      tableValues!.remove(item);
      notifyListeners();
    });
  }
}
