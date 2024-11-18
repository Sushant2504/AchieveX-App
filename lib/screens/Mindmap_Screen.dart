import 'package:flutter/material.dart';

class MindmapScreen extends StatefulWidget{
   
   @override
   _MindmapScreenState createState() => _MindmapScreenState();
}

class _MindmapScreenState extends State<MindmapScreen> {
    @override
    Widget build(BuildContext context) {
         return Scaffold(
           appBar: AppBar(
             title: Text('Mindmap'),
           ),
           
         );
    }
}