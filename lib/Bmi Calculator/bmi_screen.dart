import 'package:flutter/material.dart';
import 'dart:math';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  double bmi = 0;
  String category = 'Enter All Input';
  String gender = 'Male';

  void calculateBmi() {
    double height = double.parse(heightController.text) / 100;
    double weight = double.parse(weightController.text);

    setState(() {
      bmi = weight / pow(height, 2);

      if (bmi < 18.5) {
        category = 'Underweight';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        category = 'Normal';
      } else if (bmi >= 25 && bmi < 29.9) {
        category = 'Overweight';
      } else {
        category = 'Obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Bmi Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A0DAD), Color(0xFF9859B6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter your Details',
              style: TextStyle(fontSize: 26, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            _buildGenderToggle(),
            const SizedBox(height: 15),
            _buildInputFields(
              controller: heightController,
              label: 'Height (cm)',
              icon: Icons.height,
            ),
            const SizedBox(height: 25),
            _buildInputFields(
              controller: weightController,
              label: 'Weight (kg)',
              icon: Icons.line_weight,
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: calculateBmi,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.purpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 8,
              ),
              child: const Text(
                'Calculate Bmi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 25),
            _buildResultCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderToggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buidGenderButton('Male', Icons.male, gender == 'Male'),
        const SizedBox(width: 20),
        _buidGenderButton('Female', Icons.female, gender == 'Female'),
      ],
    );
  }

  Widget _buidGenderButton(String label, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          gender = label;
        });
      },
      child: AnimatedContainer(
        duration: Duration(microseconds: 300),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white70,
          borderRadius: BorderRadius.circular(20),
          boxShadow:
              isSelected
                  ? [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ]
                  : [],
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.deepPurple : Colors.white),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.deepPurple : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputFields({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(icon, color: Colors.white),
        filled: true,
        fillColor: Colors.white30,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purpleAccent),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget _buildResultCard() {
    return Card(
      color: Colors.white54,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Bmi : ${bmi.toStringAsFixed(2)}'
            ),
            Text(
                'Category : $category'
            ),
            Text(
                'Gender : $gender'
            ),
          ],
        ),
      ),
    );
  }
}
