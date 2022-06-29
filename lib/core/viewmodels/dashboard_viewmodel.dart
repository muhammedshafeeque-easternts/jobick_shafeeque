import 'package:jobick_shafeeque/core/moor_database/moor_database.dart';
import 'package:jobick_shafeeque/core/repositories/dashboard_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:drift/drift.dart' as dr;
part 'dashboard_viewmodel.g.dart';

class DashBoardViewModel extends _DashBoardViewModel with _$DashBoardViewModel {
  DashBoardViewModel(DashBoardRepository repository,AppDatabase db) : super(repository,db);
}

enum StoreState { initial, loading, loaded }

abstract class _DashBoardViewModel with Store {
  final DashBoardRepository repository;
  final AppDatabase db;
  _DashBoardViewModel(this.repository,this.db);




  @observable
  List<Job>? tableValues;

/*  @computed
  StoreState get state {
    if (_tableValuesFuture == null ||
        _tableValuesFuture!.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _tableValuesFuture!.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }*/

  @action
  Future<void> initialize()async {
    db.getAllJobs().then((value) {
      tableValues = value;
      if(tableValues!.isEmpty){
        db.insertTask(const JobsCompanion(
            columnPosition: dr.Value("Position"),
            columnType: dr.Value("Type"),
            columnPostedDate: dr.Value("Posted Date"),
            columnLastDateToApply: dr.Value('Last Date To Apply'),
            columnCloseDate: dr.Value('Close Date'),
            columnStatus: dr.Value('Status'),
            columnActions: dr.Value('Actions'),
            columnIsTitle: dr.Value(true)));
        db.getAllJobs().then((value) {
          tableValues = value;
        });
      }
    });


  }


  @action
  Future<void> getAllJobs() async{
        db.getAllJobs().then((value) {
          tableValues = value;
        });
  }

  @action
  void deleteJob(Job item) {
    db.deleteTask(item).then((value) {
      tableValues!.remove(item);
    });
  }

}
