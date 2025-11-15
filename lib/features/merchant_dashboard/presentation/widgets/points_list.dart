import 'package:hdouri/exports.dart';
import 'package:hdouri/core/widgets/points_item.dart';
import 'package:flutter/material.dart';
import '../../data/statics/statics.dart';

class PointsList extends StatelessWidget {
  const PointsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), 
      itemCount: DashboardStatics.pointsList.length,
      itemBuilder: (context, index) {
        final model = DashboardStatics.pointsList[index];
        return PointsItem(model: model);
      }
    );
      }
  }

