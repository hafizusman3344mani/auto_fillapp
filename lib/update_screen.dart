import 'package:auto_fillapp/branch_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  final BranchModel branchModel;
  final docId;

  const UpdateScreen({this.branchModel,this.docId});

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController _nameController;

  TextEditingController _addressController;

  CollectionReference ref = FirebaseFirestore.instance.collection('branches');

  @override
  void initState() {
    _nameController = TextEditingController();
    widget.branchModel.name != null
        ? _nameController.text = widget.branchModel.name
        : "";

    _addressController = TextEditingController();
    widget.branchModel.branchAddress != null
        ? _addressController.text = widget.branchModel.branchAddress
        : "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              TextField(
                controller: _nameController,
              ),
              TextField(
                controller: _addressController,
              ),
              ElevatedButton(
                onPressed: () {
                 ref.doc(widget.docId).update({'name':_nameController.text,'branchAddress':_addressController.text});
                },
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
