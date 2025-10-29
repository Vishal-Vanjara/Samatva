import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  static const String routeName = '/result';

  final Map<String, double> doshaScores;

  const ResultScreen({super.key, required this.doshaScores});

  @override
  Widget build(BuildContext context) {
    // Determine dominant dosha
    final dominantDosha = doshaScores.entries.reduce((a, b) => a.value > b.value ? a : b).key;
    final dominantColor = _getDoshaColor(dominantDosha);
    final description = _getDoshaDescription(dominantDosha);
    final recommendations = _getDoshaRecommendations(dominantDosha);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dosha Assessment',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Dominant Dosha Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: dominantColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: dominantColor.withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  Icon(_getDoshaIcon(dominantDosha),
                      color: dominantColor, size: 36),
                  const SizedBox(height: 10),
                  const Text(
                    'Your Dominant Dosha',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    dominantDosha,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: dominantColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        height: 1.4),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Dosha Breakdown
            _doshaBreakdownSection(doshaScores),

            const SizedBox(height: 30),

            // Personalized Recommendations
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Personalized Recommendations',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 14),
                  ...recommendations.map((tip) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle,
                            color: dominantColor, size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            tip,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: dominantColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      'Retake Assessment',
                      style: TextStyle(
                          color: dominantColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/home')),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: dominantColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'Done',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Breakdown Section
  Widget _doshaBreakdownSection(Map<String, double> scores) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Dosha Breakdown',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          _doshaBar('Vata', scores['Vata'] ?? 0, Colors.blue),
          _doshaBar('Pitta', scores['Pitta'] ?? 0, Colors.red),
          _doshaBar('Kapha', scores['Kapha'] ?? 0, Colors.green),
        ],
      ),
    );
  }

  Widget _doshaBar(String name, double value, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(name,
                style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          Expanded(
            flex: 6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: value / 100,
                color: color,
                backgroundColor: Colors.grey.shade200,
                minHeight: 5,
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 40,
            child: Text('${value.toInt()}%',
                textAlign: TextAlign.end,
                style: TextStyle(color: color, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  // Helper: Dosha Colors
  Color _getDoshaColor(String dosha) {
    switch (dosha) {
      case 'Vata':
        return Colors.blue;
      case 'Pitta':
        return Colors.redAccent;
      case 'Kapha':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  // Helper: Dosha Icons
  IconData _getDoshaIcon(String dosha) {
    switch (dosha) {
      case 'Vata':
        return Icons.air;
      case 'Pitta':
        return Icons.local_fire_department;
      case 'Kapha':
        return Icons.water_drop;
      default:
        return Icons.favorite;
    }
  }

  // Helper: Dosha Descriptions
  String _getDoshaDescription(String dosha) {
    switch (dosha) {
      case 'Vata':
        return 'You have a Vata constitution. Vata governs movement, creativity, and flexibility. Maintain warmth and grounding to balance it.';
      case 'Pitta':
        return 'You have a Pitta constitution. Pitta governs digestion, metabolism, and transformation. You have strong leadership qualities but may need cooling practices.';
      case 'Kapha':
        return 'You have a Kapha constitution. Kapha governs stability, structure, and compassion. Stay active and light to balance it.';
      default:
        return '';
    }
  }

  // Helper: Recommendations
  List<String> _getDoshaRecommendations(String dosha) {
    switch (dosha) {
      case 'Vata':
        return [
          'Stay warm and maintain a regular routine',
          'Eat warm, nourishing foods',
          'Practice calming yoga and meditation',
          'Avoid excessive travel or stress',
        ];
      case 'Pitta':
        return [
          'Avoid excessive heat and spicy foods',
          'Practice moderate, cooling exercises',
          'Maintain work-life balance',
          'Eat cooling, fresh foods',
          'Practice stress-reduction techniques',
        ];
      case 'Kapha':
        return [
          'Engage in regular exercise',
          'Favor light, warm meals',
          'Avoid daytime naps',
          'Incorporate variety in daily routines',
        ];
      default:
        return [];
    }
  }
}
