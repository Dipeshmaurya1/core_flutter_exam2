import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/Model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}ImagePicker imagePicker =ImagePicker();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffEF6B6E),
          centerTitle: true,
          title: Text("Student Data",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w700),),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height:10),
              ... List.generate(StudentDataList.length, (index) => Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10.0),
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(StudentDataList[index].Gird!.text,style:TextStyle(color: Colors.black,fontSize: 20),),
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: (StudentDataList[index].image!=null)?FileImage(StudentDataList[index].image!):AssetImage('assets/image/coreExam.png'),


                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(StudentDataList[index].name!.text,style:TextStyle(color: Colors.black,fontSize: 20),),
                          Text(StudentDataList[index].std!.text,style:TextStyle(color: Colors.black,fontSize: 20),),
                        ],
                      ),
                      InkWell(onTap:() {
                        showDialog(context: context, builder: (context)=>AlertDialog(
                          backgroundColor: Colors.yellow.shade50,
                          title: Center(child: Text("Edit Data")),
                          content: Container(
                            height: 500,
                            width: 360,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage:(StudentDataList[index].image!=null)?FileImage(StudentDataList[index].image!):AssetImage('assets/image/coreExam.png'),
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: InkWell(
                                          onTap: ()
                                          async {
                                            XFile? xFileImage= await imagePicker.pickImage(source: ImageSource.gallery);
                                            setState(() {
                                              StudentDataList[index].image=File(xFileImage!.path);
                                            });
                                          },
                                          child: Icon(Icons.photo,color: Colors.black,size: 25,)),

                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    cursorColor: Colors.black,
                                    controller: StudentDataList[index].Gird!,
                                    decoration: InputDecoration(
                                        enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1)),
                                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black,width: 2 )),
                                        hintText: ("Enter Grid"),
                                      labelText: 'Edit Grid',
                                      labelStyle: TextStyle(color: Colors.black)
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                  TextFormField(
                                    cursorColor: Colors.black,
                                    controller: StudentDataList[index].name!,
                                    decoration: InputDecoration(
                                      enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1)),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black,width: 2)),
                                      hintText: ("Enter Name "),
                                        labelText: 'Edit Name',
                                        labelStyle: TextStyle(color: Colors.black)
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                  TextFormField(
                                    cursorColor: Colors.black,
                                    controller: StudentDataList[index].std!,
                                    decoration: InputDecoration(
                                      enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1)),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black,width: 2)),
                                      hintText: ("Enter Std "),
                                        labelText: 'Edit Std',
                                        labelStyle: TextStyle(color: Colors.black)
                                    ),
                                  ),
                                  SizedBox(height: 20,),

                                  ElevatedButton(onPressed: () {
                                    Navigator.of(context).pushNamed('/');
                                  },style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.pink.shade50),
                                  ),
                                      child: Text("Update",style: TextStyle(color: Colors.black,fontSize: 20))),
                                ],
                              ),
                            ),

                          ),
                        ));
                      },child: Icon(Icons.edit,size: 25,)),
                      InkWell(onTap:() {
                        setState(() {
                          StudentDataList.removeAt(index);
                        });
                      },child: Icon(Icons.delete,size: 25,color: Colors.red,)),
                      // SizedBox(),
                    ],
                  ),
                ),
              ))


            ],
          ),
        ),
        floatingActionButton: InkWell(
          onTap: () {
            TextEditingController student_name =TextEditingController();
            TextEditingController student_grid =TextEditingController();
            TextEditingController student_standard =TextEditingController();
            setState(() {
              StudentDataList.add(StudentModal(name: student_name,Gird: student_grid,std: student_standard));
            });
            Navigator.of(context).pushNamed('/add');
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Color(0xffEF6B6E),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.add,color: Colors.white,size: 40,),
          ),
        ),

      ),
    );
  }
}
