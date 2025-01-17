import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingDesktopPlanCard extends StatelessWidget {
  const LandingDesktopPlanCard({super.key, required this.title, required this.blockFrom});

  final String title;
  final int blockFrom;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: context.mqWidth * .30,
        height: context.mqHeight * .6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white
        ),
        child: Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12))
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                spacing: 16,
                children: getItem(blockFrom),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Row> getItem(int blockFrom) {
    List<String> modules = ["Agenda", "Paciente", "CRM", "Pagamentos", "ERP"];
    return modules.asMap().entries.map((e) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Icon(e.key < blockFrom ? FontAwesomeIcons.check : FontAwesomeIcons.times,
          color: e.key < blockFrom ? Colors.green : Colors.red, size: 24,),
        Text(
          e.value,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black
          ),
        )
      ],
    )).toList();
  }


}
