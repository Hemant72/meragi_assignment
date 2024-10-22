import 'package:flutter/material.dart';
import 'package:meragi_assignment/core/utils/colors.dart';

class RecentLoginCard extends StatelessWidget {
  final String imgUrl;
  final String name;

  const RecentLoginCard({
    super.key,
    required this.imgUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: secondaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage:
                    AssetImage(imgUrl), // Replace with real image URL
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: 60,
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
