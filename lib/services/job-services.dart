import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:head_hunter/models/company-model.dart';
import 'package:head_hunter/models/job-post-model.dart';
import 'package:head_hunter/models/seeker-model.dart';
import 'package:head_hunter/providers/sign-up-provider.dart';
import 'package:head_hunter/utils/routes/routes-name.dart';
import 'package:head_hunter/view/companyView/job/post-job-view.dart';
import 'package:provider/provider.dart';

import '../providers/loading-provider.dart';
import '../utils/constants/colors.dart';
import '../utils/extensions/global-functions.dart';
import '../utils/save-account-type.dart';
import '../view/job/apply-job-view.dart';
import 'package:head_hunter/services/similarity-service.dart';
import 'package:head_hunter/services/seeker-services.dart';

class JobServices{
  static var auth=FirebaseAuth.instance;
  static var currentUser=auth.currentUser!.uid;
  static final _storage=FirebaseStorage.instance;
  static final _jobCollection=FirebaseFirestore.instance.collection('jobs');




  static Future<void> addJob(JobPostModel model,BuildContext context)async{
    final backendProvider=Provider.of<LoadingProvider>(context,listen: false);
    final signUpProvider=Provider.of<SignUpProvider>(context,listen: false);
    final docRef=_jobCollection.doc().id;
    try{
      backendProvider.setLoading(true);
      _jobCollection.doc(docRef).set(model.toMap()).then((value)async{
        updateJob(docRef, {'jobId':docRef});
        backendProvider.setLoading(false);
        customPrint("Job Added");
        if(context.mounted){
          showDialog(
              barrierDismissible: false,
              context: context, builder: (context){
            return  const Dialog(
                backgroundColor: whiteColor,
                child: PostSuccessDialog()
            );
          });
        }

      }
      );
    }catch(e){
      backendProvider.setLoading(false);
      customPrint(e.toString());
    }
  }
  static Future<void> updateJob(String id,Map<String,dynamic>map)async{
    try{
      _jobCollection.doc(id).update(map).then((value){
        customPrint('Job updated');
      });
    }catch(e){
      customPrint(e.toString());
    }
  }



  static Stream<List<JobPostModel>> fetchAllJobForSpecificStream() {
    return _jobCollection.where('companyId',isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        if (doc.exists) {
          return JobPostModel.fromDoc(doc);
        }
        return null;
      }).where((data) => data != null).cast<JobPostModel>().toList();
    });
  }
  static Stream<List<JobPostModel>> fetchAllJobStream() {
    return _jobCollection
        .snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        if (doc.exists) {
          return JobPostModel.fromDoc(doc);
        }
        return null;
      }).where((data) => data != null).cast<JobPostModel>().toList();
    });
  }
  static Stream<List<JobPostModel>> fetchAllJobStreamForUserApplied(String userId) {
    return _jobCollection.where('applicationsId',arrayContains: userId)
        .snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        if (doc.exists) {
          return JobPostModel.fromDoc(doc);
        }
        return null;
      }).where((data) => data != null).cast<JobPostModel>().toList();
    });
  }
  static Future<List<JobPostModel>> fetchAllJobOnce() async {
    try {
      QuerySnapshot snapshot = await _jobCollection.get();
      return snapshot.docs.map((doc) {
        if (doc.exists) {
          return JobPostModel.fromDoc(doc);
        }
        return null;
      }).where((data) => data != null).cast<JobPostModel>().toList();
    } catch (e) {
      customPrint("Error fetching Job: $e");
      return [];
    }
  }
  static Future<List<JobPostModel>> fetchAllJob(String type) async {
    try {
      QuerySnapshot snapshot = await _jobCollection.get();
      return snapshot.docs.map((doc) {
        if (doc.exists) {
          return JobPostModel.fromDoc(doc);
        }
        return null;
      }).where((data) => data != null).cast<JobPostModel>().toList();
    } catch (e) {
      customPrint("Error fetching Job: $e");
      return [];
    }
  }
  static Future<void> addToJobList(String id, String userId, BuildContext context) async {
    try {
      // Get job details
      JobPostModel? job = await fetchJobData(id);
      if (job == null) throw Exception('Job not found');

      // Get user's resume URL
      SeekerModel? user = await UserServices.fetchUserData(userId);
      if (user == null || user.resumeUrl == null) throw Exception('User resume not found');

      // Calculate similarity score
      double similarityScore = await SimilarityService.calculateSimilarity(
        user.resumeUrl!,
        job.jobDescription
      );

      // Update the job with application details
      await _jobCollection.doc(id).update({
        'applicationsId': FieldValue.arrayUnion([userId]),
        'applicationDetails': FieldValue.arrayUnion([{
          'userId': userId,
          'resumeUrl': user.resumeUrl,
          'similarityScore': similarityScore,
          'appliedAt': FieldValue.serverTimestamp()
        }])
      });

      // Show success dialog
      if (context.mounted) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return const Dialog(
              backgroundColor: whiteColor,
              child: AppliedSuccessDialog(),
            );
          }
        );
      }
    } catch (e) {
      print('Error in addToJobList: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error applying for job: ${e.toString()}'))
        );
      }
    }
  }
  static Future<void> removeFromJobList(String id,String userId)async{
    await _jobCollection.doc(id).update({
      'applicationsId':FieldValue.arrayRemove([userId])
    }).then((v){

    });
  }
  static Future<JobPostModel?>fetchJobData(String id)async{
    DocumentSnapshot data=await _jobCollection.doc(id).get();
    if(data.exists){
      return JobPostModel.fromDoc(data);
    }
    return null;
  }
  static Stream<JobPostModel?> fetchJobStream(String id){
    return _jobCollection.doc(id).snapshots().map((data){
      if(data.exists){
        return JobPostModel.fromDoc(data);
      }else {
        return null;
      }
    });
  }



}