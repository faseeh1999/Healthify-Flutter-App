import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/disease.dart';
import 'package:test_app/diseaseTile.dart';

class DiseaseList extends StatefulWidget {
  @override
  _DiseaseListState createState() => _DiseaseListState();
}

class _DiseaseListState extends State<DiseaseList> {
  @override
  Widget build(BuildContext context) {
    final diseases = Provider.of<List<Disease>>(context) ?? [];
    // Size size = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: diseases.length,
        itemBuilder: (context, index) {
          return DiseaseTile(disease: diseases[index]);
        });
  }
}
