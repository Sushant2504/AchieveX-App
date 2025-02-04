import 'package:flutter/material.dart';

class MindmapScreen extends StatefulWidget{
  const MindmapScreen({super.key});

   
   @override
   _MindmapScreenState createState() => _MindmapScreenState();
}

class _MindmapScreenState extends State<MindmapScreen> {
    @override
    Widget build(BuildContext context) {
         return Scaffold(
           appBar: AppBar(
             title: const Text('Mindmap'),
           ),
           
         );
    }
}