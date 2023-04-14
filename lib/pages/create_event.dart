// import 'package:flutter/material.dart';

// class CreateEvent extends StatefulWidget {
//   const CreateEvent({super.key});

//   @override
//   State<CreateEvent> createState() => _CreateEventState();
// }

// class _CreateEventState extends State<CreateEvent> {
//   // final_formkey = GlobalKey(FormState);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.blueGrey,
//         title: Text(
//           "CREATE  EVENT",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 25,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20.0),
//         child: ListView(
//           children: [
//             // Text(
//             //   "Fill the following form",
//             //   style: TextStyle(
//             //       fontWeight: FontWeight.bold,
//             //       color: Colors.white,
//             //       fontSize: 25),
//             // ),
//             // Padding(
//             //   padding: const EdgeInsets.only(
//             //       left: 20, top: 10, right: 20, bottom: 10),
//             //   child: Image.asset(
//             //     "assets/images/undraw_fill_form_re_cwyf.png",
//             //     fit: BoxFit.cover,
//             //   ),
//             // ),
//             const Text("Fill the given form"),
//             const SizedBox(
//               height: 20,
//             ),

//             Form(
//                 // key: final_formkey
//                 child: Column(
//               children: [
//                 TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Write your event name",
//                     labelText: "Event Name",
//                   ),
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "What the event is all about",
//                     labelText: "Description",
//                   ),
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Where the event will be",
//                     labelText: "Location",
//                   ),
//                 ),
//                 Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                   TextFormField(
//                     decoration: InputDecoration(
//                       // hintText: "Where the event will be",
//                       labelText: "Date",
//                     ),
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       // hintText: "Where the event will be",
//                       labelText: "Time",
//                     ),
//                   ),
//                 ]),
//                 Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                   TextFormField(
//                     decoration: InputDecoration(
//                       // hintText: "Where the event will be",
//                       labelText: "Batch",
//                     ),
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       // hintText: "Where the event will be",
//                       labelText: "Branch",
//                     ),
//                   ),
//                 ]),
//               ],
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
import 'package:flutter/material.dart';

void main() => runApp(const CreateEvent());

class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'CREATE  EVENT';

    return MaterialApp(
      title: appTitle,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        canvasColor: const Color(0xff22222C),
        brightness: Brightness.dark,
        
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: SingleChildScrollView(
          child: const MyCustomForm(),
        ),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Event Name", hintText: "Write your event name"),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please name of the event';
                }
                return null;
              },
            ),
            SizedBox(height: 5),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Description",
                  hintText: "What the event is all about "),

              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the description of event';
                }
                return null;
              },
            ),
            SizedBox(height: 5),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Location", hintText: "Where the event will be  "),

              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the location of event';
                }
                return null;
              },
            ),
            SizedBox(height: 5),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Date",
                // hintText: "Where the will be  "
              ),

              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the date of event';
                }
                return null;
              },
            ),
            SizedBox(height: 5),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Time", hintText: "Enter time of the event"),

              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter time of event';
                }
                return null;
              },
            ),
            SizedBox(height: 5),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Branch",
                // hintText: "Where the will be  "
              ),

              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the branch or stream';
                }
                return null;
              },
            ),
            SizedBox(height: 5),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Batch",
                // hintText: "Where the will be  "
              ),

              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your batch';
                }
                return null;
              },
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: Center(
                    child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                )),
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xff5669FF),
                    minimumSize: Size(100, 40)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}