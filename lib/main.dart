import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'furniture.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Furniture App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          secondaryHeaderColor: Colors.black,
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Initial Selected Value
  String dropdownvalue = 'Cabana';

  //Initial value for the checkboxes
  String selected = "";

  //Checkbox values
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "Zone A",
      "subtitle": "10 Cabanas Available",
    },
    {
      "id": 1,
      "value": false,
      "title": "Zone B",
      "subtitle": "15 Cabanas Available",
    },
    {
      "id": 2,
      "value": false,
      "title": "Zone C",
      "subtitle": "12 Cabanas Available",
    },
    {
      "id": 3,
      "value": false,
      "title": "Zone D",
      "subtitle": "8 Cabanas Available",
    },
  ];

  // Boolean for checkbox
  bool valuefirst = false;
  bool valuesecond = false;

  // List of items in our dropdown menu
  var items = [
    'Cabana',
    'Bench',
    'Lounge Chairs',
  ];
  int _stackIndex = 0;

  String verticalGroupValue = "Yes";

  final List<String> status = ["Yes", "No"];

  String msg = 'Flutter RaisedButton Example';

  @override
  Widget build(BuildContext context) => Scaffold(

    appBar: AppBar(
      title: const Text("Furniture Application"),
    ),

    body: IndexedStack(
      index: _stackIndex,
      children: <Widget>[
        // Column(
        //   children: <Widget>[
        //     RadioGroup<String>.builder(
        //       groupValue: _verticalGroupValue,
        //       onChanged: (value) => setState(() {
        //         _verticalGroupValue = value!;
        //       }),
        //       items: _status,
        //       itemBuilder: (item) => RadioButtonBuilder(
        //         item,
        //       ),
        //       activeColor: Colors.red,
        //     ),
        //     RadioGroup<String>.builder(
        //       groupValue: _verticalGroupValue,
        //       onChanged: (value) => setState(() {
        //         _verticalGroupValue = value!;
        //       }),
        //       items: _status,
        //       itemBuilder: (item) => RadioButtonBuilder(
        //         item,
        //         textPosition: RadioButtonTextPosition.left,
        //       ),
        //     ),
        //   ],
        // ),

        Padding(
          padding: const EdgeInsets.all(10.0),

        child: Column(
          children: [


             const Align(
              alignment: Alignment.centerLeft,
              child: Text("Are you on a Beach Furniture?", style: TextStyle(fontSize: 18),),
            ),
            DropdownButton(
              alignment: Alignment.topLeft,

              // Initial Value
              value: verticalGroupValue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: status.map((String status) {
                return DropdownMenuItem(
                  value: status,
                  child: Text(status),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newStatus) {
                setState(() {
                  verticalGroupValue = newStatus!;
                });
              },
            ),

         // RadioGroup<String>.builder(
         //
         //      direction: Axis.horizontal,
         //      groupValue: _verticalGroupValue,
         //      horizontalAlignment: MainAxisAlignment.start,
         //      onChanged: (value) => setState(() {
         //        _verticalGroupValue = value!;
         //      }),
         //      items: _status,
         //      textStyle: const TextStyle(
         //          fontSize: 15,
         //          color: Colors.blue
         //      ),
         //      itemBuilder: (item) => RadioButtonBuilder(
         //        item,
         //
         //      ),
         //    ),
            Container(

              alignment: Alignment.centerLeft,
              // ignore: unrelated_type_equality_checks
              child: verticalGroupValue == "Yes"
                  ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your furniture number',
                  ),
                  validator: (value){
                    if(value!.isEmpty ||
                        !RegExp(r'^\D{5 }$')
                            .hasMatch(value)){
                      return 'e.g "AC1" for Zone A C for Cabana and 1 for Cabana number';
                    } return null;
                  },
                ),
              ) : SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),

                    labelText: 'Enter the Cabana number close to you',
                  ),
                ),
              ),
            ),

          ],
        ),
        ),

        //Start of the Second Tab, "Buy A furniture on the beach" Tab

        Padding(
        padding: const EdgeInsets.all(10.0),

          
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
              const Align(
                child: Text('Buy A Furniture on the Beach', style: TextStyle( fontSize: 18),),
                ),
                DropdownButton(
                  alignment: Alignment.topLeft,

                // Initial Value
                  value: dropdownvalue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                },
              ),


                //Card Section with checked radio buttons

                Column(
                    children: <Widget>[
                      const SizedBox(width: 10,),
                      Column(
                        children: List.generate(
                          checkListItems.length,
                          (index) => Card(
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            dense: true,
                            secondary: const Icon(Icons.airline_seat_recline_extra_outlined, size: 32,),
                            title: Text(checkListItems[index]["title"]),
                            subtitle: Text(checkListItems[index]["subtitle"]),
                            value: checkListItems[index]["value"],
                            onChanged: (value) {
                              setState(() {
                                for (var element in checkListItems) {
                                  element["value"] = false;
                                }
                                checkListItems[index]["value"] = value;
                              });
                            },
                          ),
                          ),
                        ),
                      ),


                      //End of Card Section


                      // Card(
                      // child: CheckboxListTile(
                      //   controlAffinity: ListTileControlAffinity.trailing,
                      //   secondary: const Icon(Icons.airline_seat_recline_extra_outlined, size: 40,),
                      //   title: const Text('Zone B'),
                      //   subtitle: const Text('13 Cabanas available'),
                      //   value: this.valuesecond,
                      //   onChanged: (value) {
                      //     setState(() {
                      //       this.valuesecond = value!;
                      //     });
                      //   },
                      // ),
                      // ),
                      // Card(
                      //   child: CheckboxListTile(
                      //     controlAffinity: ListTileControlAffinity.trailing,
                      //     secondary: const Icon(Icons.airline_seat_recline_extra_outlined, size: 40,),
                      //     title: const Text('Zone C'),
                      //     subtitle: const Text('8 Cabanas available'),
                      //     value: this.valuesecond,
                      //     onChanged: (value) {
                      //       setState(() {
                      //         this.valuesecond = value!;
                      //       });
                      //     },
                      //   ),
                      // ),
                      // Card(
                      //   child: CheckboxListTile(
                      //     controlAffinity: ListTileControlAffinity.trailing,
                      //     secondary: const Icon(Icons.airline_seat_recline_extra_outlined, size: 40,),
                      //     title: const Text('Zone D'),
                      //     subtitle: const Text('3 Cabanas available'),
                      //     value: this.valuesecond,
                      //     onChanged: (value) {
                      //       setState(() {
                      //         this.valuesecond = value!;
                      //       });
                      //     },
                      //   ),
                      // ),
                    ],
                  )



                // Column(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     InkWell(
                //       onTap: () {
                //         Navigator.pushReplacement(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => const HomePage(),
                //           ),
                //         );
                //       },
                //       child: Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 12.0),
                //         child: SizedBox(
                //           height: 147,
                //           width: MediaQuery.of(context).size.width,
                //           child: Stack(
                //             alignment: Alignment.center,
                //             children: [
                //               Positioned(
                //                 left: 0,
                //                 right: 0,
                //                 bottom: 8,
                //                 top: 0,
                //                 child: Container(
                //                     decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(10),
                //                       image: const DecorationImage(
                //                         image: NetworkImage(
                //                             "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                //                         fit: BoxFit.cover,
                //                       ),
                //                     ),
                //                     height: 147,
                //                     width: MediaQuery.of(context).size.width,
                //                     child: Row(
                //                       children: [
                //                         Container(
                //                           width: MediaQuery.of(context)
                //                               .size
                //                               .width /
                //                               1.75,
                //                           color: Colors.transparent,
                //                         ),
                //                         const Icon(
                //                           Icons.airline_seat_recline_extra_outlined,
                //                           size: 40,
                //
                //                         )
                //                       ],
                //                     )),
                //               ),
                //               Positioned(
                //                 width: 18,
                //                 bottom: 0,
                //                 child: Center(
                //                   child: Container(
                //                     height: 15,
                //                     width: 15,
                //                     decoration: BoxDecoration(
                //                       color: Colors.white,
                //                       borderRadius: BorderRadius.circular(50),
                //                     ),
                //                     child: Radio(
                //                       activeColor: Colors.green,
                //                       overlayColor: MaterialStateProperty.all(
                //                           Colors.red),
                //                       value: 1,
                //                       groupValue: 1,
                //                       onChanged: (int? value) {},
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     const Divider(color: Colors.transparent,),
                //     InkWell(
                //       onTap: () {
                //         Navigator.pushReplacement(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => const HomePage(),
                //           ),
                //         );
                //       },
                //       child: Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 12.0),
                //         child: SizedBox(
                //           height: 147,
                //           width: MediaQuery.of(context).size.width,
                //           child: Stack(
                //             alignment: Alignment.center,
                //             children: [
                //               Positioned(
                //                 left: 0,
                //                 right: 0,
                //                 bottom: 8,
                //                 top: 0,
                //                 child: Container(
                //                     decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(10),
                //                       image: const DecorationImage(
                //                         image: NetworkImage(
                //                             "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                //                         fit: BoxFit.fill,
                //                       ),
                //                     ),
                //                     height: 147,
                //                     width: MediaQuery.of(context).size.width,
                //                     child: Row(
                //                       children: [
                //                         Container(
                //                           width: MediaQuery.of(context)
                //                               .size
                //                               .width /
                //                               1.75,
                //                           color: Colors.transparent,
                //                         ),
                //                         Image.network(
                //                           "https://cdn.pixabay.com/photo/2017/07/08/09/49/red-2483933_960_720.jpg",
                //                           height: 114,
                //                           width: 114,
                //                         ),
                //                       ],
                //                     )),
                //               ),
                //               Positioned(
                //                 width: 18,
                //                 bottom: 0,
                //                 child: Center(
                //                   child: Container(
                //                     height: 15,
                //                     width: 15,
                //                     decoration: BoxDecoration(
                //                       color: Colors.white,
                //                       borderRadius: BorderRadius.circular(50),
                //                     ),
                //                     child: Radio(
                //                       activeColor: Colors.green,
                //                       overlayColor: MaterialStateProperty.all(
                //                           Colors.red),
                //                       value: 1,
                //                       groupValue: 1,
                //                       onChanged: (int? value) {},
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     const Divider(color: Colors.transparent,),
                //     InkWell(
                //       onTap: () {
                //         Navigator.pushReplacement(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => const HomePage(),
                //           ),
                //         );
                //       },
                //       child: Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 12.0),
                //         child: SizedBox(
                //           height: 147,
                //           width: MediaQuery.of(context).size.width,
                //           child: Stack(
                //             alignment: Alignment.center,
                //             children: [
                //               Positioned(
                //                 left: 0,
                //                 right: 0,
                //                 bottom: 8,
                //                 top: 0,
                //                 child: Container(
                //                     decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(10),
                //                       image: const DecorationImage(
                //                         image: NetworkImage(
                //                             "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                //                         fit: BoxFit.fill,
                //                       ),
                //                     ),
                //                     height: 147,
                //                     width: MediaQuery.of(context).size.width,
                //                     child: Row(
                //                       children: [
                //                         Container(
                //                           width: MediaQuery.of(context)
                //                               .size
                //                               .width /
                //                               1.75,
                //                           color: Colors.transparent,
                //                         ),
                //                         Image.network(
                //                           "https://cdn.pixabay.com/photo/2017/07/08/09/49/red-2483933_960_720.jpg",
                //                           height: 114,
                //                           width: 114,
                //                         ),
                //                       ],
                //                     )),
                //               ),
                //               Positioned(
                //                 width: 18,
                //                 bottom: 0,
                //                 child: Center(
                //                   child: Container(
                //                     height: 15,
                //                     width: 15,
                //                     decoration: BoxDecoration(
                //                       color: Colors.white,
                //                       borderRadius: BorderRadius.circular(50),
                //                     ),
                //                     child: Radio(
                //                       activeColor: Colors.green,
                //                       overlayColor: MaterialStateProperty.all(
                //                           Colors.red),
                //                       value: 1,
                //                       groupValue: 1,
                //                       onChanged: (int? value) {},
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

            //     Card(
            //       child: Column(
            //         mainAxisSize: MainAxisSize.min,
            //         children: const <Widget>[
            //           ListTile(
            //             leading: Icon(Icons.cabin_outlined, size: 40),
            //             title: Text('Zone B'),
            //             subtitle: Text('8 Cabanas Available'),
            //           ),
            //           TextButton(
            //             onPressed: null,
            //             child: Text('Buy Now',  style:
            //             TextStyle(fontSize: 12, color: Colors.white, backgroundColor: Colors.blue, height: 2, fontWeight: FontWeight.bold, decoration: TextDecoration.none), ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Card(
            //       child: Column(
            //         mainAxisSize: MainAxisSize.min,
            //         children: const <Widget>[
            //           ListTile(
            //             leading: Icon(Icons.cabin_outlined, size: 40),
            //             title: Text('Zone C'),
            //             subtitle: Text('9 Cabanas Available'),
            //           ),
            //           TextButton(
            //             onPressed: null,
            //             child: Text('Buy Now',  style:
            //             TextStyle(fontSize: 12, color: Colors.white, backgroundColor: Colors.blue, height: 2, fontWeight: FontWeight.bold, decoration: TextDecoration.none), ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Card(
            //       child: Column(
            //         mainAxisSize: MainAxisSize.min,
            //         children: const <Widget>[
            //           ListTile(
            //             leading: Icon(Icons.cabin_outlined, size: 40),
            //             title: Text('Zone D'),
            //             subtitle: Text('12 Cabanas Available'),
            //           ),
            //           TextButton(
            //             onPressed: null,
            //             child: Text('Buy Now',  style:
            //             TextStyle(fontSize: 12, color: Colors.white, backgroundColor: Colors.blue, height: 2, fontWeight: FontWeight.bold, decoration: TextDecoration.none), ),
            //           ),
            //         ],
            //       ),
            //     )
            ]
          )
        ),
      ],
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          label: "Order Product",
          icon: Icon(
            Icons.shopping_bag,
          ),
        ),
        BottomNavigationBarItem(
          label: "Buy Furniture",
          icon: Icon(
            Icons.beach_access_rounded,
          ),
        ),
        // BottomNavigationBarItem(
        //   label: "Order Product",
        //   icon: Icon(
        //     Icons.shopping_bag,
        //   ),
        // ),
      ],
      currentIndex: _stackIndex,
      onTap: (index) => setState(
            () => _stackIndex = index,
      ),
    ),
  );
}