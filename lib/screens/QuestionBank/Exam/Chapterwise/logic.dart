import 'dart:math';



int Marks(int correctanswered, int incorrectanswered) {
   
   int marks = (correctanswered * 4) - (incorrectanswered);
   return marks; 
}

double Percentage(int correctanswered, int totalquestions) {
   double percentage = ((correctanswered / totalquestions) * 100);
   return percentage;
}

double calculatePercentile(double studentMarks, List<double> jeeMainsPercentiles) {
  // Check if jeeMainsPercentiles is a list
  if (jeeMainsPercentiles.isEmpty) {
    // Handle the case where percentile data is missing (e.g., return default value or throw exception)
    return 0.0; // Or throw an exception
  }

  int countBelow = 0; 
  for (double score in jeeMainsPercentiles) {
    if (score < studentMarks) {
      countBelow++;
    }
  }
  return (countBelow / jeeMainsPercentiles.length) * 100; 
}

Map<String, int> getRankRange(double marks, List<double> jeeMainsPercentiles) {
  double percentile = calculatePercentile(marks, jeeMainsPercentiles); 

  int totalStudents = jeeMainsPercentiles.length; 
  double lowerBoundPercentile = percentile - 0.5; 
  double upperBoundPercentile = percentile + 0.5; 

  lowerBoundPercentile = max(0.0, lowerBoundPercentile); 
  upperBoundPercentile = min(100.0, upperBoundPercentile);

  int lowerBoundRank = (totalStudents * (100 - upperBoundPercentile) / 100).round(); 
  int upperBoundRank = (totalStudents * (100 - lowerBoundPercentile) / 100).round(); 

  return {'lowerBoundRank': lowerBoundRank, 'upperBoundRank': upperBoundRank};
}






