import 'package:flutter/material.dart';

import 'forum_home.dart';

abstract class ForumHomeViewModel extends State<ForumHome>{
  var list_question=[
    {
      "name":"Richard Hendrick",
      "image":"assets/dummy/richard.jpg",
      "replies":"3",
      "question":"Bagaimana pemasaran sayuran hidroponik ?",
      "date":"3 days ago"
    },{
      "name":"Dinesh Chugtai",
      "image":"assets/dummy/dinesh.jpg",
      "replies":"4",
      "question":"Kalau tidak mempunyai alat ukur,Bagaimana cara mengukur kepekaan nutrisi hidroponik?",
      "date":"5 days ago"
    },{
      "name":"Jared Dunn",
      "image":"assets/dummy/jared.jpg",
      "replies":"10",
      "question":"Sayur apa yang mudah ditanam ?",
      "date":"4 days ago"
    }
  ];



  var list_topic=[
    {
      "name":"Alat Hidroponik",
      "image":"assets/dummy/hidroponik.jpg"
    },
    {
      "name":"Pembibitan",
      "image":"assets/dummy/bibit_kangkung.jpg"
    },{
      "name":"Pengairan",
      "image":"assets/dummy/pompa_air.jpg"
    }
  ];
}