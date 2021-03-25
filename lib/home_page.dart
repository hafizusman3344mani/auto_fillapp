import 'package:auto_fillapp/branch_model.dart';
import 'package:auto_fillapp/db_service.dart';
import 'package:auto_fillapp/update_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  CollectionReference ref = FirebaseFirestore.instance.collection('branches');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: ref.orderBy('id').snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                        return ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (BuildContext context, int index) {

                            var id = snapshot.data.docs[index].id;
                            print(id);
                            BranchModel branch =
                                BranchModel.branchFromFireStore(
                                    snapshot.data.docs[index].data());

                            return ListTile(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UpdateScreen(branchModel: branch,docId: id,)));
                              },
                              title: Text(branch.name),
                              leading: Text(branch.id.toString()),
                              trailing: Text(branch.branchAddress),
                            );
                          },
                        );
                      })),
              ElevatedButton(
                child: Text('Insert'),
                onPressed: () {
                  BranchModel branchModel = BranchModel(
                      id: 3,
                      name: 'usman',
                      isVerified: true,
                      branchAddress: 'Lahore');
                  FireStoreService().addUser(branchModel);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
