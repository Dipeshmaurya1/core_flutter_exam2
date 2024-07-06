import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/Model.dart';
// import 'homePage.dart';
class AddPage extends StatefulWidget {
  const AddPage({super.key});
  @override
  State<AddPage> createState() => _AddPageState();
}
ImagePicker imagePicker =ImagePicker();
class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffEF6B6E),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back,color: Colors.white,size: 30,)),
          centerTitle: true,
          title: Text(
            "Add Data",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ...List.generate(
                  StudentDataList.length,
                      (index) => Center(
                    child: Container(
                      padding: EdgeInsets.all(25),
                      margin: EdgeInsets.only(bottom: 10),
                      height: 430,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow.shade100,
                      ),
                      child: Column(
                        children: [

                          CircleAvatar(
                            radius: 55,
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
                          SizedBox(height: 10,),
                          TextFormField(
                            cursorColor: Colors.black,
                            controller: StudentDataList[index].Gird!,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1)),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black,width: 2 )),
                                hintText: ("Enter Grid"),
                              labelText: 'GRID',
                              labelStyle: TextStyle(color: Colors.black)
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            cursorColor: Colors.black,
                            controller: StudentDataList[index].name!,
                            decoration: InputDecoration(
                              enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black,width: 2 )),
                              hintText: ("Enter Name "),
                              labelText: 'NAME',
                              labelStyle: TextStyle(color: Colors.black)
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            cursorColor: Colors.black,
                            controller: StudentDataList[index].std!,
                            decoration: InputDecoration(
                              enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black,width: 2 )),
                              hintText: ("Enter Std "),
                                labelText: 'STD',
                                labelStyle: TextStyle(color: Colors.black)
                            ),
                          ),
                          SizedBox(height: 20,),
                           ElevatedButton(onPressed: () {
                             Navigator.of(context).pushNamed('/');
                           },
                               style: ButtonStyle(
                                 backgroundColor: MaterialStateProperty.all<Color>(Colors.pink.shade50),
                               ),
                               child:Text('Submit',style: TextStyle(color: Colors.black,fontSize: 20),)),
                        ],
                      ),
                    ),
                  )),

            ],
          ),
        ),
      ),
    );
  }
}
//   Widget build(BuildContext context) {
//     return SafeArea(child: Scaffold(
//       appBar: AppBar(
//         leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,),),
//         backgroundColor: Colors.cyan.shade700,
//         centerTitle: true,
//         title: Text(
//           'Add Data',style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w700),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             ...List.generate(StudentDataList.length, (index) => Center(
//               child: Container(
//                 height: 200,
//                 width: 300,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colors.cyan.shade50,
//                 ),
//               ),
//             ),)
//           ],
//         ),
//       ),
//     ));
//   }
// }
