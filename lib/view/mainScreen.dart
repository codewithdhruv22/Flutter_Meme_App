import 'package:flutter/material.dart';
import 'package:unsad/controller/fetchMeme.dart';
import 'package:unsad/controller/saveMyData.dart';


class MainScreen extends StatefulWidget {
   MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String imgUrl = "";
  int? memeNo;
  int targetMeme = 100;
bool isLoading = true;



@override
  void initState() {
    // TODO: implement initState

    super.initState();

      GetInitMemeNo();


    UpdateImg();
  }


  GetInitMemeNo() async{
    memeNo = await SaveMyData.fetchData() ?? 0;
    if(memeNo!>100){
      targetMeme = 500;
    }else if(memeNo! > 500){
      targetMeme  = 1000;
    }
    setState(() {

    });
  }
  void UpdateImg() async{

    String getImgUrl = await FetchMeme.fetchNewMeme();
    // imgUrl = getImgUrl;
    setState(() {
      imgUrl = getImgUrl;
isLoading  = false;
    });

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
            ),
            Text(
              "Meme #${memeNo.toString()}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Target ${targetMeme} Memes",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 30,
            ),
            isLoading ?
            Container(
                height : 400,
                width : MediaQuery.of(context).size.width,
                child : Center(
                    child : SizedBox(
                        height : 60,
                        width : 60,
                        child: CircularProgressIndicator())
                )
            )
                :


            Image.network(
height : 400,
                width : MediaQuery.of(context).size.width,
                fit : BoxFit.fitHeight,
                imgUrl),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async{
                  setState(() {
                    isLoading = true;

                  });
                  await SaveMyData.saveData(memeNo!+1);
                  GetInitMemeNo();

                  UpdateImg();

                },
                child: Container(
                    height: 50,
                    width: 150,
                    child: Center(
                        child: Text(
                      "More Fun!!",
                      style: TextStyle(fontSize: 20),
                    )))),
            Spacer(),
            Text(
              "APP CREATED BY",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "CODE WITH DHRUV",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
