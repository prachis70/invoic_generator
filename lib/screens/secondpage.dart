
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/firstpage.dart';
class generator extends StatefulWidget {
  const generator({super.key});

  @override
  State<generator> createState() => _generatorState();
}

class _generatorState extends State<generator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1B1F),
      appBar: AppBar(
          title: Text(
            'Home Page',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed('/sc');
              setState(() {
                for(int i=0; i<ProductList.length; i++)
                {
                  amount = (double.parse(ProductList[i].productPrice!.text) * (double.parse(ProductList[i].productQty!.text)));
                  amountList.add(amount);

                  total = total + amountList[i];
                }
                gst = total * 18/100;
                pay = gst + total;
              });
            }, child: Text('Save',style: TextStyle(color: Colors.blue,fontSize: 25),))
          ],
          centerTitle: true,
          backgroundColor: Color(0xff1C1B1F)),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  TextEditingController txtname = TextEditingController();
                  TextEditingController txtprice = TextEditingController();
                  TextEditingController txtqty = TextEditingController();
                  setState(() {
                    ProductList.add(ProductModel(
                      productName: txtname,
                      productPrice: txtprice,
                      productQty: txtqty,
                    ));
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.add,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Add Product',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              ...List.generate(ProductList.length, (index) =>  Container(
                margin: EdgeInsets.all(15),
                height: 280,
                width: 280,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.cart,
                            color: Colors.blue.shade900,
                            size: 15,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 180,
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: ProductList[index].productName,
                              decoration: InputDecoration(
                                label: Text('product name'),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.cart,
                            color: Colors.blue.shade900,
                            size: 25,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 180,
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: ProductList[index].productQty,
                              decoration: InputDecoration(
                                label: Text('qty'),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.currency_rupee,
                            color: Colors.blue.shade900,
                            size: 25,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 200,
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: ProductList[index].productPrice,
                              decoration: InputDecoration(
                                label: Text('product price'),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0,left: 120),
                        child: TextButton(
                            onPressed: () => showDialog(
                              context: context, builder: (context) => AlertDialog(
                              backgroundColor: Color(0xff1C1B1F),
                              title: Text('Delete',style: TextStyle(color: Colors.white),),
                              content: Text('Delete your Product!',style: TextStyle(color: Colors.white),),
                              actions: [
                                TextButton(onPressed: () {
                                  Navigator.pop(context);
                                }, child: Text('Cancle')),
                                TextButton(onPressed: () {
                                  setState(() {
                                    ProductList.removeAt(index);
                                  });
                                  Navigator.pop(context);
                                }, child: Text('Ok'))
                              ],

                            ),
                            ),
                            child: Text('Remove',style: TextStyle(color: Colors.white,fontSize: 20),)),
                      )
                    ],
                  ),
                ),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}

List ProductList = [];
class ProductModel
{
  TextEditingController? productName;
  TextEditingController? productPrice;
  TextEditingController? productQty;

  ProductModel({this.productName,this.productPrice,this.productQty});
}
