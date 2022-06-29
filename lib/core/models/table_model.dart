
import 'package:hive/hive.dart';
part 'table_model.g.dart';

@HiveType(typeId: 0)
class JobModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String type;
  @HiveField(2)
  final String position;
  @HiveField(3)
  final String postedDate;
  @HiveField(4)
  final String lastDateToApply;
  @HiveField(5)
  final String closeDate;
  @HiveField(6)
  final String status;
  @HiveField(7)
  final String actions;
  @HiveField(8)
  final bool isTitle;

  JobModel(
      {required this.type,
      required this.position,
      required this.id,
      required this.postedDate,
      required this.actions,
      required this.closeDate,
      required this.lastDateToApply,
      required this.status,
      required this.isTitle});

/*  factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
    // offerCodeBanner: List<OfferCodeBanner>.from(json["offer_code_banner"].map((x) => OfferCodeBanner.fromJson(x))),
    id: json["id"],
    position: json["position"],
    type: json["type"],
    postedDate: json["posted_date"],
    lastDateToApply: json["last_date_to_apply"],
    closeDate: json["close_date"],
    status: json["status"],
    actions: json['actions'],
    isTitle: json["is_title"]==0?false:true,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "position": position,
    "type": type,
    "posted_date": postedDate,
    "last_date_to_apply": lastDateToApply,
    "close_date": closeDate,
    "status": status,
    "actions": actions,
    "is_title": isTitle?1:0,
  };*/

}

/*final List <TableModel>tableFiles = [
  TableModel(
      type: "Type",
      position: "Position",
      id: "No",
      postedDate: "Posted Date",
      lastDateToApply: 'Last Date To Apply',
      closeDate: 'Close Date',
      status: 'Status',
      actions:'Actions',
      isTitle: true

  ),
  TableModel(
    type: "Full-Time",
    position: "SQL Developer",
    id: "1",
    postedDate: "12-01-2021",
    lastDateToApply: '24-01-2021',
    closeDate: '25-01-2021',
    status: 'Active',
  ),
  TableModel(

    type: "Full-Time",
    position: "Network engineer",
    id: "2",
    postedDate: "12-01-2021",
    lastDateToApply: '24-01-2021',
    closeDate: '25-01-2021',
    status: 'Active',
  ),
  TableModel(
    type: "Full-Time",
    position: "Junior Developer",
    id: "3",
    postedDate: "12-01-2021",
    lastDateToApply: '24-01-2021',
    closeDate: '25-01-2021',
    status: 'InActive',
  ),
  TableModel(
    type: "Full-Time",
    position: "Java Developer",
    id: "4",
    postedDate: "12-01-2021",
    lastDateToApply: '24-01-2021',
    closeDate: '25-01-2021',
    status: 'Active',
  ),
  TableModel(

    type: "Full-Time",
    position: "Ios Developer",
    id: "5",
    postedDate: "12-01-2021",
    lastDateToApply: '24-01-2021',
    closeDate: '25-01-2021',
    status: 'Active',
  ),
  TableModel(
    type: "Full-Time",
    position: "Entry Level Developer",
    id: "6",
    postedDate: "12-01-2021",
    lastDateToApply: '24-01-2021',
    closeDate: '25-01-2021',
    status: 'Active',
  ),
  TableModel(
    type: "Full-Time",
    position: "Flutter Developer",
    id: "7",
    postedDate: "12-01-2021",
    lastDateToApply: '24-01-2021',
    closeDate: '25-01-2021',
    status: 'InActive',
  ),
  TableModel(
    type: "Full-Time",
    position: "React Developer",
    id: "8",
    postedDate: "12-01-2021",
    lastDateToApply: '24-01-2021',
    closeDate: '25-01-2021',
    status: 'Active',
  ),
];*/
