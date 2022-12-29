// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class getUsername extends StatelessWidget {
// //  const getUser({super.key});
//   final String documentId;
//   getUsername({required this.documentId});

//   @override
//   Widget build(BuildContext context) {
//     // get the collection
//     CollectionReference users = FirebaseFirestore.instance.collection('users');

//     return FutureBuilder<DocumentSnapshot>(
//       future: users.doc(documentId).get(),
//       builder: ((context, snapshot) {

//        if (snapshot.hasError) {
//           return Text("Something went wrong");
//         }
        
//         if (snapshot.hasError) {
//           return Text("Something went wrong");
//         }

//       // data is output to the user
//       if (snapshot.connectionState == ConnectionState.done) {
//         Map<String, dynamic> data =
//             snapshot.data!.data() as Map<String, dynamic>;
//             return Text('Full Name:${data['Full Name']}');
//       }

//       return Text('loading..');
//     })
//     );
//   }
// }
