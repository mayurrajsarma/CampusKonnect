import 'package:campuskonnect/widgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:campuskonnect/utils/theme.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:campuskonnect/widgets/eventcard.dart';
//import 'package:campuskonnect/widgets/event_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class EventCreate extends StatefulWidget {
  const EventCreate({super.key});
  @override
  State<EventCreate> createState() => _EventCreateState();
}

class _EventCreateState extends State<EventCreate> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String evName = '', location = '', description = '', time = '', date = '';

  void _saveItem() async {
    if (formKey.currentState != null) {
      if (!formKey.currentState!.validate()) {
        formKey.currentState!.save();
      }
    }
    final url = Uri.https(
        'campuskonnect-3e383-default-rtdb.firebaseio.com', 'event-list3.json');
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'eventDate': date,
          'eventDescription': description,
          'eventLocation': location,
          'eventTime': time,
          //'eventImage': "assets/images/event.jpg",
          'eventName': evName,
        }));
    //print(response.body);
    //print(response.statusCode);

    if (!context.mounted) {
      return;
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onVerticalDragDown],
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Create a new event',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
              ),
            ),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Form(
                key: formKey,
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.montserrat(
                        fontSize: 15,
                      ),
                      labelText: "Name",
                      floatingLabelStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: 14,
                      ),
                      hintText: "Event Name",

                      fillColor: Appcolors.secondary,
                      filled: true,
                      enabledBorder: const OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(
                        Icons.celebration_outlined,
                        color: Colors.white,
                      ),
                      // prefixIconColor: const Color(0xffffffff),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Event name is empty';
                      }
                      return '';
                    },
                    onSaved: (input) {
                      if (input != null) {
                        evName = input;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.montserrat(
                        fontSize: 15,
                      ),
                      floatingLabelStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      labelText: "Description",
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: 14,
                      ),
                      hintText: "Description of the Event",
                      fillColor: Appcolors.secondary,
                      filled: true,
                      enabledBorder: const OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(
                        Icons.pending,
                        color: Colors.white,
                      ),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Description is empty';
                      }
                      return '';
                    },
                    onSaved: (input) {
                      if (input != null) {
                        description = input;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DateTimePicker(
                    initialValue: '',
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.montserrat(
                        fontSize: 15,
                      ),
                      floatingLabelStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      labelText: "Date",
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: 14,
                      ),
                      hintText: "Date of event",
                      fillColor: Appcolors.secondary,
                      filled: true,
                      enabledBorder: const OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(
                        Icons.event,
                        color: Colors.white,
                      ),
                      // prefixIconColor: const Color(0xffffffff),
                    ),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Date is empty';
                      }
                      return '';
                    },
                    onSaved: (input) {
                      if (input != null) {
                        date = input;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DateTimePicker(
                    type: DateTimePickerType.time,
                    initialValue: '', //_initialValue,
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.montserrat(
                        fontSize: 15,
                      ),
                      floatingLabelStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      labelText: "Time",
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: 14,
                      ),
                      hintText: "Time of event",
                      fillColor: Appcolors.secondary,
                      filled: true,
                      enabledBorder: const OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                      // prefixIconColor: const Color(0xffffffff),
                    ),
                    timeLabelText: "Time",
                    use24HourFormat: false,
                    locale: const Locale('pt', 'BR'),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Time is empty';
                      }
                      return '';
                    },
                    onSaved: (input) {
                      if (input != null) {
                        time = input;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.montserrat(
                        fontSize: 15,
                      ),
                      floatingLabelStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      labelText: "Location",
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: 14,
                      ),
                      hintText: "Location of the event",
                      fillColor: Appcolors.secondary,
                      filled: true,
                      enabledBorder: const OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      // prefixIconColor: const Color(0xffffffff),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Location is empty';
                      }
                      return '';
                    },
                    onSaved: (input) {
                      if (input != null) {
                        location = input;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _saveItem,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.buttoncolor,
                          shape: const StadiumBorder(
                              side: BorderSide(color: Appcolors.buttoncolor))),
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                            color: Appcolors.lightprimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          )),
    );
  }
}