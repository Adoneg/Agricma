import 'dart:io';

import 'package:agricu/enums/fetch_state_enum.dart';
import 'package:agricu/routes/route_names.dart';
import 'package:agricu/screens/profile/bloc/profile_bloc.dart';
import 'package:agricu/screens/request_to_sell/bloc/request_to_sell_bloc.dart';
import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:agricu/widgets/custom_snackbars.dart';
import 'package:agricu/widgets/outline_button.dart';
import 'package:agricu/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

final requestToSellKey = GlobalKey<FormState>();

class RequestToSell extends StatefulWidget {
  const RequestToSell({super.key});

  @override
  State<RequestToSell> createState() => _RequestToSellState();
}

class _RequestToSellState extends State<RequestToSell> {
  File? _selectedImage;

  Future<void> _pickImage(ImageSource source, RequestToSellBloc bloc) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      bloc.add(OnLogo(logo: pickedFile));
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _clearImage(RequestToSellBloc bloc) {
    bloc.add(OnLogo(logo: null));
    setState(() {
      _selectedImage = null;
    });
  }

  String selectedWorkingHours = '';

  void _showWorkingHoursDialog(RequestToSellBloc bloc, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TimeOfDay startTime = TimeOfDay(hour: 9, minute: 0);
        TimeOfDay endTime = TimeOfDay(hour: 17, minute: 0);
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStat) {
            return AlertDialog(
              title: Text(
                'Select Working Hours',
                style: AppStyles.regular,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text(
                      '9 AM - 5 PM',
                      style: AppStyles.regular,
                    ),
                    onTap: () {
                      bloc.add(
                          OnWorkingHours(startTime: '09:00', endTime: '17:00'));
                      setState(() {
                        selectedWorkingHours = '09:00 - 17:00';
                      });

                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      '8 AM - 4 PM',
                      style: AppStyles.regular,
                    ),
                    onTap: () {
                      bloc.add(
                          OnWorkingHours(startTime: '08:00', endTime: '16:00'));
                      setState(() {
                        selectedWorkingHours = '08:00 - 16:00';
                      });
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Custom',
                      style: AppStyles.regular,
                    ),
                    onTap: () async {
                      TimeOfDay? pickedStartTime = await showTimePicker(
                        context: context,
                        initialTime: startTime,
                        helpText: 'Start Time',
                      );
                      if (pickedStartTime != null) {
                        // ignore: use_build_context_synchronously
                        TimeOfDay? pickedEndTime = await showTimePicker(
                          context: context,
                          initialTime: endTime,
                        );
                        if (pickedEndTime != null) {
                          startTime = pickedStartTime;
                          endTime = pickedEndTime;
                          bloc.add(OnWorkingHours(
                              startTime: _formatTimeOfDay(startTime),
                              endTime: _formatTimeOfDay(endTime)));
                          selectedWorkingHours =
                              '${_formatTimeOfDay(startTime)} - ${_formatTimeOfDay(endTime)}';
                          setState(() {});
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                        }
                      }
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  String _formatTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    return DateFormat.Hm().format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestToSellBloc(
          user: BlocProvider.of<ProfileBloc>(context).state.currentUser),
      child: BlocConsumer<RequestToSellBloc, RequestToSellState>(
        listener: (context, state) {
          if (state.requestSubmissionState == FetchState.success) {
            context.goNamed(RoutePath.success, queryParameters: {
              'message': 'Request To Sell Sent Successfully'
            });
          }
          if (state.requestSubmissionState == FetchState.failed) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
                snackBar("Error Occured while sending request", () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }, context));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Request to sell",
                style: AppStyles.regular,
              ),
              centerTitle: true,
            ),
            body: Form(
              key: requestToSellKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[300],
                            ),
                            child: _selectedImage != null
                                ? ClipOval(
                                    child: Image.file(
                                      _selectedImage!,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: 100,
                                        color: Colors.grey[500],
                                      ),
                                      Text(
                                        "company logo",
                                        style: AppStyles.regular,
                                      )
                                    ],
                                  ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.camera_alt),
                            onPressed: () {
                              _pickImage(ImageSource.gallery,
                                  BlocProvider.of<RequestToSellBloc>(context));
                            },
                          ),
                        ],
                      ),
                      if (_selectedImage != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _clearImage(BlocProvider.of<RequestToSellBloc>(
                                    context));
                              },
                              child: Text(
                                'Discard',
                                style: AppStyles.regular,
                              ),
                            ),
                            const SizedBox(width: 16),
                            ElevatedButton(
                              onPressed: () {
                                _pickImage(
                                    ImageSource.gallery,
                                    BlocProvider.of<RequestToSellBloc>(
                                        context));
                              },
                              child: Text(
                                'Change Picture',
                                style: AppStyles.regular,
                              ),
                            ),
                          ],
                        ),
                      const Gap(10),
                      TextFieldWidget(
                        onchanged: (val) {
                          context
                              .read<RequestToSellBloc>()
                              .add(OnCompanyName(name: val));
                        },
                        validator: (name) {
                          if (name == null || name.isEmpty) {
                            return "Enter company or individual name";
                          }
                          return null;
                        },
                        hintText: "Name of company or individual",
                        labelText: "Company Name",
                      ),
                      const Gap(10),
                      TextFieldWidget(
                        onchanged: (val) {
                          context
                              .read<RequestToSellBloc>()
                              .add(OnLocation(location: val));
                        },
                        validator: (name) {
                          if (name == null || name.isEmpty) {
                            return "Enter Your business location";
                          }
                          return null;
                        },
                        hintText: "Location of Business e.g Bonduma, Buea",
                        labelText: "Location",
                      ),
                      const Gap(10),
                      TextFieldWidget(
                        onchanged: (val) {
                          context
                              .read<RequestToSellBloc>()
                              .add(OnNumber(number: val));
                        },
                        validator: (num) {
                          if (num == null || num.isEmpty) {
                            return "Enter Your business number";
                          }
                          if (num.length != 9) {
                            return "Number should be 9 digits";
                          }
                          return null;
                        },
                        hintText: "Momo Number",
                        inputType: TextInputType.phone,
                        labelText: "Business Number",
                      ),
                      const Gap(10),
                      TextFieldWidget(
                        onchanged: (val) {
                          context
                              .read<RequestToSellBloc>()
                              .add(OnEmail(email: val));
                        },
                        validator: (name) {
                          if (name == null || name.isEmpty) {
                            return "Enter your company or individual email";
                          }
                          return null;
                        },
                        hintText: "Email Address. e.g hey@gmail.com",
                        labelText: "Business email",
                      ),
                      const Gap(10),
                      Text(
                        'Selected Working Hours:',
                        style: AppStyles.regular.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      const Gap(15),
                      Text(
                        selectedWorkingHours,
                        style: AppStyles.regular.copyWith(fontSize: 20),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(darkGreen)),
                        onPressed: () {
                          _showWorkingHoursDialog(
                              BlocProvider.of<RequestToSellBloc>(context),
                              context);
                        },
                        child: Text(
                          'Select Working Hours',
                          style:
                              AppStyles.regular.copyWith(color: Colors.white),
                        ),
                      ),
                      const Gap(10),
                      OutlineButtonWidget(
                        onPressed: () {
                          if (selectedWorkingHours.isEmpty) {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                                snackBar("Please select working hours", () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            }, context));
                            return;
                          }
                          if (requestToSellKey.currentState!.validate()) {
                            context
                                .read<RequestToSellBloc>()
                                .add(OnSubmitRequest());
                          }
                        },
                        width: double.infinity,
                        backgroundColor: brown,
                        child:
                            state.requestSubmissionState == FetchState.loading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ))
                                : Text(
                                    "Request ",
                                    style: AppStyles.regular
                                        .copyWith(color: Colors.white),
                                  ),
                      ),
                    ],
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
