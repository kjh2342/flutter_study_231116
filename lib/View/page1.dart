import 'package:flutter/material.dart';
import 'package:flutter_study_231116/ViewModel/count_viewmodel.dart';
import 'package:provider/provider.dart';


class Page1 extends StatelessWidget{
  Page1({super.key, required this.title, required this.countViewModel});
  final String title;
  final CountViewModel countViewModel;
  Widget lv = ListView();

  @override
  Widget build(BuildContext context){
    lv = _countList(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Third Page: MVVM Test"),
        ),
        body: Center(
            child: Row(
              children: [
                SizedBox(width: 100),
                Consumer<CountViewModel>(
                  builder: (context, provider, child){
                    return Text(provider.count.toString(),
                      style: TextStyle(
                          fontSize: 30,
                          color: [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.indigo, Colors.purple][provider.count - 1]
                      ),
                    );
                  },
                ),
                SizedBox(width: 100),
                lv,
              ],
            )
        ),
        floatingActionButton: Row(
          children: [
            SizedBox(width:30),
            FloatingActionButton(
              onPressed: countViewModel.incrementCount,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: countViewModel.decrementCount,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        )
    );
  }

  Widget _countList(BuildContext context){
    return Consumer<CountViewModel>(
      builder: (context, provider, child){
        return ListView.builder(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(8),
          itemCount: provider.count,
          itemBuilder: (context, index){
            return Container(
                height: 30 + index*10,
                color: provider.colorss[index],
                //decoration: BoxDecoration(color: provider.colorss[index]),
                child: Text(provider.textList[index],
                    style: TextStyle(
                      fontSize: 10 + index * 4,
                      fontWeight: ((){
                        if(index < 4){
                          return FontWeight.normal;
                        }
                        else{
                          return FontWeight.bold;
                        }
                      })(),
                    ))
            );
          },
        );
      },
    );
  }
}
