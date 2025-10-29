import 'package:flutter/material.dart';
import '../result/result_screen.dart';

class QuizScreen extends StatefulWidget {
  static const String routeName = '/quiz';
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int? _selectedOptionIndex;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'How is your skin?',
      'options': ['Dry', 'Oily/Sensitive', 'Thick/Moist']
    },
    {
      'question': 'How would you describe your appetite?',
      'options': ['Irregular', 'Strong', 'Slow']
    },
    {
      'question': 'How do you generally react to stress?',
      'options': [
        'Anxious or worried',
        'Irritable or frustrated',
        'Calm but lethargic'
      ]
    },
    {
      'question': 'How is your body type?',
      'options': ['Thin and light', 'Medium and muscular', 'Sturdy and solid']
    },
    {
      'question': 'How is your sleep pattern?',
      'options': [
        'Light and easily disturbed',
        'Moderate and regular',
        'Deep and prolonged'
      ]
    },
    {
      'question': 'How is your digestion usually?',
      'options': ['Variable', 'Strong', 'Slow or heavy']
    },
    {
      'question': 'What best describes your energy level?',
      'options': ['Fluctuating energy', 'High and intense', 'Steady and slow']
    },
    {
      'question': 'How do you handle changes or new situations?',
      'options': [
        'Easily anxious or restless',
        'Adapt quickly but can get controlling',
        'Prefer stability and routine'
      ]
    },
    {
      'question': 'What is your body temperature like?',
      'options': ['Usually cold', 'Warm or hot', 'Cool and stable']
    },
    {
      'question': 'How do people describe your personality?',
      'options': [
        'Creative and talkative',
        'Focused and determined',
        'Calm and compassionate'
      ]
    },
  ];

  void _goToNext() {
    if (_selectedOptionIndex == null) return;
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedOptionIndex = null;
      });
    } else {
      // Navigate to results page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            doshaScores: {
              'Vata': 46,
              'Pitta': 54,
              'Kapha': 0,
            },
          ),
        ),
      );
    }
  }

  void _goToPrevious() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _selectedOptionIndex = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentIndex];
    final total = _questions.length;
    final progress = ((_currentIndex + 1) / total) * 100;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Dosha Assessment',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Question ${_currentIndex + 1} of $total',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black54),
                ),
                Text(
                  '${progress.toInt()}%',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 6),
            LinearProgressIndicator(
              value: (_currentIndex + 1) / total,
              backgroundColor: Colors.grey.shade200,
              valueColor:
              AlwaysStoppedAnimation<Color>(Colors.green.shade700),
              minHeight: 4,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 30),

            // Question Text
            Text(
              question['question'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Options
            ...List.generate(
              question['options'].length,
                  (index) => GestureDetector(
                onTap: () {
                  setState(() => _selectedOptionIndex = index);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: _selectedOptionIndex == index
                        ? Colors.green.shade50
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _selectedOptionIndex == index
                          ? Colors.green.shade700
                          : Colors.grey.shade300,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _selectedOptionIndex == index
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off_outlined,
                        color: _selectedOptionIndex == index
                            ? Colors.green.shade700
                            : Colors.grey,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          question['options'][index],
                          style: TextStyle(
                            fontSize: 16,
                            color: _selectedOptionIndex == index
                                ? Colors.green.shade800
                                : Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const Spacer(),

            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _goToPrevious,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.green.shade800),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'Previous',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _goToNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
