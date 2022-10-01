import 'package:abushakir/abushakir.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zare_apps/widgets/convert_popup.dart';

void main() {
  runApp(const DateConverter());
}

List<String> etdays = [
  'ሰኞ',
  'ማግሰኞ',
  'ዕረቡ',
  'ሐሙስ',
  'አርብ',
  'ቅዳሜ',
  'እሁድ',
];

List<String> etmonths = [
  'መስከረም',
  'ጥቅምት',
  'ኅዳር',
  'ታኅሣሥ',
  'ጥር',
  'የካቲት',
  'መጋቢት',
  'ሚያዝያ',
  'ግንቦት',
  'ሰኔ',
  'ሐምሌ',
  'ነሐሴ',
  'ጳጉሜ',
];

EtDatetime etdate = EtDatetime.now();
ETC ec = ETC(year: etdate.year, month: etdate.month, day: etdate.day);

class DateConverter extends ConsumerStatefulWidget {
  const DateConverter({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DateConverterState();
}

class _DateConverterState extends ConsumerState<DateConverter> {
  int number = 1;
  @override
  void initState() {
    ec.monthDays(geezDay: true, weekDayName: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF242424),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 350,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'ዛሬ ቀን',
                          style: textStyle(),
                        ),
                      ),
                      Container(
                        height: 180.0,
                        width: double.infinity,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SelectableText(
                              ec.monthName!,
                              style: textStyle(),
                            ),
                            SelectableText(
                              ec.day.toString() +
                                  ' ' +
                                  ec.year.toString() +
                                  ' ' +
                                  ConvertToEthiopic(ec.day).toString() +
                                  ' ' +
                                  ConvertToEthiopic(ec.year).toString(),
                              style: textStyle(),
                            ),
                            SelectableText(
                              'ነው ።',
                              style: textStyle(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SelectableText(
                  ec.monthName! + ' progress is',
                  style: textStyle(),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: LinearProgressIndicator(
                      value: ec.day / 30,
                      minHeight: 20.0,
                      backgroundColor: const Color(0xFF1f2937),
                      valueColor:
                          const AlwaysStoppedAnimation(Color(0xFFea580c)),
                    ),
                  ),
                ),
                SelectableText(
                  ec.year.toString() + ' progress is',
                  style: textStyle(),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: LinearProgressIndicator(
                      value: ((ec.month - 1) * 30) + ec.day / 365,
                      // value: 18 / 365,
                      minHeight: 20.0,
                      backgroundColor: const Color(0xFF1f2937),
                      valueColor:
                          const AlwaysStoppedAnimation(Color(0xFFea580c)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70.0,
                ),
                SelectableText('GE\'EZ numbers', style: textStyle()),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SelectableText(
                    'Realtime Arabic Number to Geez Number translator',
                    style: textStyle(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 200.0,
                      child: TextField(
                        style: textStyle(),
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.number,
                        onChanged: (txt) {
                          setState(() {
                            number = int.parse(txt);
                          });
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF1f2937),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      ConvertToEthiopic(number).toString(),
                      style: textStyle(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  height: 300,
                  child: GridView(
                    children: [
                      for (var i = 0; i < 10; i++)
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                (i + 1).toString(),
                                style: textStyle(),
                              ),
                              Text(
                                ConvertToEthiopic(i + 1).toString(),
                                style: textStyle(),
                              ),
                            ],
                          ),
                        ),
                    ],
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                SelectableText('Converter', style: textStyle()),
                ElevatedButton(
                  onPressed: () {
                    showModal(
                      context: context,
                      builder: (context) {
                        return const ConvertPopup();
                      },
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFFea580c),
                    ),
                  ),
                  child: const Text('Ethiopian to Gregorian'),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFFea580c),
                    ),
                  ),
                  child: const Text('Gregorian to Ethiopian'),
                ),
                const SizedBox(
                  height: 100.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle textStyle() {
  return const TextStyle(
    color: Colors.white,
    fontSize: 25,
  );
}
