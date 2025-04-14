import 'package:cloud_firestore/cloud_firestore.dart';

class ApplicationDetail {
  final String userId;
  final String resumeUrl;
  final double similarityScore;
  final DateTime appliedAt;

  ApplicationDetail({
    required this.userId,
    required this.resumeUrl,
    required this.similarityScore,
    required this.appliedAt,
  });

  factory ApplicationDetail.fromMap(Map<String, dynamic> map) {
    return ApplicationDetail(
      userId: map['userId'] as String,
      resumeUrl: map['resumeUrl'] as String,
      similarityScore: (map['similarityScore'] as num).toDouble(),
      appliedAt: (map['appliedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'resumeUrl': resumeUrl,
      'similarityScore': similarityScore,
      'appliedAt': appliedAt,
    };
  }
}

class JobPostModel{
  String jobId;
  String companyId;
  String companyName;
  String openJob;
  String level;
  String jobDescription;
  List<String> tags;
  List<String> applicationsId;
  List<ApplicationDetail> applicationDetails;
  DateTime postedTime;
  String totalSlots;

  factory JobPostModel.fromDoc(DocumentSnapshot map) {
    return JobPostModel(
      jobId: map['jobId'] as String,
      companyId: map['companyId'] as String,
      companyName: map['companyName'] as String,
      openJob: map['openJob'] as String,
      level: map['level'] as String,
      jobDescription: map['jobDescription'] as String,
      tags: (map['tags'] as List<dynamic>).map((item)=>item as String).toList(),
      applicationsId: (map['applicationsId'] as List<dynamic>).map((item)=>item as String).toList(),
      applicationDetails: (map['applicationDetails'] as List<dynamic>?)
          ?.map((item) => ApplicationDetail.fromMap(item as Map<String, dynamic>))
          .toList() ?? [],
      postedTime: (map['postedTime'] is Timestamp ? (map['postedTime'] as Timestamp).toDate() : DateTime.now()),
      totalSlots: map['totalSlots'] as String,
    );
  }

//<editor-fold desc="Data Methods">
  JobPostModel({
    required this.jobId,
    required this.companyId,
    required this.companyName,
    required this.openJob,
    required this.level,
    required this.jobDescription,
    required this.tags,
    required this.applicationsId,
    required this.applicationDetails,
    required this.postedTime,
    required this.totalSlots,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JobPostModel &&
          runtimeType == other.runtimeType &&
          jobId == other.jobId &&
          companyId == other.companyId &&
          companyName == other.companyName &&
          openJob == other.openJob &&
          level == other.level &&
          jobDescription == other.jobDescription &&
          tags == other.tags &&
          applicationsId == other.applicationsId &&
          applicationDetails == other.applicationDetails &&
          postedTime == other.postedTime &&
          totalSlots == other.totalSlots);

  @override
  int get hashCode =>
      jobId.hashCode ^
      companyId.hashCode ^
      companyName.hashCode ^
      openJob.hashCode ^
      level.hashCode ^
      jobDescription.hashCode ^
      tags.hashCode ^
      applicationsId.hashCode ^
      applicationDetails.hashCode ^
      postedTime.hashCode ^
      totalSlots.hashCode;

  @override
  String toString() {
    return 'JobPostModel{' +
        ' jobId: $jobId,' +
        ' companyId: $companyId,' +
        ' companyName: $companyName,' +
        ' openJob: $openJob,' +
        ' level: $level,' +
        ' jobDescription: $jobDescription,' +
        ' tags: $tags,' +
        ' applicationsId: $applicationsId,' +
        ' applicationDetails: $applicationDetails,' +
        ' postedTime: $postedTime,' +
        ' totalSlots: $totalSlots,' +
        '}';
  }

  JobPostModel copyWith({
    String? jobId,
    String? companyId,
    String? companyName,
    String? openJob,
    String? level,
    String? jobDescription,
    List<String>? tags,
    List<String>? applicationsId,
    List<ApplicationDetail>? applicationDetails,
    DateTime? postedTime,
    String? totalSlots,
  }) {
    return JobPostModel(
      jobId: jobId ?? this.jobId,
      companyId: companyId ?? this.companyId,
      companyName: companyName ?? this.companyName,
      openJob: openJob ?? this.openJob,
      level: level ?? this.level,
      jobDescription: jobDescription ?? this.jobDescription,
      tags: tags ?? this.tags,
      applicationsId: applicationsId ?? this.applicationsId,
      applicationDetails: applicationDetails ?? this.applicationDetails,
      postedTime: postedTime ?? this.postedTime,
      totalSlots: totalSlots ?? this.totalSlots,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'jobId': this.jobId,
      'companyId': this.companyId,
      'companyName': this.companyName,
      'openJob': this.openJob,
      'level': this.level,
      'jobDescription': this.jobDescription,
      'tags': this.tags,
      'applicationsId': this.applicationsId,
      'applicationDetails': this.applicationDetails.map((e) => e.toMap()).toList(),
      'postedTime': this.postedTime,
      'totalSlots': this.totalSlots,
    };
  }

  factory JobPostModel.fromMap(Map<String, dynamic> map) {
    return JobPostModel(
      jobId: map['jobId'] as String,
      companyId: map['companyId'] as String,
      companyName: map['companyName'] as String,
      openJob: map['openJob'] as String,
      level: map['level'] as String,
      jobDescription: map['jobDescription'] as String,
      tags: map['tags'] as List<String>,
      applicationsId: map['applicationsId'] as List<String>,
      applicationDetails: (map['applicationDetails'] as List<dynamic>?)
          ?.map((item) => ApplicationDetail.fromMap(item as Map<String, dynamic>))
          .toList() ?? [],
      postedTime: map['postedTime'] as DateTime,
      totalSlots: map['totalSlots'] as String,
    );
  }

//</editor-fold>
}