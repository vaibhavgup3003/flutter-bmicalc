import 'package:flutter/material.dart';
import 'refractored.dart';
import 'constants.dart';
import 'result.dart';
import 'CalculatorBrain.dart';
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  Color malecol = kcontainerColor;
  Color femalecol = kcontainerColor;
  int height = 0 ;
  int weight = 0;
  int age = 30;
  void updateCol(int gender) {
    if(gender == 1){
      malecol = kactiveColor;
      femalecol = kcontainerColor;
    }
    else{
      femalecol = kactiveColor;
      malecol  = kcontainerColor;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kappbarColor,
        // elevation: 1,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateCol(1);
                      });
                    },
                    child: NewWidget(
                        iconData(Icons.male, 'MALE'),
                        malecol
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateCol(2);
                      });
                    },
                    child: NewWidget(
                        iconData(Icons.female, 'FEMALE'),
                        femalecol
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
                child: Column(
                  children: [

                    Text('HEIGHT',style: klabelTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text( height.toString(), style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.w900
                        ),),
                        Text( 'cm', style: klabelTextStyle),
                      ],
                    ),
                    Slider(value: height.toDouble(),min: 0, max: 210,
                        activeColor: Colors.white, inactiveColor: Colors.grey.shade600,
                        autofocus: true, thumbColor: Colors.red,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        })

                  ],
                ),
                margin: EdgeInsets.all(15),
                height: 200, width: double.infinity,
                decoration: BoxDecoration(
                    color: kcontainerColor,
                    borderRadius: BorderRadius.circular(10)),
              )
          ),
          Row(
            children: [
              Expanded(
                child: NewWidget(
                    Column(
                      children: [
                        SizedBox(height: 20),
                        Text('WEIGHT',style: klabelTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(weight.toString(), style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w900
                            ),),
                            Text( 'KGS', style: klabelTextStyle),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(onPressed: (){setState(() {
                              weight++;
                            });},
                              backgroundColor: Color(0xff4c4f5e),
                              autofocus: true,
                              child: Icon(Icons.add, color: Colors.white
                              ),
                            ),
                            SizedBox(width: 20,),
                            FloatingActionButton(onPressed: (){setState(() {
                              weight--;
                            });},
                              backgroundColor: Color(0xff4c4f5e),
                              autofocus: true,
                              child: Icon(Icons.linear_scale_sharp, color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    kcontainerColor
                ),
              ),
              Expanded(
                child: NewWidget(
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Text('AGE',style: klabelTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(age.toString(), style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w900
                          ),),
                          Text( 'Years', style: klabelTextStyle),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(onPressed: (){setState(() {
                            age++;
                          });},
                              backgroundColor: Color(0xff4c4f5e),
                              autofocus: true,
                              child: Icon(Icons.add, color: Colors.white
                              ),
                          ),
                          SizedBox(width: 20,),
                          FloatingActionButton(onPressed: (){setState(() {
                            age--;
                          });},
                            backgroundColor: Color(0xff4c4f5e),
                            autofocus: true,
                            child: Icon(Icons.linear_scale_sharp, color: Colors.white
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                  kcontainerColor,
                ),
              ),
            ],
          ),
          bottombutton('CALCULATE', (){
            CalculatorBrain calc =
            CalculatorBrain(height, weight);
    Navigator.push(context, MaterialPageRoute(builder: (context) => result_page(
      calc.calculateBMI(),
      calc.getResult(),
      calc.getInterpretation(),
    )));
    },)
        ],
      ),
    );
  }
}

