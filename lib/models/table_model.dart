class TableModel {
  final String? type, position, no, postedDate,lastDateToApply,closeDate,status,actions;
  final bool isTitle;

  TableModel({this.type, this.position, this.no, this.postedDate,this.actions,this.closeDate,this.lastDateToApply,this.status,this.isTitle=false});
}



List <TableModel>demoRecentFiles = [
  TableModel(
    type: "Type",
    position: "Position",
    no: "No",
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
    no: "1",
    postedDate: "12-01-2021",
    lastDateToApply: '24-01-2021',
    closeDate: '25-01-2021',
    status: 'Active',
  ),
  TableModel(

    type: "Full-Time",
    position: "Network engineer",
    no: "2",
    postedDate: "12-01-2021",
    lastDateToApply: '24-01-2021',
    closeDate: '25-01-2021',
    status: 'Active',
  ),
  TableModel(
    type: "Full-Time",
    position: "Junior Developer",
    no: "3",
    postedDate: "12-01-2021",
    lastDateToApply: '24-01-2021',
    closeDate: '25-01-2021',
    status: 'InActive',
  ),
  TableModel(
    type: "Full-Time",
    position: "Java Developer",
    no: "4",
    postedDate: "12-01-2021",
    lastDateToApply: '24-01-2021',
    closeDate: '25-01-2021',
    status: 'Active',
  ),
  TableModel(

    type: "Full-Time",
    position: "Ios Developer",
    no: "5",
    postedDate: "12-01-2021",
    lastDateToApply: '24-01-2021',
    closeDate: '25-01-2021',
    status: 'Active',
  ),
  TableModel(
    type: "Full-Time",
    position: "Entry Level Developer",
    no: "6",
    postedDate: "12-01-2021",
    lastDateToApply: '24-01-2021',
    closeDate: '25-01-2021',
    status: 'Active',
  ),
  TableModel(
    type: "Full-Time",
    position: "Flutter Developer",
    no: "7",
    postedDate: "12-01-2021",
    lastDateToApply: '24-01-2021',
    closeDate: '25-01-2021',
    status: 'InActive',
  ),
  TableModel(
    type: "Full-Time",
    position: "React Developer",
    no: "8",
    postedDate: "12-01-2021",
    lastDateToApply: '24-01-2021',
    closeDate: '25-01-2021',
    status: 'Active',
  ),
];
