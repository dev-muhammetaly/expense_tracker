import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

//format the date and use it in the get functoin
final formatter = DateFormat.yMd();

const uuid = Uuid();

// enumde categories insted of giving it in the String
enum Category { Food, Taxi, Work, Leisure }

const categoryIcons = {
  Category.Food: Icons.dining_outlined,
  Category.Taxi: Icons.local_taxi_outlined,
  Category.Work: Icons.work_outlined,
  Category.Leisure: Icons.movie_creation_outlined,
};

class Expenses {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expenses({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    //for giving special ids
  }) : id = uuid.v4();

  //getter formating the date
  String get formattedDate {
    return formatter.format(date);
  }
}
