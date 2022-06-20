import 'package:flutter/material.dart';
import 'package:jobick_shafeeque/constants.dart';
import 'package:jobick_shafeeque/models/table_model.dart';
import 'package:jobick_shafeeque/res/db.dart';
import 'package:jobick_shafeeque/res/utils.dart';
import 'package:jobick_shafeeque/responsive.dart';
import 'package:jobick_shafeeque/screens/add_new_job_screen/add_new_job_viewmodel.dart';
import 'package:jobick_shafeeque/screens/dashboard/components/app_bar.dart';
import 'package:jobick_shafeeque/widgets/custom_icon_button_widget.dart';
import 'package:jobick_shafeeque/widgets/rounded_input_field_widget.dart';
import 'package:intl/intl.dart';

class AddNewJobScreen extends StatefulWidget {
  final bool isEditMode;
  final TableModel? tableData;
  const AddNewJobScreen({Key? key, required this.isEditMode, this.tableData})
      : super(key: key);

  @override
  _AddNewJobScreenState createState() => _AddNewJobScreenState();
}

class _AddNewJobScreenState extends State<AddNewJobScreen> {
  late AddNewJobViewModel _model;
  final _format = DateFormat("yyyy-MM-dd");
  final _form = GlobalKey<FormState>();
  final TextEditingController _postedDateController = TextEditingController();
  final TextEditingController _lastDateToApplyController = TextEditingController();
  final TextEditingController _closeDateController = TextEditingController();
  // final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  // final TextEditingController _noOfVacancyController = TextEditingController();
  // final TextEditingController _descriptionController = TextEditingController();
  RadioValues _character = RadioValues.active;

  @override
  void dispose() {
    _postedDateController.dispose();
    _lastDateToApplyController.dispose();
    _closeDateController.dispose();
    _positionController.dispose();
    // _noOfVacancyController.dispose();
    // _descriptionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _model = AddNewJobViewModel();
    _model.loadJobCategories();
    _model.loadJobTypes();
    if (widget.isEditMode) {
      _postedDateController.text = widget.tableData!.postedDate!;
      _lastDateToApplyController.text = widget.tableData!.lastDateToApply!;
      _closeDateController.text = widget.tableData!.closeDate!;
      _positionController.text = widget.tableData!.position!;
      _model.changeJobType(widget.tableData!.type!);
      _character = widget.tableData!.status=='Active'?RadioValues.active:RadioValues.inActive;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (Responsive.isDesktop(context)) buildCardFormDesktop(context),
          if (!Responsive.isDesktop(context))
            Container(
                child: const AppBarWidget(),
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: Responsive.isDesktop(context) ? 20 : 6)),
          if (!Responsive.isDesktop(context))
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    const SizedBox(height: defaultPadding),
                    Row(
                      children: [
                        Text(
                          "New Job",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        CustomIconButtonWidget(
                          icon: Icons.mail,
                          backgroundColor: Colors.teal,
                          iconColor: Colors.white,
                          boarderRadius: 19,
                          onTap: () {},
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomIconButtonWidget(
                          icon: Icons.phone,
                          backgroundColor: Colors.teal,
                          iconColor: Colors.white,
                          boarderRadius: 19,
                          onTap: () {},
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomIconButtonWidget(
                          icon: Icons.height,
                          backgroundColor: Colors.red,
                          iconColor: Colors.white,
                          boarderRadius: 19,
                          horizontalPadding: 6,
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    buildCardFormMobile(context)
                  ],
                ),
              ),
            ),
        ],
      ),
      // floatingActionButton: ,
    );
  }

  Card buildCardFormMobile(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        // side: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(defaultPadding),
            bottomLeft: Radius.circular(defaultPadding)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: defaultPadding * 2,
              ),
              const FieldTitleWithStar(titleName: 'Position'),
              const SizedBox(
                height: defaultPadding / 1.5,
              ),
              RoundedInputField(
                hintText: "Name",
                onChanged: (value) {},
                controller: _positionController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Field position is mandatory.';
                  } else if (!RegExp(r'^[a-zA-Z0-9\_@.]+$').hasMatch(value)) {
                    return 'Please provide a valid value..';
                  }
                  return null;
                },
              ),
              const FieldTitleWithStar(
                  titleName: 'Job Type', topPadding: defaultPadding * 2),
              const SizedBox(
                height: defaultPadding / 1.5,
              ),
              DropdownButtonFormField(
                validator: (value) {
                  if (value == null) {
                    return 'Choose job Type.';
                  }
                  return null;
                },
                isExpanded: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kPrimaryLightColor,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: !Responsive.isDesktop(context)
                          ? Responsive.screenWidth(context) * .03
                          : Responsive.screenWidth(context) * .01,
                      vertical: Responsive.screenHeight(context) * .001),
                  hintText: 'Choose',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
                value: _model.selectedJobType,
                items: _model.dropdownMenuItemsJobType,
                onChanged: _model.changeJobType,
              ),

              const FieldTitleWithStar(
                  titleName: 'Posted Date', topPadding: defaultPadding * 2),
              const SizedBox(
                height: defaultPadding / 1.5,
              ),
              RoundedInputField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Choose posted date.';
                  }
                  return null;
                },
                hintText: "Select",
                controller: _postedDateController,
                readOnly: true,
                onTap: () async {
                  DateTime? date = await Utils.getDateFromDatePicker(context);

                  _postedDateController.text = _format.format(date!);
                },
                // icon: Icons.access_time,
              ),
              const FieldTitleWithStar(
                  titleName: 'Last Date To Apply', topPadding: defaultPadding * 2),
              const SizedBox(
                height: defaultPadding / 1.5,
              ),
              RoundedInputField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Choose last date to apply.';
                  }
                  return null;
                },
                hintText: "Select",
                controller: _lastDateToApplyController,
                readOnly: true,
                onTap: () async {
                  DateTime? date = await Utils.getDateFromDatePicker(context);

                  _lastDateToApplyController.text = _format.format(date!);
                },
                // icon: Icons.access_time,
              ),
              const FieldTitleWithStar(
                  titleName: 'Close Date', topPadding: defaultPadding * 2),
              const SizedBox(
                height: defaultPadding / 1.5,
              ),
              RoundedInputField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Choose close date.';
                  }
                  return null;
                },
                hintText: "Select",
                controller: _closeDateController,
                readOnly: true,
                onTap: () async {
                  DateTime? date = await Utils.getDateFromDatePicker(context);

                  _closeDateController.text = _format.format(date!);
                },
                // icon: Icons.access_time,
              ),

              const SizedBox(
                height: defaultPadding * 2,
              ),
              Row(
                children: [
                  const Text('Status:'),
                  Radio<RadioValues>(
                    value: RadioValues.active,
                    groupValue: _character,
                    onChanged: (RadioValues? value) {
                      setState(() {
                        _character = value!;
                      });
                    },
                  ),
                  const Text('Active'),
                  Radio<RadioValues>(
                    value: RadioValues.inActive,
                    groupValue: _character,
                    onChanged: (RadioValues? value) {
                      setState(() {
                        _character = value!;
                      });
                    },
                  ),
                  const Text('In Active'),
                ],
              ),
              const SizedBox(
                height: defaultPadding * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextButtonWidget(
                    title: 'Close',
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    boarderRadius: 12,
                    // horizontalPadding: 14,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    width: defaultPadding,
                  ),
                  CustomTextButtonWidget(
                    title: 'Submit',
                    backgroundColor: Colors.teal,
                    textColor: Colors.white,
                    boarderRadius: 12,
                    // horizontalPadding: 14,
                    onTap: () {
                      if (!_form.currentState!.validate()) {
                        return;
                      }
                      if (widget.isEditMode) {
                        db
                            .updateJob(TableModel(
                                id: widget.tableData!.id,
                                position: _positionController.text,
                                type: _model.selectedJobType,
                                postedDate: _postedDateController.text,
                                lastDateToApply: _lastDateToApplyController.text,
                                closeDate: _closeDateController.text,
                                status: _character.index == 0
                                    ? 'Active'
                                    : 'InActive',
                                actions: null,
                                isTitle: false))
                            .then((value) => Navigator.of(context).pop(true));
                      } else {
                        db
                            .addJob(TableModel(
                                position: _positionController.text,
                                type: _model.selectedJobType,
                                postedDate: _postedDateController.text,
                                lastDateToApply: _lastDateToApplyController.text,
                                closeDate: _closeDateController.text,
                                status: _character.index == 0
                                    ? 'Active'
                                    : 'InActive',
                                actions: null,
                                isTitle: false))
                            .then((value) => Navigator.of(context).pop(true));
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardFormDesktop(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Card(
          elevation: 0,
          shape: const RoundedRectangleBorder(
            // side: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(defaultPadding),
                bottomLeft: Radius.circular(defaultPadding)),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Job",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: defaultPadding / 1.5,
                  ),
                  FormRowWidget(
                    firstChild: Column(
                      children: [
                        const FieldTitleWithStar(titleName: 'Position',topPadding: defaultPadding * 2),
                        const SizedBox(
                          height: defaultPadding / 1.5,
                        ),
                        RoundedInputField(
                          hintText: "Name",
                          onChanged: (value) {},
                          controller: _positionController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field company name is mandatory.';
                            } else if (!RegExp(r'^[a-zA-Z0-9\_@. ]+$')
                                .hasMatch(value)) {
                              return 'Please provide a valid value.';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    secondChild: Column(
                      children: [
                        const FieldTitleWithStar(
                            titleName: 'Job Type', topPadding: defaultPadding * 2),
                        const SizedBox(
                          height: defaultPadding / 1.5,
                        ),
                        DropdownButtonFormField(
                          validator: (value) {
                            if (value == null) {
                              return 'Choose job Type.';
                            }
                            return null;
                          },
                          isExpanded: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: kPrimaryLightColor,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: !Responsive.isDesktop(context)
                                    ? Responsive.screenWidth(context) * .03
                                    : Responsive.screenWidth(context) * .01,
                                vertical: Responsive.screenHeight(context) * .001),
                            hintText: 'Choose',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                          value: _model.selectedJobType,
                          items: _model.dropdownMenuItemsJobType,
                          onChanged: _model.changeJobType,
                        ),
                      ],
                    ),
                  ),

                  FormRowWidget(
                    firstChild: Column(
                      children: [
                        const FieldTitleWithStar(
                            titleName: 'Posted Date',
                            topPadding: defaultPadding * 2),
                        const SizedBox(
                          height: defaultPadding / 1.5,
                        ),
                        RoundedInputField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Choose posted date.';
                            }
                            return null;
                          },
                          hintText: "Select",
                          controller: _postedDateController,
                          readOnly: true,
                          onTap: () async {
                            DateTime? date =
                                await Utils.getDateFromDatePicker(context);

                            _postedDateController.text = _format.format(date!);
                          },
                          // icon: Icons.access_time,
                        ),
                      ],
                    ),
                    secondChild: Column(
                      children: [
                        const FieldTitleWithStar(
                            titleName: 'Last Date To Apply', topPadding: defaultPadding * 2),
                        const SizedBox(
                          height: defaultPadding / 1.5,
                        ),
                        RoundedInputField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Choose last date to apply.';
                            }
                            return null;
                          },
                          hintText: "Select",
                          controller: _lastDateToApplyController,
                          readOnly: true,
                          onTap: () async {
                            DateTime? date = await Utils.getDateFromDatePicker(context);

                            _lastDateToApplyController.text = _format.format(date!);
                          },
                          // icon: Icons.access_time,
                        ),
                      ],
                    ),
                  ),
                  FormRowWidget(
                    firstChild: Column(
                      children: [
                        const FieldTitleWithStar(
                            titleName: 'Close Date', topPadding: defaultPadding * 2),
                        const SizedBox(
                          height: defaultPadding / 1.5,
                        ),
                        RoundedInputField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Choose close date.';
                            }
                            return null;
                          },
                          hintText: "Select",
                          controller: _closeDateController,
                          readOnly: true,
                          onTap: () async {
                            DateTime? date = await Utils.getDateFromDatePicker(context);

                            _closeDateController.text = _format.format(date!);
                          },
                          // icon: Icons.access_time,
                        ),
                      ],
                    ),
                    secondChild: Column(
                      children: [
                        const FieldTitleWithStar(
                            titleName: 'Last Date To Apply', topPadding: defaultPadding * 2),
                        const SizedBox(
                          height: defaultPadding / 1.5,
                        ),
                        RoundedInputField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Choose last date to apply.';
                            }
                            return null;
                          },
                          hintText: "Select",
                          controller: _lastDateToApplyController,
                          readOnly: true,
                          onTap: () async {
                            DateTime? date = await Utils.getDateFromDatePicker(context);

                            _lastDateToApplyController.text = _format.format(date!);
                          },
                          // icon: Icons.access_time,
                        ),

                      ],
                    ),
                  ),


                  const SizedBox(
                    height: defaultPadding * 2,
                  ),
                  Row(
                    children: [
                      const Text('Status:'),
                      Radio<RadioValues>(
                        value: RadioValues.active,
                        groupValue: _character,
                        onChanged: (RadioValues? value) {
                          setState(() {
                            _character = value!;
                          });
                        },
                      ),
                      const Text('Active'),
                      Radio<RadioValues>(
                        value: RadioValues.inActive,
                        groupValue: _character,
                        onChanged: (RadioValues? value) {
                          setState(() {
                            _character = value!;
                          });
                        },
                      ),
                      const Text('In Active'),
                    ],
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTextButtonWidget(
                        title: 'Close',
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        boarderRadius: 12,
                        // horizontalPadding: 14,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(
                        width: defaultPadding,
                      ),
                      CustomTextButtonWidget(
                        title: 'Submit',
                        backgroundColor: Colors.teal,
                        textColor: Colors.white,
                        boarderRadius: 12,
                        // horizontalPadding: 14,
                        onTap: () {
                          if (!_form.currentState!.validate()) {
                            return;
                          }
                          if (widget.isEditMode) {
                            db
                                .updateJob(TableModel(
                                    id: widget.tableData!.id,
                                    position: _positionController.text,
                                    type: _model.selectedJobType,
                                    postedDate: _postedDateController.text,
                                    lastDateToApply: _lastDateToApplyController.text,
                                    closeDate: _closeDateController.text,
                                    status: _character.index == 0
                                        ? 'Active'
                                        : 'InActive',
                                    actions: null,
                                    isTitle: false))
                                .then(
                                    (value) => Navigator.of(context).pop(true));
                          } else {
                            db
                                .addJob(TableModel(
                                    position: _positionController.text,
                                    type: _model.selectedJobType,
                                    postedDate: _postedDateController.text,
                                    lastDateToApply: _lastDateToApplyController.text,
                                    closeDate: _closeDateController.text,
                                    status: _character.index == 0
                                        ? 'Active'
                                        : 'InActive',
                                    actions: null,
                                    isTitle: false))
                                .then(
                                    (value) => Navigator.of(context).pop(true));
                          }
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Db db = Db();


}

class FormRowWidget extends StatelessWidget {
  const FormRowWidget({
    Key? key,
    required this.firstChild,
    required this.secondChild,
  }) : super(key: key);

  final Widget firstChild;
  final Widget secondChild;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: firstChild,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: secondChild,
        ),
      ],
    );
  }
}

enum RadioValues { active, inActive }

class FieldTitleWithStar extends StatelessWidget {
  final titleName;
  final leftPadding;
  final rightPadding;
  final topPadding;
  const FieldTitleWithStar(
      {Key? key,
      required this.titleName,
      this.leftPadding = 0.0,
      this.rightPadding = 0.0,
      this.topPadding = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: leftPadding, right: rightPadding, top: topPadding),
      child: Row(
        children: [
          Text(
            titleName,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const Baseline(
            baseline: 4,
            baselineType: TextBaseline.alphabetic,
            child: Text(
              ' *',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class CustomTextButtonWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final double boarderRadius;
  final double horizontalPadding;
  final double verticalPadding;

  final VoidCallback onTap;
  const CustomTextButtonWidget(
      {Key? key,
      required this.title,
      required this.backgroundColor,
      required this.textColor,
      this.boarderRadius = 36,
      this.horizontalPadding = 10,
      this.verticalPadding = 10,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Text(title, style: TextStyle(color: textColor)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(boarderRadius),
          color: backgroundColor,
        ),
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
      ),
    );
  }
}
