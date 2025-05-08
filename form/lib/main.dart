import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coding Flutter',
      home: Scaffold(
        appBar: AppBar(title: const Text('Coding Flutter')),
        body: const MyForm(),
      ),
    );
  }
}

class MyForm extends StatelessWidget {
  const MyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          MyTextField(),
          SizedBox(height: 24),
          MyDropDown(),
          SizedBox(height: 24),
          MySwitch(),
          SizedBox(height: 24),
          MyRadio(),
          SizedBox(height: 24),
          MyCheckbox(),
          SizedBox(height: 24),
          MyDatePicker(),
          MyDialog(),
          SizedBox(height: 20),
          MyBottomSheet(),
          SizedBox(height: 20),
          MySnackbarButton(),
        ],
      ),
    );
  }
}

class MyTextField extends StatefulWidget {
  const MyTextField({super.key});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 20,
      controller: textController,
      decoration: const InputDecoration(
        labelText: "Nama",
        labelStyle: TextStyle(color: Colors.blueGrey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        helperText: "Masukkan nama",
      ),
    );
  }
}

class MyDropDown extends StatefulWidget {
  const MyDropDown({super.key});

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  String selected = "Dart";

  final List<String> dropDownList = const [
    "Dart",
    "Kotlin",
    "Java",
    "Javascript",
    "PHP",
    "Python",
    "Ruby",
    "Swift",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Bahasa favorit: "),
        const SizedBox(width: 8),
        DropdownButton<String>(
          value: selected,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 20,
          style: TextStyle(color: Colors.blue[600]),
          underline: Container(height: 2, color: Colors.grey),
          items:
              dropDownList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
          onChanged: (val) {
            if (val != null) {
              setState(() {
                selected = val;
              });
              print("Selected: $val");
            }
          },
        ),
      ],
    );
  }
}

class MySwitch extends StatefulWidget {
  const MySwitch({super.key});

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Connect Instagram"),
        Switch(
          value: isOn,
          onChanged: (bool val) {
            setState(() {
              isOn = val;
              print("Switch: $isOn");
            });
          },
        ),
      ],
    );
  }
}

class MyRadio extends StatefulWidget {
  const MyRadio({super.key});

  @override
  State<MyRadio> createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  String sex = "pria";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Jenis Kelamin: "),
        const SizedBox(width: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: 'pria',
              groupValue: sex,
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    sex = value;
                    print("sex: $sex");
                  }
                });
              },
            ),
            const Text("Pria"),
          ],
        ),
        const SizedBox(width: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: "wanita",
              groupValue: sex,
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    sex = value;
                    print("sex: $sex");
                  }
                });
              },
            ),
            const Text("Wanita"),
          ],
        ),
      ],
    );
  }
}

class MyCheckbox extends StatefulWidget {
  const MyCheckbox({super.key});

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              if (value != null) {
                isChecked = value;
                print("setuju: $isChecked");
              }
            });
          },
        ),
        const SizedBox(width: 4),
        const Text(
          "Setuju syarat dan ketentuan.",
          style: TextStyle(decoration: TextDecoration.underline),
        ),
      ],
    );
  }
}

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({super.key});

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1950),
          lastDate: DateTime(2100),
        );
        setState(() {
          if (pickedDate != null) {
            dateController.text = pickedDate.toString();
          }
        });
        debugPrint("Date Picker: $pickedDate");
      },
      child: TextFormField(
        initialValue: "2023-12-11",
        maxLength: 20,
        enabled: false,
        decoration: const InputDecoration(
          labelText: "Tanggal Lahir",
          labelStyle: TextStyle(color: Colors.blueGrey),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
          suffixIcon: Icon(Icons.date_range),
          helperText: "Pilih tanggal lahir anda",
        ),
        onChanged: (value) {},
      ),
    );
  }
}

class MyDialog extends StatefulWidget {
  const MyDialog({super.key});

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Info'),
              content: const SingleChildScrollView(
                child: ListBody(children: [Text('Your order was placed.')]),
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: const Text('Open Dialog'),
    );
  }
}

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({super.key});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Your order was placed!'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Ok'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: const Text('Open BottomSheet'),
    );
  }
}

class MySnackbarButton extends StatelessWidget {
  const MySnackbarButton({super.key});

  void showCustomNotification(BuildContext context) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Your request is succesful',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
    );

    overlay.insert(overlayEntry);

    // Auto-remove after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showCustomNotification(context),
      child: const Text('Open SnackBar'),
    );
  }
}
