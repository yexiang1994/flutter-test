import 'package:flutter/material.dart';

class ComInput extends StatefulWidget {
  
  String label="";
  String value="";
  String placeholder="请输入...";
  Icon icon = null;
  bool obscureText = false;

  ComInput({
    this.label, 
    this.value,
    this.placeholder,
    this.icon, 
    this.obscureText});

  @override
  _ComInputState createState() => _ComInputState();
  
}

class _ComInputState extends State<ComInput> {
  
  void changeValue(e)=>{

  };
  void setDefaultVal()=>{
    // value = 
  };

  // void 
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  TextField(
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.placeholder,
          prefixIcon: widget.icon,
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 15, bottom: 10, top:10),
        ),
        onChanged: changeValue,
        obscureText: widget.obscureText ?? false,
        controller: TextEditingController(text: widget.value),
        // onSubmitted: setDefaultVal
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[400],
            width: 1,
          )
        )
      ),
    );
  }
}