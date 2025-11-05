import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  final double heading3;
  final double body;

  const QuestionCard({super.key, required this.heading3, required this.body});

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  String? _selectedAnswer;

  final List<String> options = ['A. Merah', 'B. Biru', 'C. Kuning', 'D. Hijau'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearProgressIndicator(
          value: 0.25, // value ganti dengan yang sudah terjawab berapa persen
          backgroundColor: Colors.grey[300],
          color: Color(0XFF3A86FF),
          minHeight: 20,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),

        SizedBox(height: 28),

        Text(
          'Pertanyaan 1', // ganti dengan index
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: widget.heading3,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: 28),

        Text(
          'Siapakah penemu bola lampu?', // gnti dengan text dari provider
          style: TextStyle(fontSize: widget.body),
        ),

        SizedBox(height: 16),

        RadioGroup(
          groupValue: _selectedAnswer,
          onChanged: (String? value) {
            setState(() {
              _selectedAnswer = value;
            });
          },
          child: Column(
            children: [
              ...options.map(
                (option) => Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: _selectedAnswer == option
                            ? Color(0XFF3A86FF)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Radio(value: option, activeColor: Colors.white),

                          Expanded(
                            child: Text(
                              option,
                              style: TextStyle(
                                color: _selectedAnswer == option
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: widget.body,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 16),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(12),
              backgroundColor: Color(0xFF3A86FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Lanjut', // jika sudah di soal terakhir, teks menjadi selesai
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontSize: widget.heading3,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// class QuestionCard extends StatelessWidget {
//   final double heading3;
//   final double body;

//   const QuestionCard({super.key, required this.heading3, required this.body});

//   @override
//   Widget build(BuildContext context) {
//     String? selectedAnswer;

//     final List<String> options = [
//       'A. Merah',
//       'B. Biru',
//       'C. Kuning',
//       'D. Hijau',
//     ];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         LinearProgressIndicator(
//           value: 0.25,
//           backgroundColor: Colors.grey[300],
//           color: Color(0XFF3A86FF),
//           minHeight: 20,
//           borderRadius: BorderRadius.all(Radius.circular(20.0)),
//         ),

//         SizedBox(height: 28),

//         Text(
//           'Pertanyaan 1',
//           style: TextStyle(
//             fontFamily: 'Montserrat',
//             fontSize: heading3,
//             fontWeight: FontWeight.w700,
//           ),
//         ),

//         SizedBox(height: 28),

//         Text('Siapakah penemu bola lampu?', style: TextStyle(fontSize: body)),

//         SizedBox(height: 12),

//         ...options.map(
//           (option) => RadioListTile(
//             title: Text(option),
//             value: option,
//             // groupValue: selectedAnswer,
//             onChanged: (value) {
//               setState(() {
//                 selectedAnswer = value;
//               });
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
