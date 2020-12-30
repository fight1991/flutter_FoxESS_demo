import "package:flutter/material.dart";
class Station extends StatefulWidget {
  @override
  _Station createState() => _Station();
}

class _Station extends State<Station> with SingleTickerProviderStateMixin {
  List tabs = ['All', 'Normal', 'Abnormal', 'Offline'];
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }
  @override
  void dispose() {
    super.dispose();
    // _tabController = null;
  }
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(scaffoldBackgroundColor: Color(0xfff4f4f4)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Station'),
          centerTitle: true,
          leading: Text(''),
          elevation: 0.0,
          actions: <Widget>[Icon(Icons.add)],
          bottom: TabBar(
            labelColor: Theme.of(context).textTheme.bodyText2.color,
            unselectedLabelColor: Colors.black26,
            controller: _tabController,
            tabs: tabs.map((v) => Tab(text: v)).toList(),
            onTap: (int index){print(tabs[index]);},
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: tabs.map((e) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(maxHeight: 35.0),
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))
                    ),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.black45,),
                        hintText: 'Search SN'
                      )
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index){
                        return CardItem(type: e,);
                      }
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        )
      ),
    );
  }
}
class CardItem extends StatelessWidget {
  final type;
  CardItem({
    Key key,
    @required this.type,
  }): super(key: key);
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10.0),
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.restore),
                Icon(Icons.more_horiz)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage("images/pv_icon.png"), width: 70.0, fit: BoxFit.cover,),
                SizedBox(height: 15.0,),
                Text('wuxihahah lala',style: TextStyle(color: Color(0xff749BBD)),),
                SizedBox(height: 5.0,),
                Text('2010/11/24 03:39', style: TextStyle(fontSize: 12.0, color: Colors.black45),)
              ],
            ),
            Divider(color: Colors.black12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Today's energy(kWh)", style: TextStyle(fontSize: 12.0, color: Color(0xff749BBD)),),
                    SizedBox(height: 5.0,),
                    Text('121.3')
                  ],
                ),
                SizedBox(
                  width: 1.0,
                  height: 20.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text("Power now(kW)", style: TextStyle(fontSize: 12.0, color: Color(0xff749BBD))),
                    SizedBox(height: 5.0,),
                    Text('12121221.3')
                  ],
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
