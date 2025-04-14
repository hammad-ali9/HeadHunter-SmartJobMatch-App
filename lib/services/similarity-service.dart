import 'dart:convert';
import 'package:http/http.dart' as http;

class SimilarityService {
  static Future<double> calculateSimilarity(String resumeUrl, String jobDescription) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://your-api-url/api/similarity'),
      );

      // Add the resume URL and job description
      request.fields['resume_url'] = resumeUrl;
      request.fields['job_description'] = jobDescription;

      // Send the request
      var response = await request.send();
      
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var data = jsonDecode(responseBody);
        return data['similarity_score'] as double;
      } else {
        throw Exception('Failed to calculate similarity: ${response.statusCode}');
      }
    } catch (e) {
      print('Error calculating similarity: $e');
      return 0.0; // Return 0 if there's an error
    }
  }
} 