

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {

  int x=0;
  int y=0;
  num z=0;

  late final AppLifecycleListener _listener;

  final displayOneController=TextEditingController();
  final displayTwoController=TextEditingController();

  @override
  void initState() 
  {
    super.initState();
    displayOneController.text=x.toString();
    displayTwoController.text=y.toString();

    _listener=AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume:_onResume,
      onDetach: _onDetach,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
      onStateChange: _onStateChange
      
    );
  }

  void _onShow()=>print("onShow called");
  void _onHide()=>print("onHide called");
  void _onInactive()=>print("onInactive called");
  void _onPause()=>print("onPause called");
  void _onDetach()=>print("onDetach called");
  void _onResume()=>print("onResume called");
  void _onRestart()=>print("onRestart called");
  void _onStateChange(AppLifecycleState state)=>print("onStateChange called with : $state");

  @override
  void dispose() {
    displayOneController.dispose();
    displayTwoController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(35.0),
      child: Column(
        children: [
           CalculatorDisplay(controller:displayOneController), // since we haven't passed anything to displayOne so it takes null and by default if the hint is null so it will so 'Enter a number'
          const SizedBox(height: 30),
           CalculatorDisplay(controller:displayTwoController),
          const SizedBox(height: 30),
           Text(z.toString(),
          style:  const TextStyle(
            color: Color.fromARGB(255, 198, 170, 57),
            fontSize: 40,
            fontWeight: FontWeight.w600
            ),),
          const Spacer(),
        
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              FloatingActionButton(onPressed: (){
                setState(() {
                   z=num.tryParse(displayOneController.text)! + num.tryParse(displayTwoController.text)!;
                });
               
                
              },
              child:const Icon(CupertinoIcons.add),),

               FloatingActionButton(onPressed: (){
                 setState(() {
                   z=num.tryParse(displayOneController.text)! - num.tryParse(displayTwoController.text)!;
                });
                
               },
              child:const Icon(CupertinoIcons.minus),),

               FloatingActionButton(onPressed: (){
                 setState(() {
                   z=num.tryParse(displayOneController.text)! * num.tryParse(displayTwoController.text)!;
                });
               },
              child:const Icon(CupertinoIcons.multiply),),
               FloatingActionButton(onPressed: (){
                 setState(() {
                   z=num.tryParse(displayOneController.text)! / num.tryParse(displayTwoController.text)!;
                });
               },
              child:const Icon(CupertinoIcons.divide),),
              
              FloatingActionButton(onPressed: (){
                 setState(() {
                  x=0;
                  y=0;
                  z=0;
                  displayOneController.clear();
                  displayTwoController.clear();
            });
              },child: const Icon(CupertinoIcons.delete)

          )],
          ),
        
         
        ],
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({ this.hint="Enter a number", super.key,required this.controller });

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        color: Colors.white70,
        fontWeight:FontWeight.bold
      ),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(            
        border:OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Colors.white30
        )
      ),
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.white54
          )
        ) ,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70)
      ),
    );
  }
}