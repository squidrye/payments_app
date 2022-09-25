import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomCard extends StatefulWidget {
  var orderAmount;
  CustomCard({Key? key,this.orderAmount}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(left: 6, right: 6, top: 6, bottom: 0),
            child: ListTile(
              leading: CircleAvatar(
                  radius: 30,
                  child: Image.network(
                      "https://media.istockphoto.com/vectors/human-face-avatar-icon-profile-for-social-network-man-vector-vector-id1227618801?s=612x612")),
              title: Text("Francis Handy",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text("084-432-234"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0, bottom: 6, left: 6, right: 6),
            child: ListTile(
              leading: Container(
                height: 78,
                width: 70,
                child: ClipRRect(
                  child: Image.network(
                      "https://cdn-icons-png.flaticon.com/512/2133/2133151.png",
                      fit: BoxFit.contain),
                ),
              ),
              title: Text("Travel Card",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text("Master Card - 3345"),
              trailing:
              IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(27),
            width: 130,
            child: TextField(
              style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
              showCursor: false,
              controller: widget.orderAmount,
              decoration: InputDecoration(
                hintText: "Price",
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            child: Text("Dinner",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.montserrat().fontFamily)),
          ),
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xA2ABC0FF),
            ),
            child: Center(
                child: Text("Gas fees (2.5) will be applied",
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ),
        ]));
  }
}
