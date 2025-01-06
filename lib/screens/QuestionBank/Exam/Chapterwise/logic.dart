import 'dart:math';

import 'package:flutter/material.dart';
import 'package:achievex/screens/QuestionBank/Exam/Full-Test/JEE-MAIN/comparison_data.dart';

int Marks(int correctanswered, int incorrectanswered) {
   
   int marks = (correctanswered * 4) - (incorrectanswered);
   return marks; 
}


double Percentage(int correctanswered, int totalquestions) {
   double percentage = ((correctanswered / totalquestions) * 100);
   return percentage;
}


double calculatePercentile(double marks, dynamic chapterwise) {
  int totalStudents = chapterwise.length; 
  int rank = 1; // Assuming rank 1 for highest marks

  for (var entry in chapterwise) {
    if (entry['marks']! > marks) {
      rank++;
    }
  }

  // Calculate percentile
  double percentile = (1 - (rank / totalStudents)) * 100;

  // Handle edge cases (percentile should not exceed 100)
  percentile = percentile > 100 ? 100 : percentile; 
  percentile = percentile < 0 ? 0 : percentile; 

  return percentile;
}


Map<String, int> getRankRange(double marks, dynamic jeemains, dynamic chapterwise) {
  double percentile = calculatePercentile(marks, chapterwise); 

  // Calculate lower and upper bounds for percentile range
  int totalStudents = jeemains.length; 
  double lowerBoundPercentile = percentile - 0.5; 
  double upperBoundPercentile = percentile + 0.5; 

  lowerBoundPercentile = max(0.0, lowerBoundPercentile); // Ensure lower bound is not negative
  upperBoundPercentile = min(100.0, upperBoundPercentile); // Ensure upper bound does not exceed 100

  int lowerBoundRank = (totalStudents * (100 - upperBoundPercentile) / 100).round(); 
  int upperBoundRank = (totalStudents * (100 - lowerBoundPercentile) / 100).round(); 

  return {'lowerBoundRank': lowerBoundRank, 'upperBoundRank': upperBoundRank};
}


  
