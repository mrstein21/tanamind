import 'package:flutter/material.dart';
import 'package:tanamind/ui/forum/detail_post/detail_post.dart';

abstract class DetailPostViewModel extends State<DetailPost> {
  var question = {
    "name": "Dinesh Chugtai",
    "image": "assets/dummy/dinesh.jpg",
    "replies": "4",
    "question":
        "bagaimana cara menurunkan dan mendapatkan nutrisi air 300-500 ppm ?",
    "date": "5 days ago"
  };

  var answer = [
    {
      "name": "Betram Gillfoyle",
      "image": "assets/dummy/gillfoyle.jpg",
      "replies": "4",
      "answer":
          "kalau menurunkan ppm tidak bisa kecuali dengan threatment khusus seperti di PDAM. sebaiknya dicoba saja dulu menambahkan nutrisinya hingga 1200 ppm, lihat perkembangan tanaman seperti apa nantinya",
      "date": "5 days ago"
    },
    {
      "name": "Jared Dunn",
      "image": "assets/dummy/jared.jpg",
      "replies": "4",
      "answer": "Lorem ipsum sim dolor amet",
      "date": "5 days ago"
    },
    {
      "name": "Richard Hendrick",
      "image": "assets/dummy/richard.jpg",
      "replies": "4",
      "answer": "Lorem ipsum sim dolor amet",
      "date": "5 days ago"
    }
  ];
}
