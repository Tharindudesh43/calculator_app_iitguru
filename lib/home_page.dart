import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String PreVCalations = " ";
  List<String> PrevData = [];

  int count_pixel = 0;

  String txtvalue = " ";
  List<String> storeData = [];
  num lastvalue = 0;
  int count = 0;
  String? operationStore = "";

//---------------------------- --------
  storevalues_and_cal(String data) {
    if (data == "=") {
      savedata();
      if (operationStore == "+") {
        summation();
        txtvalue = txtvalue.toString();
        storeData.clear();
      } else if (operationStore == "-") {
        substraction();
        txtvalue = txtvalue.toString();
        storeData.clear();
      } else if (operationStore == "x") {
        multiplication();
        txtvalue = txtvalue.toString();
        storeData.clear();
      } else if (operationStore == "/") {
        divition();
        txtvalue = txtvalue.toString();
        storeData.clear();
      } else if (operationStore == "%") {
        modulas();
        txtvalue = txtvalue.toString();
        storeData.clear();
      }
    } else if (data == "%" ||
        data == "/" ||
        data == "x" ||
        data == "-" ||
        data == "+") {
      if (data == "+") {
        //------------------------------
        String LastValue = PrevData.last;
        if (LastValue == "+" ||
            LastValue == "-" ||
            LastValue == "/" ||
            LastValue == "x" ||
            LastValue == "%") {
          PrevData.last = "+";
          PreVCalations = PrevData.join();
          setState(() {
            PreVCalations;
          });
        } else {
          PrevData.add("+");
          PreVCalations = PrevData.join();
          setState(() {
            PreVCalations;
          });
        }
        //------------------------------

        if (operationStore == "-") {
          substraction();
        } else if (operationStore == "x") {
          multiplication();
        } else if (operationStore == "/") {
          divition();
        } else if (operationStore == "%") {
          modulas();
        } else {
          operationStore = "+";
          summation();
        }
        operationStore = "+";

        //test values check
        print("txtvalue: " + txtvalue);
        print("lastvalue: " + lastvalue.toString());
        storeData.clear();
      } else if (data == "-") {
        //--------------------------------
        String LastValue = PrevData.last;
        if (LastValue == "+" ||
            LastValue == "-" ||
            LastValue == "/" ||
            LastValue == "x" ||
            LastValue == "%") {
          PrevData.last = "-";
          PreVCalations = PrevData.join();
          setState(() {
            PreVCalations;
          });
        } else {
          PrevData.add("-");
          PreVCalations = PrevData.join();
          setState(() {
            PreVCalations;
          });
        }
        //--------------------------------

        if (operationStore == "+") {
          summation();
        } else if (operationStore == "x") {
          multiplication();
        } else if (operationStore == "/") {
          divition();
        } else if (operationStore == "%") {
          modulas();
        } else {
          operationStore = "-";
          substraction();
        }
        operationStore = "-";

        //test values check
        print("txtvalue: " + txtvalue);
        print("lastvalue: " + lastvalue.toString());
        storeData.clear();
      } else if (data == "/") {
        //--------------------------------
        String LastValue = PrevData.last;
        if (LastValue == "+" ||
            LastValue == "-" ||
            LastValue == "/" ||
            LastValue == "x" ||
            LastValue == "%") {
          PrevData.last = "/";
          PreVCalations = PrevData.join();
          setState(() {
            PreVCalations;
          });
        } else {
          PrevData.add("/");
          PreVCalations = PrevData.join();
          setState(() {
            PreVCalations;
          });
        }
        //--------------------------------

        if (operationStore == "+") {
          summation();
        } else if (operationStore == "x") {
          multiplication();
        } else if (operationStore == "-") {
          substraction();
        } else if (operationStore == "%") {
          modulas();
        } else {
          operationStore = "/";
          divition();
        }
        operationStore = "/";
        //test values check
        print("txtvalue: " + txtvalue);
        print("lastvalue: " + lastvalue.toString());
        storeData.clear();
      } else if (data == "x") {
        //-------------------------------
        String LastValue = PrevData.last;
        if (LastValue == "+" ||
            LastValue == "-" ||
            LastValue == "/" ||
            LastValue == "x" ||
            LastValue == "%") {
          PrevData.last = "x";
          PreVCalations = PrevData.join();
          setState(() {
            PreVCalations;
          });
        } else {
          PrevData.add("x");
          PreVCalations = PrevData.join();
          setState(() {
            PreVCalations;
          });
        }
        //-------------------------------

        if (operationStore == "+") {
          summation();
        } else if (operationStore == "-") {
          substraction();
        } else if (operationStore == "/") {
          divition();
        } else if (operationStore == "%") {
          modulas();
        } else {
          operationStore = "x";
          multiplication();
        }
        operationStore = "x";

        //test values check
        print("txtvalue: " + txtvalue);
        print("lastvalue: " + lastvalue.toString());
        storeData.clear();
      } else if (data == "%") {
        //------------------------------
        String LastValue = PrevData.last;
        if (LastValue == "+" ||
            LastValue == "-" ||
            LastValue == "/" ||
            LastValue == "x" ||
            LastValue == "%") {
          PrevData.last = "%";
          PreVCalations = PrevData.join();
          setState(() {
            PreVCalations;
          });
        } else {
          PrevData.add("%");
          PreVCalations = PrevData.join();
          setState(() {
            PreVCalations;
          });
        }
        //------------------------------

        if (operationStore == "+") {
          summation();
        } else if (operationStore == "x") {
          multiplication();
        } else if (operationStore == "/") {
          divition();
        } else if (operationStore == "-") {
          substraction();
        } else {
          operationStore = "%";
          modulas();
        }
        operationStore = "%";

        //test values check
        print("txtvalue: " + txtvalue);
        print("lastvalue: " + lastvalue.toString());
        storeData.clear();
      }
    } else {
      if (storeData.length < 13 && PrevData.length < 25) {
        storeData.add(data);
        txtvalue = storeData.join();
        setState(() {
          txtvalue;
        });
        PrevData.add(data);
        PreVCalations = PrevData.join();
        setState(() {
          PreVCalations;
        });
      }
    }
  }

  Future<void> savedata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int valueCount = 1;

    if (prefs.containsKey("count")) {
      valueCount = prefs.getInt("count")!;
      prefs.setInt("count", valueCount + 1);
    } else {
      prefs.setInt("count", 1);
    }
    prefs.setString("Val_$valueCount", "$PreVCalations = $lastvalue");
  }

  summation() {
    if (count != 0) {
      txtvalue = txtvalue;
      String StringList = storeData.join();
      num Int_List = double.parse(StringList);
      lastvalue = lastvalue + Int_List;
      txtvalue = lastvalue.toString();
      count++;
    } else {
      String StringList = storeData.join();
      num Int_List = double.parse(StringList);
      lastvalue = lastvalue + Int_List;
      count++;
    }
  }

  substraction() {
    if (count != 0) {
      String StringList = storeData.join();
      num Int_List = double.parse(StringList);
      lastvalue = lastvalue - (Int_List);
      txtvalue = lastvalue.toString();
      count++;
    } else {
      String StringList = storeData.join();
      num Int_List = double.parse(StringList);
      lastvalue = Int_List;
      count++;
    }
  }

  divition() {
    if (count != 0) {
      String StringList = storeData.join();
      num Int_List = double.parse(StringList);
      lastvalue = lastvalue / (Int_List);
      txtvalue = lastvalue.toString();
      count++;
    } else {
      String StringList = storeData.join();
      num Int_List = double.parse(StringList);
      lastvalue = Int_List;
      count++;
    }
  }

  multiplication() {
    if (count != 0) {
      String StringList = storeData.join();
      num Int_List = double.parse(StringList);
      lastvalue = lastvalue * (Int_List);
      txtvalue = lastvalue.toString();
      count++;
    } else {
      String StringList = storeData.join();
      num Int_List = double.parse(StringList);
      lastvalue = Int_List;
      count++;
    }
  }

  modulas() {
    if (count != 0) {
      String StringList = storeData.join();
      num Int_List = double.parse(StringList);
      lastvalue = lastvalue % (Int_List);
      txtvalue = lastvalue.toString();
      count++;
    } else {
      String StringList = storeData.join();
      num Int_List = double.parse(StringList);
      lastvalue = Int_List;
      count++;
    }
  }
//-------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 8),
            IconButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  //prefs.clear();
                  int count = prefs.getInt("count")!;
                  List<ListTile> calhistory = [];
                  for (int i = 1; i < count; i++) {
                    print(prefs.getString("Val_$i"));
                    calhistory.add(ListTile(
                      title: Text(
                        "${prefs.getString("Val_$i")}",
                        style: const TextStyle(color: Colors.black),
                      ),
                      tileColor: Colors.blueAccent,
                    ));
                  }

                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(10),
                      child: ListView(
                        children: calhistory,
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.history,
                  color: Colors.white,
                )),
            const SizedBox(
              height: 75,
            ),
            Text(
              PreVCalations,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              txtvalue,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    calculatorButton(btnname: 'mc'),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          storeData.clear();
                          PrevData.clear();
                          setState(() {
                            PreVCalations = PrevData.join();
                          });
                          setState(() {
                            txtvalue = storeData.join("");
                          });
                          count = 0;
                          lastvalue = 0;
                        },
                        child: Container(
                          width: 55,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'c',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    calculatorButton(btnname: '7'),
                    calculatorButton(btnname: '4'),
                    calculatorButton(btnname: '1'),
                    calculatorButton(btnname: '%'),
                  ],
                ),
                Column(
                  children: [
                    calculatorButton(btnname: 'm+'),

                    //-------------------------
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          storeData.removeLast();
                          PrevData.removeLast();
                          setState(() {
                            PreVCalations = PrevData.join();
                          });
                          setState(() {
                            txtvalue = storeData.join("");
                          });
                          count = 0;
                          lastvalue = 0;
                        },
                        child: Container(
                          width: 55,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "<",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //----------------------------

                    calculatorButton(btnname: '8'),
                    calculatorButton(btnname: '5'),
                    calculatorButton(btnname: '2'),
                    calculatorButton(btnname: '0'),
                  ],
                ),
                Column(
                  children: [
                    calculatorButton(btnname: 'm-'),
                    calculatorButton(btnname: '/', isOperatorButton: true),
                    calculatorButton(btnname: '9'),
                    calculatorButton(btnname: '6'),
                    calculatorButton(btnname: '3'),
                    calculatorButton(btnname: '.'),
                  ],
                ),
                Column(
                  children: [
                    calculatorButton(btnname: 'mr'),
                    calculatorButton(btnname: 'x', isOperatorButton: true),
                    calculatorButton(btnname: '-', isOperatorButton: true),
                    calculatorButton(btnname: '+', isOperatorButton: true),
                    calculatorButton(
                        btnname: '=',
                        isEqalButton: true,
                        isOperatorButton: true),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding calculatorButton(
      {required String btnname,
      bool isEqalButton = false,
      bool isOperatorButton = false}) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
          if (btnname == "mc" ||
              btnname == "m+" ||
              btnname == "m-" ||
              btnname == "mr") {
          } else {
            storevalues_and_cal(btnname);

            setState(() {
              btnname;
            });
            //Data in Storedata
            print(storeData);
          }
        },
        child: Container(
          width: 55,
          height: isEqalButton == true ? 104 : 50,
          decoration: BoxDecoration(
            color: isOperatorButton == true
                ? Color.fromARGB(255, 38, 154, 98)
                : Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              btnname,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
